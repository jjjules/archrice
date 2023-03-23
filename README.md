# Archrice

This repository contains my personal scripts and various configuration files for Arch Linux with the i3 window manager.


## Scripts

Here is the description of some of the most relevant scripts:

- arch-install-helper: automate the setup after a clean Arch Linux installation. It sets up important packages, an AUR helper, a locking system as well as all the configurations present in `dots/`.
- ytdl: Simple UI built on top of [yt-dlp](https://github.com/yt-dlp/yt-dlp) and [ytfzf](https://github.com/pystardust/ytfzf) for easily download/play content from Youtube either interactively or from a list of URLs present in a file.
- texsilent: automate the compilation of LaTeX document. The compilation is silent meaning it removes auxiliary files created
during the compilation.
- mdcompile: compile markdown document, either to standard PDF or presentation slides (beamer markdown).
- autolayout: detect the monitors available (native or external) and set up the layout and sound accordingly.
- lockhook: setup a hook that detect when the system is idle, suspending and locking the system if it is.
- fl: efficient file launcher using fzf.
- gch: automatically pull all relevant git repositories in parallel.
- 0x0: Easily share files through internet, just go to the produced ip adress to download the uploaded file.

## Programs list

### Core environment setup

| Type                       | Program                 | Configuration   | Additional information |
|----------------------------|-------------------------|-----------------|------------------------|
| font                       | ttf-dejavu, ttf-font-awesome, nerd-fonts-complete (AUR)  |               |
| shell                      | zsh                     | [config folder](./dotfiles/zsh) | With [oh-my-zsh](https://ohmyz.sh/) |
| terminal                   | st                      | [st fork](./st) |                        |
| display server             | Xorg                    | [config folder](./dotfiles/xorg) |       |
| compositor                 | picom                   | [config file](./dotfiles/.config/picom/picom.conf) | |
| login manager              | sddm                    | [sddm config](./dotfiles/sddm.conf) | Use [chili theme](https://github.com/MarianArlt/sddm-chili). Need qt5, qt5-quickcontrols, qt5-graphicaleffects. Enable daemon |
| window manager             | i3-gaps                 | [i3 config](./dotfiles/.config/i3/config) |
| status bar                 | i3blocks                | [config folder](./dotfiles/.config/i3blocks/) |
| screen locker              | betterlockscreen (AUR), xidlehook (AUR)  | [config file](./dotfiles/.config/betterlockscreenrc) | See [lock hook script](./scripts/lockhook) |
| file browser               | lf (AUR)                | [config folder](./dotfiles/.config/lf/) | atool, mediainfo, ueberzug, ffmpegthumbnailer, odt2txt, bat, lynx |
| program launcher           | dmenu, rofi             | [dmenu fork](./dmenu) |
| notification manager       | dunst                   |                |
| clipboard                  | xclip, xsel             |                |
| clipboard manager          | clipmenu                |                | Enable user daemon |
| wallpaper setter           | feh                     |                | See [setwp script](./scripts/setwp) |
| brightness control         | acpilight               |                | See [brightness script](./scripts/brightness) |
| key mapper                 | xmodmap                 |                | See [setkb script](./scripts/setkb) |
| mouse hiding               | unclutter               |                |
| screen temperature handler | redshift                |                |
| backup program             | rsync                   |                | See [backup script](./scripts/backup)
| version control system     | git                     |                | |
| AUR package manager        | paru (manual install)   |                |
| password manager           | pass                    |                | With gnome-keyring. See [passmenusec script](./scripts/passmenusec) |



### Documents and multimedia

| Type                    | Program        | GUI | Configuration      | Additional information       |
|-------------------------|----------------|-----|--------------------|------------------------------|
| text                    | vim            | No  | [config folder](./dotfiles/vim/) | Vundle for the plugins (manual install)     |
| text                    | featherpad     | Yes |
| image viewer            | sxiv           | Yes |
| image editor            | pinta          | Yes |
| pdf viewer              | zathura        | Yes | [zathurarc](./dotfiles/.config/zathurarc) | With zathura-pdf-mupdf for additional pdf/epub support |
| pdf editors             | masterpdfeditor-freeAUR), foxit-reader (AUR) | Yes  |
| music server            | mpd, mpc       | No  | [mpd config](./dotfiles/.config/mpd/mpd.conf) | Enable user daemon     |
| music player            | ncmpcpp-git    | No  | [config folder](./dotfiles/.config/ncmpcpp) | \*-git version for lyrics |
| music tag editor        | exfalso        | Yes |               | Installed via `quodlibet` package |
| video player            | mpv            | Yes | [config folder](./dotfiles/.config/mpv) |         |
| audio setup             | pavucontrol    | Yes |
| bluetooth configuration | blueberry      | Yes |                       | With pulseaudio-bluetooth |
| cd ripper               | sound-juicer   | Yes | | More automatic than abcde but less robust |
| cd ripper               | abcde          | No  |                    |                        |
| gif viewer              | gifsicle       | No  |                    |                        |

### Internet

| Type            | Program                            | GUI   | Additional infomrmation          |
|-----------------|------------------------------------|-------|----------------------------------|
| network manager | networkmanager                     | No |                                     |
| network setup   | iw, nmcli                          | No | nmcli is provided by networkmanager |
| network setup   | network-manager-applet, stalonetry | Yes  |                                   |
| VPN             | openconnect                        | No |                                     |
| SSH             | openssh                            | No | With sshpass to pipe password       |
| browser         | firefox                            | Yes  | Important plugins: vimium (with [its config](./dotfiles/vimium)), sci-hub, grammarly, tab stash, tab focus google search, ublock, HTTPS everywhere |
| mail client     | mailspring (AUR)                   | Yes  |                                   |
| torrent client  | deluge-gtk                         | Yes  |                                   |


### IDE

vscodium-bin (AUR) with the configurations: [general settings](./dotfiles/vscode-settings.json) and [keybindings](./dotfiles/vscode-keybindings.json).

linter: flake8 (pip install --user, check that path set in vscode settings match the install user-wide install).

Python language server: Pylance, need to install pylance extension using [downloaded VSIX](https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance).

Extensions:
* python - ms-python
* docs-view - bierner
* draw.io - hediet
* git graph - mhutchie
* jupyter - ms-toolsai
* jupyter keymap - ms-toolsai
* jupyter notebook renderer - ms-toolsai
* vim - vscodevim
* vscode-pdf - tomokj1207
* partial diff - ryu1kn (VSIX install)

micromamba for python environments (AUR)

### Utils
Description                   | Program              | Additional info.    |
|-----------------------------|----------------------|---------------------|
| Calculator                  | bpython              | With dropdown window setup in i3 |
| Screenshot                  | deepin-screenshot    |
| Better `du` alternative     | dust                 |
| Visual disk inspector       | gdmap (AUR)          |
| Drag and drop files         | dragon-drop (AUR)    |
| System monitoring           | btop                 |
| Quick terminal navigation   | [z](https://github.com/skywind3000/z.lua) |
| List files as a tree        | tree                 |
| Hardware informations       | dmidecode            |
| More filesystem support     | dosfstools, hfs+ (AUR) | The first is for FAT, the second for Apple filesystem|
| Android mounting            | android-file-transfer|
| Pacman mirror update        | reflector            |
| Clean git repository        | bfg (AUR)            |
| General doc converter       | pandoc               | See [script to compile markdown](./scripts/mdcompile) |
| Docx converter              | doc2txt              |
| Regex matching in pdfs      | pdfgrep              |
| CLI for pdf manipulation    | pdftk                |
| Quick program summary       | tldr++ (AUR)         |
| Quick file transfer via url | oneshot (AUR)        |
| Get color code of pixel     | grabc (AUR)          |
| Color code converter        | [convert-color-cli](https://www.npmjs.com/package/convert-color-cli) |
| Shell syntax checker        | shellcheck           |
| QR code scanner             | zbarimg (provided by zbar package) | See [script to scan screenshot directly](./scripts/scan-qrcode) using deepin-screenshot |


### Others
Description                    | Program              | Additional info.   |
|------------------------------|----------------------|--------------------|
| SQL db visual explorer       | dbeaver              |                    |
| Torrent stream from terminal | peerflix             | See [notflix script](./scripts/notflix) |
| Julia sets explorer          | fraqtive             |                    |
| Trackmania                   | lutris, wine-ge-custom (AUR) | need package for graphics (vulkan-intel in case of embedded GPU) |
| Tax program                  | vaudtax              | Need webkitgtk2    |
| Home cleaner                 | [xdg-ninja](https://github.com/b3nj5m1n/xdg-ninja) |
| Android screen share         | scrcpy               |
| OCR tool                     | tesseract            |
| Fun terminal cleaning        | [wipeclean](https://github.com/JeanJouliaCode/wipeClean)
| Tetris                       | [ctris](https://github.com/dominikhackl/ctris)
| Minesweeper                  | [minesweeper](https://github.com/HaroldLoui/minesweeper-tauri)|
| Snake                        | [cursnake](https://codeberg.org/karam/cursnake/src/branch/main)|

### Phone 

apps:
F-droid: newpipe, OpenKeyChain, Password Store
Play store: Reddit, Revolut, BCV, Twint, Maps.me, TL, CFF, Meteo Swiss, Wikr, Telegram, Signal, WhatsApp,
Facebook Messenger, Firefox, Caffeine

Then ensure photos from whatsapp and messenger are downloaded.

