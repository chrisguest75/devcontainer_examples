#!/usr/bin/env pwsh
#Set-StrictMode -Version Latest

<#
.Synopsis
Generate a report of the job status in the queues 

.Description
Generate a report of the job status in the queues

.Parameter generate
Tell it to generate

.Parameter help
Show help

.Example
Generate the table
./generate-job-summaries.ps1 -generate


#>
param(
    [Parameter(Mandatory=$false)][switch]$help=$false,
    [Parameter(Mandatory=$false)][switch]$generate=$false,
    [Parameter(Mandatory=$false)][string[]]$queues=@()
)

function Generate-Table([string[]]$queueList=@()) {
    $table = @{}
    $queues = $queueList | ForEach-Object {

        $queuename = $_
        $statuses = @("FAILED", "SUCCEEDED")
        $statuses |  ForEach-Object {
            $status = $_
            ((./troubleshoot-batch.ps1 -jobs -queue $queuename -status $status) | Select-Object *,@{Name="DoY";Expression={$_.createdAt.toString("yyyy-MM-dd")}} | Group-Object "DoY" | select-object count,name,@{
                label='Status'
                expression={$status}
            },@{
                label='Queue'
                expression={$queuename}
            })
        }
    }

    $grouped= ($queues | Group-Object name | sort-object name | Select-Object Name,Group)
    $queuetypes = ($grouped.Group.Queue | Sort-Object -unique)
    $statuses = ($grouped.Group.Status | Sort-Object -unique)

    $table = ($grouped | ForEach-Object {
        $group = $_
        $row = [PSCustomObject]@{
            Day = $group.Name
        }

        $queuetypes | ForEach-Object {
            $q = $_
            $total = [PSCustomObject]@{
            }
            $statuses | ForEach-Object {
                $status = $_
                $value = ($group.Group | Where-Object {($_.Status -eq $status) -and ($_.Queue -eq $q)} | Measure-Object -sum count).Sum
                add-member -inputobject $total -membertype NoteProperty -Name $_ -Value $value 
            }
            add-member -inputobject $row -membertype NoteProperty -Name $_ -Value $total
        }

        $total = [PSCustomObject]@{
        }
        $statuses | ForEach-Object {
            $status = $_
            $value = ($group.Group | Where-Object {$_.Status -eq $status} | Measure-Object -sum count).Sum
            add-member -inputobject $total -membertype NoteProperty -Name $_ -Value $value 
        }
        add-member -inputobject $row -membertype NoteProperty -Name "total" -Value $total
        $row
    })
    $table
}

#***********************************************************************************************************
#** Usage
#***********************************************************************************************************

$showhelp = $false

if ( $PSBoundParameters.Values.Count -eq 0 ) {
    $showhelp = $true
}

if(($help -eq $true) -or ($showhelp -eq $true))
{
    Get-Help $MyInvocation.MyCommand.Definition -Detailed
    return
}

if ($null -eq $env:AWS_PROFILE) {
    Write-Host "AWS_PROFILE is not set"
    return
}
if ($null -eq $env:AWS_REGION) {
    Write-Host "AWS_REGION is not set"
    return
}

Import-Module "AWS.Tools.Batch"
Import-Module "AWS.Tools.CloudWatchLogs"  
#Get-AWSCredential
Set-AWSCredential -ProfileName $env:AWS_PROFILE
#Get-DefaultAWSRegion 
Set-DefaultAWSRegion -Region $env:AWS_REGION


if ($generate) {
    if($queues.length -eq 0)
    {
        Write-Host "Queue name is missing (use -queue)"
        return
    }

    Generate-Table -queueList $queues
}

