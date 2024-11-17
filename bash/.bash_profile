# /etc/skel/.bash_profile

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
if [[ -f ~/.bashrc ]] ; then
	. ~/.bashrc
fi

[ -s "/home/tarffie/.jabba/jabba.sh" ] && source "/home/tarffie/.jabba/jabba.sh"

export PATH="$HOME/.elan/bin:$PATH"
