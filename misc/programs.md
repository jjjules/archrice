# Desktop environment setup

<style>H1{color:Blue;}</style>

| Type                       | Program             | Dependencies                                  |
|----------------------------|---------------------|-----------------------------------------------|
| font                       | ttf-dejavu, ttf-font-awesome, nerds-font-complete                   |
| login manager              | sddm                | [sddm-chili](https://github.com/MarianArlt/sddm-chili), qt5, qt5-quickcontrols, qt5-graphicaleffects |
| window manager             | i3-gaps             |                                               |
| status bar                 | i3blocks            |                                               |
| screen locker              | <span style="color:red">betterlockscreen</span> | |
| file browser               | ![lf](#f03c15)      | atool, mediainfo, ueberzug, ffmpegthumbnailer |
| program launcher           | dmenu, rofi         |                                               |
| notification manager       | dunst               |                                               |
| clipboard                  | xclip, xsel         |                                               |
| clipboard manager          | clipmenu            |                                               |
| wallpaper setter           | feh                 |                                               |
| brightness control         | acpilight           |                                               |
| key mapper                 | xmodmap             |                                               |
| mouse hiding               | unclutter           |                                               |
| screen temperature handler | redshift            |                                               |
| backup program             | rsync               |                                               |
| AUR package manager        | ![paru](#c5f015)    |                                               |

# File viewer / editor
## Text
text edit:		vim + gvim (clipboard) + Vundle, featherpad (standard graphical)
latex:				texlive-most
markdown:			pandoc, grip (from pip) to view in browser locally

## Image
image viewer: sxiv
image editor: pinta

## Audio
audio:				pulseaudio + pulseaudio-bluetooth
audio-gui:		pavucontrol
music player: mpd, mpc, ncmpcpp

## Video
video:				mpv
video-stream: notflix + peerflix (AUR)

## PDF
pdf:					zathura + zathura-pdf-mupdf + diffpdf (breaks xournal) + pdfgrep
pdf-bloat:		masterpdfeditor-free (AUR, program is masterpdfeditor4), foxitreader (AUR)
pdf-join:			gsjoin (function, more robust) or pdftk (better if works)

# Internet
## Connection
ssh:					openssh (+ sshpass to directly give password)
vpn:					openconnect
wifi:					networkmanager + nmcli + iw
wifi-gui:			nm-applet + stalonetray

## Browser
browser:			firefox (plugins: honey, grammarly, sci-hub, fb container, tab stash, tab focus google search,
							ublock, vimium, HTTPS everywhere)
							qutebrowser (+ pdfjs for pdf in browser)

## Mail client
mail:					mailspring (AUR) + gnome-keyring

## Torrent client
torrent:			deluge

# Programing
IDE:					vscodium (AUR), linter: flake8 (need to pipu). Extensions:
							python - ms-python
							anaconda - ms-python
							docs-view - bierner
							draw.io - hediet
							git graph - mhutchie
							jupyter - ms-toolsai
							jupyter keymap - ms-toolsai
							jupyter notebook renderer - ms-toolsai
							vim - vscodevim
							vscode-pdf - tomokj1207
python venv:	micromamba (AUR)

# Essential utils
git:					git, bfg (AUR)
calculator:		bpython
terminal navigation:	z.lua, broot
drag-gui:			dragon-drop (AUR)
visual disk info:			gdmap
cheatsheets:					tldr++ (AUR)
screenshot:		deepin-screenshot and scrot
bluetooth:		blueberry

process infos:				htop, glances
easy file transfer:		oneshot
cd ripper:		sound-juicer (gui), abcde (cli, more robust but less automation)
shell syntax: shellcheck
text conv:		docx2txt
gif viewer:		gifsicle (then gifview -a FILE)
color getter: grabc (AUR) + libx11
color conv:		convert-color-cli (npm)
conferences:	skypeforlinux-stable-bin (AUR), zoom (AUR), discord (AUR)
home cleaner:	xdg-ninja

tree file listing:		tree
mtp mounting:					simple-mtpfs and ifuse (for iphone), both AUR
pacman mirror update:	reflector
android screen share: scrcpy
handle quote in csv:	csvquote

hfs+ (mac) partition:	hfsprogs (AUR)
fat partition:				dosfstools
hardware infos:				dmidecode
list partition:				blkid

fun term cleaning:		wipeclean (sudo npm install wipeclean -g)
vaudtaxe dependency:	webkit2gtk
OCR tool (extract text from images): tesseract

Phone:

apps:
m f-droid: newpipe
From play store: reddit, revolut, bcv, twint, maps.me, tl, cff, meteo swiss, wikr, telegram, signal, WhatsApp, Facebook messenger, firefox

Then ensure photos from whatsapp and messenger are downloaded.
