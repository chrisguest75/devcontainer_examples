# README

Demonstrate using the official AWS Powershell Module for ECS

NOTE: With the `Get-ECSTaskDetail` cmdlet use `ConvertTo-Json -depth 100` on the returned object to see all fields.  

TODO:  

* find the logs from the task.  

## Run Show-Clusters

```ps1
pwsh

. ./.env.ps1   
# get the clusters
./troubleshoot-ecs.ps1 -showclusters

# get services on cluster
./troubleshoot-ecs.ps1 -services  -cluster "arn:aws:ecs:region:account:cluster/name"

# get tasks on cluster
./troubleshoot-ecs.ps1 -tasks -cluster "arn:aws:ecs:region:account:cluster/name"
```

```powershell
# get details for a task (including TAGS)
Get-ECSTaskDetail -cluster "mycluster" -Task "arn:aws:ecs:region:account:task/clustername/taskid" -include TAGS | convertto-json -depth 100

# 
Get-ECSContainerInstanceDetail -ContainerInstance "aa0d4bd6-75f6-4dd2-b77b-e5fc5124fc71" | convertto-json -depth 100
```

## Troubleshooting logs

```powershell
New-Item -Path "." -Name "out" -ItemType "directory" -Force
./troubleshoot-ecs.ps1 -logs -logstream "logs/stream" -loggroup "groupname" |  Export-Csv -Path ./out/task.txt -NoTypeInformation    
```

### Kill old tasks

```powershell
# get all tasks on cluster
$tasks=(./troubleshoot-ecs.ps1 -tasks -cluster "arn:aws:ecs:region:account:cluster/clustername")

# get taskdefinitions
Get-ECSTaskDefinitionList

# get tasks older than 6 hours
$taskdefinition="mytaskdefinition"
$oldtasks=($tasks | where { (($_.createdAt.addhours(6) -lt (get-date )) -and ($_.jobDefinition -eq $taskdefinition)) })

$oldtasks | foreach-object { stop-ecstask -task $_.TaskArn -cluster $cluster}
```


```powershell
# Get-ECSCapacityProvider

# (Get-ECSClusterDetail -Cluster "arn:aws:ecs:us-east-1:accountid:cluster/cluster").Clusters

# Get-ECSTaskDefinitionList
# (Get-ECSTaskDefinitionDetail -TaskDefinition arn:aws:ecs:us-east-1:accountid:task-definition/definition:44).TaskDefinition

# (Get-ECSTaskDetail -Cluster "arn:aws:ecs:us-east-1:accountid:cluster/cluster"  -Task "arn:aws:ecs:us-east-1:accountid:task/containerinstance").Failures

# (Get-ECSContainerInstanceDetail -cluster "arn:aws:ecs:us-east-1:accountid:cluster/cluster"  -ContainerInstance  arn:aws:ecs:us-east-1:accountid:container-instance/containerinstance).Failures

# Get-ECSTaskDetail -Task "arn:aws:ecs:region:account:task/id"

```

## Installation

```ps1
Install-Module -Name PowerShellGet -RequiredVersion 2.2.1 -Force

Find-Module  -Name "AWS.Tools.ECS*"

Install-Module -Name "AWS.Tools.ECS"
Get-InstalledModule
Import-Module "AWS.Tools.ECS"
Find-Command -ModuleName "AWS.Tools.Common"
Find-Command -ModuleName "AWS.Tools.ECS"

# sorted by name
Find-Command -ModuleName "AWS.Tools.ECS" | sort-object Name


# list organisations 
Find-Module  -Name "AWS.Tools.Organizations*"
Install-Module  -Name "AWS.Tools.Organizations"
Get-ORGRoot 
Get-ORGAccountList

Get-ECSTaskDetail -Task "arn:aws:ecs:region:account:task/id"
```

## Configure AWS

```ps1
Get-AWSCredential -ListProfile

# set default
Set-AWSCredential -ProfileName $profilename
```

## Resources  

* aws/aws-tools-for-powershell repo [here](https://github.com/aws/aws-tools-for-powershell)
* AWS Tools for PowerShell - Installation [here](https://docs.aws.amazon.com/powershell/latest/reference/Index.html)
* Get-ECSTaskDetail Returns Only ServiceName
 [here](https://github.com/aws/aws-tools-for-powershell/issues/136)  