#!/bin/bash/env pwsh

Install-Module -Name "AWS.Tools.CloudWatchLogs"  
Install-Module -Name "AWS.Tools.Batch"
Install-Module -Name "AWS.Tools.ECS"
oh-my-posh --init --shell pwsh --config ~/jandedobbeleer.omp.json | Invoke-Expression
