# Current
- Check error when fetching in gch and add option to just list dirty repos instead of report
- check-update doesn't work
- How to handle .git folders to not copy everytime when running backup script? And make backup
- close dunst notification with binding (in i3? Tried mod+shift+x)
- .gitignore for whitelist of configs in archrice directories (mainly vscode, verify vscode does not overwrite
symlink)
- Clearer list of programs and needed step for reinstallation
- bookmarks (epfl, magma, downloads, mnt, etc.) for lf, gch, etc. (can use data from `z` to add relevant paths)


# Misc
- Rice: picom, color, system tray, rofi config, userchrome.css for firefox
- Handle update of paru/st/dmenu (for suckless add info of original remote in repo for checking)
- Prompt with rofi instead of dmenu (and more secure, have to type 'yes')
- Rename workspace using rofi
- Setup syncthing
- Setup calendar app
- Check zsh-lovers man page

# Bugs
- Video blocking:
	- https://forum.manjaro.org/t/journalctl-pulseaudio-error-after-latest-update/38771/3
	- https://bbs.archlinux.org/viewtopic.php?id=243117
- Random halting of system:
	- Laptop halt because of bug in lockscreen not launching properly
	- Desktop halt because of some issue of intel (intel-ucode, microcode):
		https://bugzilla.kernel.org/show_bug.cgi?id=210347 :
			"The crash happens randomly while idling, with intermittent frequency. I
			had it stay on for over a day the first time I set it up, but it's been unable to stay stable for longer than an couple of
			hours since then. It also is random as to whether it recovers and reboots on its own or if it just hangs and requires a manual
			hard reboot."

# Scripts improvements
- autoscrot -> autoscrnshot (use deepin instead)
- Correct prompt for overwriting with $mod+m (mwep)
- `o`:
	- Check for video with xdg-mime instead of pattern
	- Make markdown work
	- Make plain text files open as expected (including with fl)
- i3blocks:
	- mail (https://github.com/Anachron/i3blocks/blob/master/blocks/mail, or i3contrib)
	- calendar -> click should toggle and not activate
	- Update clock regularly
- i3:
	- Binding to go the left/right window (ctrl+w and ctrl+h -> ctrl+g?)
- latex:
	- add map in vim similar to latex block for for inline blocks (e.g. textit or textbf)
	- Texsilent: re-add redirection for silent but better detection of success ($? is zero even if some of it fails, maybe detect
	"all target up to date"). If it fails, don't remove the *.log file
- music:
	- For full control of music (pause/next/previous/etc), use playerctl with mpDris2 so that it also works with mpd
		https://www.youtube.com/watch?v=XpzNdXtpKDc
- wifi: Add distinctive icon when wifi has been deactivated
- xidlehook: inquire dimscreen script, as it may work better with it

# Thing to learn/improve
- Change deepin screenshot to flameshot ? (more powerful, less heavy, independent)
- Switch autotiling behavior (for example with i3-master-stack)
- Switch to miniforge or mamba (or mambaforge)
- Check https://www.reddit.com/r/i3wm/comments/6txwcz/light_desktop_environment_to_use_i3_on/ for "desktop env." setup just using independent programs (screen locking etc.) Also https://gist.github.com/lbrame/1678c00213c2bd069c0a59f8733e0ee6
- Switch to vifm? (with qmv (rename-utils) for bulkrename) 
- Change file picker for firefox and others: https://askubuntu.com/questions/1110803/replace-open-file-dialog-with-ranger, https://gist.github.com/vn-ki/e592daa2e429377a0640ba71051175e0)
- Investigate jq
- Investigate ctags (+ add in programs with ctags dependency), taglist
- Vim: warning when undoing switch the past buffers modifications
- Vim autowrapping: when modifying text the wrapping can go wrong and to go back we could use J for the whole paragraph
	(paragraph <-> as long as the line begins with \s\+[a-Z]) and then <leader>aw
	Or: don't do autowrapping and just make the long lines more readable (e.g. no blue '>')
- Vim: better alignment (in particular for function arguments on multiple lines, https://www.reddit.com/r/vim/comments/syvypn/comment/hy0nxct/?utm_source=share&utm_medium=web2x&context=3) with ctab.vim and 'setlcino+=(0'
- Vim: mapping for changing split if there are or tab if there isn't:
	https://www.reddit.com/r/vim/comments/4da9rb/same_shortcut_to_tab_split_tabclose/
	https://stackoverflow.com/questions/14742504/how-to-show-number-of-splits-in-tab-in-tab-label-in-vim
- Swallowing (devour, i3-swallow, i3-tabbed https://aduros.com/blog/hacking-i3-window-swallowing/): not of them seem to work

# New scripts
- Like fl but for dragon-drap-and-drop to easily send files
- Binding to search argument history and insert while typing command
- Check grip (AUR) for cd ROM
- Python script for pdf handling (extract, rotate, ...)
- Screencast
