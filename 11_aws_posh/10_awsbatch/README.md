# README

Demonstrate using the official AWS Powershell Module for Batch to diagnose failed jobs and grab logstreams.  

## Install & Configure

```sh
# install macoxs
brew install powershell

# linux (should be in standard package provider)

# open shell
pwsh   
```

## Run Show-Queues

```ps1
# you'll need to auth with AWS first, copy and edit the .env.template.ps1 file.
. ./.env.ps1   
./show-queues.ps1  
```

## Troubleshoot batch

```ps1
# show the queue names
. ./.env.ps1   
./troubleshoot-batch.ps1 -showqueues

# list all failed jobs on the queue
$queuename="my-queuename"
./troubleshoot-batch.ps1 -jobs -queue $queuename -status "FAILED" 

# get logs for failed job
$jobid="jobid"
./troubleshoot-batch.ps1 -jobdetails -jobid $jobid 

# get attempt 2 logstream
$logstream=(./troubleshoot-batch.ps1 -jobdetails -jobid $jobid).Attempts[2].Container.LogStreamName

# pull logs for logstream
./troubleshoot-batch.ps1 -logs -logstream $logstream
# export the logs to a file
./troubleshoot-batch.ps1 -logs -logstream $logstream | Export-Csv -Path ./failed-media.txt -NoTypeInformation     

# group failures by field
(./troubleshoot-batch.ps1 -jobs -queue $queuename -status "FAILED") | sort-object "uid" | Group-Object "uid"

# group the failures by days
(./troubleshoot-batch.ps1 -jobs -queue $queuename -status "FAILED") | Select-Object *,@{Name="DoY";Expression={$_.createdAt.DayOfYear}} | Group-Object "DoY"  
(./troubleshoot-batch.ps1 -jobs -queue $queuename -status "FAILED") | Select-Object *,@{Name="DoY";Expression={$_.createdAt.toString("yyyy-MM-dd")}} | Group-Object "DoY" | select-object count,name  
# group the failures by hours
((./troubleshoot-batch.ps1 -jobs -queue $queuename -status "FAILED") | Select-Object *,@{Name="DoY";Expression={$_.createdAt.toString("yyyy-MM-dd-hh")}} | Group-Object "DoY" | select-object count,name)


$failed = ((./troubleshoot-batch.ps1 -jobs -queue $queuename -status "FAILED") | where {($_.createdAt -gt (get-date 2022-05-11))})

$success = ((./troubleshoot-batch.ps1 -jobs -queue $queuename -status "SUCCEEDED") | where {($_.createdAt -gt (get-date 2022-05-11))})
$retrybuckets = [PSCustomObject]@{
            one = 0 
            two = 0 
            three = 0 
        }

$retries = ($success | % {
    $jobid = $_.JobId
    if (((./troubleshoot-batch.ps1 -jobdetails -jobid $jobid).Attempts).Container.Length -eq 1) {
        $retrybuckets.one += 1
    }
    if (((./troubleshoot-batch.ps1 -jobdetails -jobid $jobid).Attempts).Container.Length -eq 2) {
        $retrybuckets.two += 1
        $_
    }
    if (((./troubleshoot-batch.ps1 -jobdetails -jobid $jobid).Attempts).Container.Length -ge 3) {
        $retrybuckets.three += 1
        $_
    }
})
$retrybuckets
```

## Exporting logs

```ps1
./export-jobs.ps1 -queue $queuename -export
```

## Build a table

Summarise Success and Failure for each queue  

### Prod US  

```ps1
$env:AWS_REGION="us-east-1"      
# transcode queues
./generate-job-summaries.ps1 -generate -queues $queuename1,$queuename2
```


## Installation

```ps1
# ensure powershellget is installed
Install-Module -Name PowerShellGet -RequiredVersion 2.2.1 -Force

# install batch module 
Find-Module  -Name "AWS.Tools.Batch*"
Install-Module -Name "AWS.Tools.Batch"
Get-InstalledModule
Import-Module "AWS.Tools.Batch"
Find-Command -ModuleName "AWS.Tools.Common"
Find-Command -ModuleName "AWS.Tools.Batch"

# sort functions by name
Find-Command -ModuleName "AWS.Tools.Common" | sort-object Name
```

## Troubleshooting

```sh
# if modules are failing to load and you already have the modules installed try upgrading them.
Update-AWSToolsModule  
```

## Configure AWS

```ps1
Get-AWSCredential -ListProfile

# set default
Set-AWSCredential -ProfileName $profilename
```

## Cloudwatch Logs

```ps1
Install-Module -Name "AWS.Tools.CloudWatchLogs"  
Find-Command -ModuleName "AWS.Tools.CloudWatchLogs"  
Import-Module "AWS.Tools.CloudWatchLogs"  

Get-CWLLogEvent -LogGroupName "/aws/batch/job" -LogStreamNamePrefix "logstream/default/e118a5d1cf2e4582927c0d5e88719388"       
(Get-CWLLogEvent -LogGroupName "/aws/batch/job" -LogStreamName "logstream/default/e118a5d1cf2e4582927c0d5e88719388").Events  

# get environment variables for the job
(Get-BATJobDetail -Job 83cac4f9-5f91-47ed-88c0-9d66333c547c).Container.Environment.Value

# get out of memory failures
./troubleshoot-batch.ps1 -jobs -queue $queuename | where { if ($null -ne $_.Reason) {$_.Reason.StartsWith("OutOfMemoryError")} else { return False} } | select JobId | % { (Get-BATJobDetail -Job $_.JobId).Container.Environment.Value}
```

## Cloudwatch Metrics

This is not working

```ps1
Install-Module -Name "AWS.Tools.CloudWatch"  
Find-Command -ModuleName "AWS.Tools.CloudWatch"  
Import-Module "AWS.Tools.CloudWatch"  

```

## Resources  

* aws/aws-tools-for-powershell repo [here](https://github.com/aws/aws-tools-for-powershell)  
* AWS Tools for PowerShell - Installation [here](https://docs.aws.amazon.com/powershell/latest/reference/Index.html)  
* Job definition parameters [here](https://docs.aws.amazon.com/batch/latest/userguide/job_definition_parameters.html)  
