Import-Module oh-my-posh
Set-PoshPrompt -Theme chrisguest
#Set-PoshPrompt -Theme powerline

Import-Module -Name Terminal-Icons

Set-PSReadLineOption -Colors @{
    "Operator" = [ConsoleColor]::Magenta;
    "Parameter" = [ConsoleColor]::Magenta
}
