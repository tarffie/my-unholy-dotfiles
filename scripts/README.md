# What are those

Some scripts that I made because I'm too lazy or just can't actually remember
the commands that I usually need

## installation
install them by cloning the repo into where you'd like to
example:
```sh
git clone https://github.com/tarffie/my-unholy-dotfiles.git ~/.local/opt
chmod +x ~/.local/opt/my-unholy-dotfiles/scripts/{start,stop,sync}-vm.sh
```
and then providing symbolic links

example:
```sh
ln -sf $HOME/.local/opt/my-unholy-dotfiles/sync-vm.sh  ~/.local/bin/sync-vm
ln -sf $HOME/.local/opt/my-unholy-dotfiles/start-vm.sh ~/.local/bin/start-vm
ln -sf $HOME/.local/opt/my-unholy-dotfiles/stop-vm.sh  ~/.local/bin/stop-vm
```

You could also use sudo or doas and link any of them to 
`/usr/local/bin/{start,stop,sync}-vm`

## start-vm | stop-vm

Those are two scripts to start or stop a vm with VirtualBox CLI 

## sync-vm util

This is a script that can sync any folder with some machine at the network. 
It is originally thought to my personal use on FreeBSD-14.3-RELEASE, but it
should work fine on other OS.

usage:
```sh
    sync-vm <the_directory you wanna sync> <the address of the machine you want to be synced>
```

you can also set a machine on .ssh/config
example usage: 
```sh
    sync-vm $(pwd) ubuntu-docker-vm # previously setted on .ssh/config file
```

# TODO
For the future I'll also provide a script to find and connect to a VM inside 
the local network without needing to worry about dynamic ip changes
