#!/bin/sh
#                        _____ __
#      ____  _________  / __(_) /__
#     / __ \/ ___/ __ \/ /_/ / / _ \
#    / /_/ / /  / /_/ / __/ / /  __/
#   / .___/_/   \____/_/ /_/_/\___/
#  /_/
# Posix login shell profile config file.

# XDG standard directories:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_SCRIPT_HOME="$HOME/.local/bin"
export XDG_SRC_HOME="$HOME/.local/src"

# Add `$XDG_SCRIPT_HOME` and all subdirectories to $PATH
BLACKLIST='/.git' 	# Add more items to blacklist with <item1>\|<item2>\|<item3>...
export PATH="$PATH:$(du "$XDG_SCRIPT_HOME" | cut -f2 | grep -v "$BLACKLIST" | tr '\n' ':' | sed 's/:*$//')"
export PATH="$PATH:$HOME/.local/src/julia/bin"
#export TERMINFO='/usr/lib/terminfo'
export TERMINAL='/usr/local/bin/xst'
export TERM='xterm-256color'
export OPENER='xdg-open'
export EDITOR='kak'
export PAGER='bat'
export BROWSER='qutebrowser'
export FILE='lf'
export SUDO_ASKPASS="$XDG_SCRIPT_HOME/uitools/raskpass"
export PGDATA="$HOME/data/db/postgres/data13"
export KERNEL_RELEASE="$(uname -or)"

# Clean up home
export LESSHISTFILE="-"
export BDOTDIR="$XDG_CONFIG_HOME/bash"
export INPUTRC="$BDOTDIR/inputrc"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export PSQLRC="$XDG_CONFIG_HOME/postgres/psqlrc"
export ALIASDIR="$XDG_SCRIPT_HOME/aliases"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export GOPATH="$XDG_SRC_HOME/go"
export PYLINTRC="$XDG_CONFIG_HOME/pylint/pylintrc"
export GRIPHOME="$XDG_CONFIG_HOME/grip"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"

# Set less/man colors
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"; a="${a%_}"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"; a="${a%_}"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"; a="${a%_}"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"; a="${a%_}"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"; a="${a%_}"

# Start graphical server if bspwm not already running.
#[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x bspwm >/dev/null && exec startx

# Switch escape <-> caps if in tty
case "$(tty)" in
	*tty*) kbdcontrol -l "$XDG_CONFIG_HOME/kbd/us.custom.kbd";;
	*pty*) ;;
esac
