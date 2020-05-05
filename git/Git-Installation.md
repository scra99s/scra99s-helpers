## Install latest Git and tab completion

#### Ubuntu/Debian (Bash)
```bash
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install -y git bash-completion
git --version
```

#### Fedora/CentOS/RHEL (Bash)
```bash
sudo yum update
sudo yum remove -y git*
sudo yum install -y https://centos7.iuscommunity.org/ius-release.rpm
sudo yum install -y git2u-all bash-completion
git --version
```

#### Arch (Bash)
```bash
sudo pacman -S git bash-completion
```
