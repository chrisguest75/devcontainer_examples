#!/usr/bin/env pwsh
#Set-StrictMode -Version Latest

<#
.Synopsis
Export jobs from given queue into directories for analysis  

.Description
Export jobs from given queue into directories for analysis 

.Parameter queue
Name of queue to export

.Parameter status
The status of jobs to export

.Parameter export
Tell it to export

.Parameter help
Show help

.Example
Show queue names
./export-jobs.ps1 -queue queuename -export


#>
param(
    [Parameter(Mandatory=$false)][switch]$help=$false,
    [Parameter(Mandatory=$false)][switch]$export=$false,
    [Parameter(Mandatory=$false)][string]$queue="",
    [Parameter(Mandatory=$false)][string]$status="FAILED",
    [Parameter(Mandatory=$false)][int]$jobs=10
)

function Export-Jobs([string]$queuename="", [string]$status="FAILED", [int]$jobs=10) {
    $baseDir = "out"
    New-Item -Path "." -Name $baseDir -ItemType "directory" -Force
    
    # get logstreams for failed jobs
    $streams = (./troubleshoot-batch.ps1 -jobs -queue $queuename -status "FAILED") | select-object -Last $jobs | % { 
        $details = (./troubleshoot-batch.ps1 -jobdetails -jobid $_.JobId)
        $logstreams = @()
        for($index = 0; $index -lt $details.Attempts.container.length; $index++) {
            $logstreams += $details.Attempts[$index].Container.LogStreamName
        } 
        [PSCustomObject]@{
            LogStreams=$logstreams
            JobId=$_.jobid
        }
    } 
    
    # export logs for failed jobs
    $streams | % {
        $jobid = $_.JobId
        New-Item -Path $baseDir -Name ($jobid) -ItemType "directory" -Force

        $outfile = Join-Path $baseDir ($jobid) ($jobid + ".config")
        (./troubleshoot-batch.ps1 -jobdetails -jobid $jobid).Container.Environment | Export-Csv -Path $outfile -NoTypeInformation   
        $outfile = Join-Path $baseDir ($jobid) ($jobid + ".container")
        (./troubleshoot-batch.ps1 -jobdetails -jobid $jobid).Container | convertto-json -depth 100 | set-content  $outfile
        $outfile = Join-Path $baseDir ($jobid) ($jobid + ".job")
        (./troubleshoot-batch.ps1 -jobdetails -jobid $jobid) | convertto-json -depth 100 | set-content  $outfile

        for($index = 0; $index -lt $_.logstreams.length; $index++) {
            $logstream = $_.logstreams[$index]
            $outfile = Join-Path $baseDir ($jobid) ($jobid + "_" + $index + ".txt")
            (./troubleshoot-batch.ps1 -logs -logstream $logstream | Export-Csv -Path $outfile -NoTypeInformation)    
        } 
    }
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


if ($export) {
    if($queue -eq "")
    {
        Write-Host "Queue name is missing (use -queue)"
        return
    }

    Export-Jobs -queuename $queue -status $status -jobs $jobs
}

