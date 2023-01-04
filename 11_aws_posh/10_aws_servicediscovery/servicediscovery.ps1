#!/usr/bin/env pwsh
#Set-StrictMode -Version Latest

<#
.Synopsis
A set of troubleshooting scripts for dealing with ecs

.Description
A set of troubleshooting scripts for dealing with ecs

.Parameter help
Show help

.Example

./troubleshoot-ecs.ps1 -showclusters

./troubleshoot-ecs.ps1 -cluster "arn:aws:ecs:us-east-1:accountid:cluster/cluster" -services

#>
param(
    [Parameter(Mandatory=$false)][switch]$help=$false,
    [Parameter(Mandatory=$false)][switch]$services=$false
)


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

Import-Module "AWS.Tools.ServiceDiscovery"
Import-Module "AWS.Tools.CloudWatchLogs"  
#Get-AWSCredential
Set-AWSCredential -ProfileName $env:AWS_PROFILE
#Get-DefaultAWSRegion 
Set-DefaultAWSRegion -Region $env:AWS_REGION

if ($services) {
    Get-SDServiceList | select id,name
}

#Get-SDInstanceList -serviceid "srv-w26l33xldptfjlnp"