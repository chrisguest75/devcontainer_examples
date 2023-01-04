#!/usr/bin/env pwsh
#Set-StrictMode -Version Latest

<#
.Synopsis
A set of troubleshooting scripts for dealing with batch

.Description
A set of troubleshooting scripts for dealing with batch

.Parameter showqueues
Show a list of batch queues

.Parameter help
Show help

.Example
Show queue names
./troubleshoot-batch.ps1 -showqueues

Show failed jobs on the queue 
./troubleshoot-batch.ps1 -jobs -queue queuename

Show details of the job
./troubleshoot-batch.ps1 -jobdetails -jobid  6d010df1-9980-403f-bfd0-74350c5c216b

Get the job details for the container including logstream
(./troubleshoot-batch.ps1 -jobdetails -jobid  c5247910-255d-462c-a797-18a651fd0197).Attempts[0].Container

Use streamid to get log events
./troubleshoot-batch.ps1 -logs -logstream streamid/default/af975bc49b3941f993db3cdfdd003b81

# Try to find retried jobs.
./troubleshoot-batch.ps1 -jobs -queue queuename -status SUCCEEDED | ForEach-Object {(./troubleshoot-batch.ps1 -jobdetails -jobid $_.JobId).Attempts.Length } | measure -AllStats


#>
param(
    [Parameter(Mandatory=$false)][switch]$help=$false,
    [Parameter(Mandatory=$false)][switch]$showqueues=$false,
    [Parameter(Mandatory=$false)][switch]$jobs=$false,
    [Parameter(Mandatory=$false)][switch]$jobdetails=$false,
    [Parameter(Mandatory=$false)][switch]$logs=$false,
    [Parameter(Mandatory=$false)][string]$queue="",
    [Parameter(Mandatory=$false)][string]$status="FAILED",
    [Parameter(Mandatory=$false)][string]$jobid="",
    [Parameter(Mandatory=$false)][string]$logstream=""
)

function Show-Queues() {
    Get-BATJobQueue | select-object JobQueueName
}

function Show-Jobs([string]$queue="", [string]$jobstatus="FAILED") {
    $filtered = Get-BATJobList -JobQueue $queue -JobStatus $jobstatus
    $filtered | Select-Object -Property status,jobId,jobName,@{
        label='createdAt'
        expression={(Get-Date 01.01.1970)+([System.TimeSpan]::fromseconds( $_.CreatedAt/1000))}
    },@{
        label='startedAt'
        expression={(Get-Date 01.01.1970)+([System.TimeSpan]::fromseconds( $_.StartedAt/1000))}
    },@{
        label='reason'
        expression={$_.container.reason}
    },@{
        label='executionTime'
        expression={([System.TimeSpan]::fromseconds( $_.StoppedAt/1000) - ([System.TimeSpan]::fromseconds( $_.StartedAt/1000)))}
    },@{
        label='waitTime'
        expression={([System.TimeSpan]::fromseconds( $_.StartedAt/1000) - ([System.TimeSpan]::fromseconds( $_.CreatedAt/1000)))}
    },@{
        label='id'
        expression={ $_.JobName.substring(25, 22)}
    },@{
        label='uid'
        expression={ $_.JobName.substring(0, 24)}
    }
}

function Show-JobDetails([string]$jobid="") {
    Get-BATJobDetail -Job $jobid 
}

function Show-Logs([string]$logstream="") {
    $logs = (Get-CWLLogEvent -StartFromHead $true -LogGroupName "/aws/batch/job" -LogStreamName $logstream)
    $logs.Events
    $token = $logs.NextForwardToken
    while($token -ne "") { 
        $logs = (Get-CWLLogEvent -StartFromHead $true -NextToken $token -LogGroupName "/aws/batch/job" -LogStreamName $logstream)
        if ($token -ne $logs.NextForwardToken) {
            $token = $logs.NextForwardToken
            #write-host $token
        } else {
            $token = ""
        }
        $logs.Events
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

if ($showqueues) {
    Show-Queues
}

if ($jobs) {
    if($queue -eq "")
    {
        Write-Host "Queue name is missing (use -queue)"
        return
    }

    Show-Jobs -queue $queue -jobstatus $status
}

if ($jobdetails) {
    if($jobid -eq "")
    {
        Write-Host "Jobid is missing (use -jobid)"
        return
    }

    Show-JobDetails -jobid $jobid
}

if ($logs) {
    if($logstream -eq "")
    {
        Write-Host "Logstream is missing (use -logstream)"
        return
    }

    Show-Logs -logstream $logstream
}
