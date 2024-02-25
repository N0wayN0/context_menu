#!/bin/sh

xmenu <<EOF | sh &
Accessories
	Files	nautilus --new-window 
	nitrogen (Wallpaper Setter)	nitrogen
	PCManFM	pcmanfm
	Find duplicates	find_dupes.yad.sh
	IMG:/usr/share/icons/locolor/32x32/apps/gvim.png	Vim (Text Editor)	$TERMINAL -e vim 
Development
	Icon Browser	yad-icon-browser
	IMG:/usr/share/pixmaps/python3.7.xpm	 Python 3.7	$TERMINAL -e python3
Graphics
	IMG:/usr/share/pixmaps/display-im6.q16.xpm	ImageMagick (color depth=q16)	/usr/bin/display-im6.q16 -nostdin 
	IMG:/usr/share/icons/Papirus/48x48/categories/unity-scope-gdrive.svg	xpdf (PDF viewer)	xpdf 
Internet
	IMG:/usr/share/pixmaps/chromium.png	Chromium Web Browser (Web Browser)	/usr/bin/chromium 
	IMG:/usr/share/icons/nuoveXT2/48x48/apps/firefox.png	Firefox ESR (Web Browser)	/usr/lib/firefox-esr/firefox-esr 
	IMG:/usr/share/pixmaps/transmission.xpm	Transmission (BitTorrent Client)	transmission-gtk 
Settings
	IMG:/usr/share/icons/Adwaita/48x48/apps/preferences-desktop-theme.png	Customize Look and Feel	lxappearance
	Desktop Preferences	pcmanfm --desktop-pref
	IMG:/usr/share/icons/Adwaita/48x48/status/changes-prevent.png	 Hardwarre Info	hardinfo
Multimedia
	IMG:/usr/share/pixmaps/alsamixergui.xpm	Alsamixergui	/usr/bin/alsamixergui
	Alsaplayer	alsaplayer 
	IMG:/usr/share/icons/hicolor/32x32/apps/mpv.png	mpv Media Player	mpv --player-operation-mode=pseudo-gui -- 
 Youtube	run_youtube.sh
 Screenshot	maimpick
IMG:/usr/share/icons/Adwaita/48x48/emblems/emblem-photos.png	 Wallpaper	setbg
IMG:/usr/share/icons/gnome/8x8/emblems/emblem-noread.png	 Close Window	xdotool selectwindow windowclose

IMG:/usr/share/icons/Adwaita/48x48/apps/utilities-terminal.png	 Terminal (st)	st
Terminals
	Terminal (xterm)	xterm
	Terminal (urxvt)	urxvt

IMG:/usr/share/icons/Adwaita/48x48/status/changes-prevent.png	 Lock	slock
IMG:/root/android/res/drawable/tw_ic_lock_view_cover_power_off.png	 Shutdown		poweroff
IMG:/root/android/res/drawable/tw_ic_lock_view_cover_restart.png	 Reboot			reboot
EOF
