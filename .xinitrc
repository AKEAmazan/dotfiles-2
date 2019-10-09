#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap


# auto reload config files
echo ~/.Xresources | entr xrdb "$HOME/.Xresources" &
echo ~/.config/sxhkd/sxhkdrc | entr pkill -USR1 -x sxhkd &
echo ~/.config/dunst/dunstrc | entr bash -c "killall dunst; dunst & disown" &
echo ~/.config/termite/config | entr bash -c "killall -SIGUSR1 termite" &
# echo ~/.config/conky/conky.conf | entr bash -c "killall -SIGUSR1 conky" &

# font stuff
xset +fp /usr/share/fonts
xset +fp ~/.fonts
xset fp rehash

# virtualbox
# sudo modprobe vboxdrv
# sudo modprobe vboxpci
# sudo modprobe vboxnetadp
# sudo modprobe vboxnetflt


# merge in defaults and keymaps

if [ -f $sysresources ]; then

    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then

    xrdb -merge "$userresources"

fi

if [ -f "$p usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi



# fix for naked java apps in tiling WMs
# export _JAVA_AWT_WM_NOREPARENTING=1

# appearance
# xsetroot -cursor_name left_ptr
# xsetroot -solid "#282828"

# posgresql host
export PGHOST=localhost

# Access UNIX file system
export MPD_HOST=/home/kakarot/.mpd/socket

# # daemons
start-pulseaudio-X11
dunst &1
compton --config /home/kakarot/.config/compton.conf -b

 battmon &
# sxhkd &
# exec bspwm
# exec gnome-session
exec i3
# exec startlxde
