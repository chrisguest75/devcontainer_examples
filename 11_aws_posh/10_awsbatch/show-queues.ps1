#!/usr/bin/env pwsh
#Set-StrictMode -Version Latest

<#
.Synopsis
Show the batch queues for an account and region

.Description
Show the batch queues for an account and region

.Parameter help
Show help

.Example
./show-queues.ps1 -showqueues

#>
param(
    [Parameter(Mandatory=$false)][switch]$help=$false
)

function Show-Queues() {
    Get-BATJobQueue | select-object JobQueueName
}

#***********************************************************************************************************
#** Usage
#***********************************************************************************************************

$showhelp = $false

#if ( $PSBoundParameters.Values.Count -eq 0 ) {
#    $showhelp = $true
#}

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
Get-AWSCredential
Set-AWSCredential -ProfileName $env:AWS_PROFILE
Get-DefaultAWSRegion 
Set-DefaultAWSRegion -Region $env:AWS_REGION
Show-Queues