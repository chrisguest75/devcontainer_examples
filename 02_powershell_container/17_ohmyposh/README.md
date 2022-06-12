# README

Demonstrate some `oh-my-posh` basics

## Install (brew)

```sh
# can be installed using brew but not required
brew tap jandedobbeleer/oh-my-posh
brew install oh-my-posh

# show themes directory
ls -l $(brew --prefix oh-my-posh)/themes

# 
pwsh
oh-my-posh --init --shell pwsh --config ~/jandedobbeleer.omp.json | Invoke-Expression
. $PROFILE
```

## Install PSGallery

```ps1
Install-Module oh-my-posh -Scope CurrentUser -AllowPrerelease
Import-Module oh-my-posh   
```

## Load Module

```ps1
Find-Module  -Name "oh-my-posh"    
Get-InstalledModule
Import-Module oh-my-posh
```

## Configure Profile

```ps1
Get-PoshThemes       

Set-PoshPrompt -Theme Powerline     

write-host $profile

/Users/$env:USER/.config/powershell/Microsoft.VSCode_profile.ps1

/Users/$env:USER/.config/powershell/Microsoft.PowerShell_profile.ps1

cp *_profile.ps1 ~/.config/powershell/

cp ./chrisguest.omp.json ~/.oh-my-posh/themes/
#cp ./chrisguest.omp.json $(brew --prefix oh-my-posh)/themes 

```

## Terminal Icons

```ps1
Install-Module -Name Terminal-Icons -Repository PSGallery
Import-Module -Name Terminal-Icons
get-childitem
```

## Fix Colours

My standard solarised shell hides parameters.  Some default powershell colours need to be changed.  

```ps1
Set-PSReadLineOption -Colors @{
    "Operator" = [ConsoleColor]::Magenta;
    "Parameter" = [ConsoleColor]::Magenta
}
```

## Resources

* Oh My Posh A prompt theme engine for any shell. [here](https://ohmyposh.dev/docs/macos)
* JanDeDobbeleer/oh-my-posh [here](https://github.com/JanDeDobbeleer/oh-my-posh)
* My Ultimate PowerShell prompt with Oh My Posh and the Windows Terminal [here](https://www.hanselman.com/blog/my-ultimate-powershell-prompt-with-oh-my-posh-and-the-windows-terminal)
* Making Windows Terminal look awesome with oh-my-posh [here](https://zimmergren.net/making-windows-terminal-look-awesome-with-oh-my-posh/)
* Tweaking the PowerShell colour scheme to play nice with the new Windows Terminal [here](https://stevenknox.net/tweaking-powershell-color-scheme-to-play-nice-with-the-new-windows-terminal/)
