# Usefull Snippets for Windows (If your into that kind of thing)
> All snipets are copy/paste, if you want to run as scripts you will need create a ps1 for each snippet.
  1. Run Powershell as adminstrator (even if copy/paste)
  2. Set execution policy and run the script

```powershell 
powershell.exe -noprofile -executionpolicy bypass -file .\script.ps1
```

## Install WSL (Powershell)
> Because this can only make your life better (install distro of your choice after from microsoft store)
  You will need to restart eventually...
```powershell
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```


### Install Git and Posh-git for Windows (Powershell)
> Pretty sweet gives you git related prompt and tab autocomplete for git commands.
```powershell
$Downloadlocation = $env:TEMP
$GIT_Base_URL = "https://git-scm.com/download/win"
$Req = Invoke-WebRequest -UseBasicParsing -Uri $GIT_Base_URL
$DownloadLink = ($req.Links | where outerhtml -match "64-bit Git for Windows Setup").href
$file = split-path -Leaf $DownloadLink
$Outfile = Join-Path $Downloadlocation $file
Invoke-WebRequest  $DownloadLink -OutFile $Outfile
Unblock-File $Outfile
Start-Process (join-path $Downloadlocation $file) -ArgumentList "/SILENT" -Wait
$env:Path += ";C:\Program Files\Git\cmd"
Set-ExecutionPolicy -Scope LocalMachine -ExecutionPolicy RemoteSigned -Force
Install-PackageProvider NuGet -Force -scope CurrentUser;
Install-Module PowerShellGet -Force -SkipPublisherCheck
Install-Module posh-git -Scope CurrentUser -Force
Import-Module posh-git
Add-PoshGitToProfile -AllHosts
```

### Install Chrome for Windows Server (Powershell)
> This is a blessing, means you don't need to use IE at all :)
```powershell
$LocalTempDir = $env:TEMP;
$ChromeInstaller = "ChromeInstaller.exe"; 
(new-object System.Net.WebClient).DownloadFile('http://dl.google.com/chrome/install/375.126/chrome_installer.exe', "$LocalTempDir\$ChromeInstaller"); & "$LocalTempDir\$ChromeInstaller" /silent /install; 
$Process2Monitor = "ChromeInstaller"; 
Do { 
  $ProcessesFound = Get-Process | ?{$Process2Monitor -contains $_.Name} | Select-Object -ExpandProperty Name; 
  If ($ProcessesFound) { 
    "Still running: $($ProcessesFound -join ', ')" | Write-Host; Start-Sleep -Seconds 2 
  } else {
    rm "$LocalTempDir\$ChromeInstaller" -ErrorAction SilentlyContinue -Verbose 
  } 
} Until (!$ProcessesFound)
```