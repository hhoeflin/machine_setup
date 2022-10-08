# Setting up the environment in Ubuntu Server

In this environment, we expect that a recent version of git and ssh is already installed. 

First, we set the emaila and name on git (otherwise it keeps complaining)

```
git config --global user.email "hhoeflin@gmail.com"
git config --global user.name "Holger Hoefling"
```

Next, we want our configuration files local

```
git clone https://github.com/hhoeflin/wsl-devel-setup
```

In order to install the required packages, run we need to enable additional sources.

```
sudo nano /etc/apt/sources.list
```
and uncomment all lines with 'deb-src' at the beginning. Then run:
```
cd wsl-devel-setup
sudo ./setup_ubuntu.sh
```

And last we get all our configs.
```
cd ..
wsl-devel-setup/stage_dotfiles.sh https://github.com/hhoeflin/configfiles
```
