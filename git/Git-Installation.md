## Install latest Git and tab completion

#### Ubuntu/Debian (Bash)
```bash
{sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install -y git bash-completion
git --version
}
```

#### Fedora/CentOS/RHEL (Bash)
```bash
{
sudo yum update
sudo yum remove -y git*
sudo yum install -y https://centos7.iuscommunity.org/ius-release.rpm
sudo yum install -y git2u-all bash-completion
git --version
}
```

#### Arch (Bash)
```bash
sudo pacman -S git bash-completion
```

#### Windows (Powershell)
###### Run Powershell as administrator
```powershell
$Downloadlocation = $env:TEMP
$GIT_Base_URL ="https://git-scm.com/download/win"
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


