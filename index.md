# Dotfiles

## Note:
* Mounting usbc's:
    * Using jmtpfs
        * `jmtpfs -l` to list devices
        * `jmtpfs /mnt/usbc` to mount
        * `fusermount -u /mnt/usbc` to unmount
* Manually mounting external drives/usb:
    * `fdisk -l` to find mounting point (generally /dev/sda1)
    * mount /dev/sda1 /mnt/xxxx
    * mount would require sudo, and thus subsequent subdirs in external drives' content would require sudo for rw, normally would only get r
    * Modify /etc/fstab to include:
        ```
        # /dev/sda1 (externally connected drives)
        # for UUID, (Disk identifier: 0xaa8f50de)?
        # /dev/sda1   /mnt/drive  exfat   rw,auto 0 0 
        # /dev/sda1   /mnt  auto   rw,auto,umask=000,user,uid=1000 0 0 
        /dev/sda1   /mnt/drive  auto   rw,auto,user,umask=000 0 0 
        # /dev/sda1   /mnt/drive  ntfs-3g   rw,auto,user,umask=000 0 0 
        ```
    %% * NOTE: above works when fs != ntfs, linux supports only read for them, for r+w, refer - https://unix.stackexchange.com/questions/359921/how-do-i-configure-an-arch-linux-system-to-automatic-mount-an-external-harddisk
    * NOTE: for some reason, mounting without dest after doing above works (mount /dev/sda1)
* Dissolved above shit entirely - using tui-types 'udiskie' (but still gotta have entries for diff usb slots on /etc/fstab)
* X11 configs tutorial - https://cravencode.com/post/essentials/enable-tap-to-click-in-i3wm/
* Keychron shortcuts:
    disable auto sleep: fn+s+l+o
    Auto sleep in 10mins: Press fn+s+l+r for four seconds
    Auto sleep in 20mins: Press fn+s+l+t for four seconds
    Auto sleep in 30mins: Press fn+s+l+y for four seconds

## Vim 
* [New bindings](vim_learnings)

## Tuts
* [Udev](udev_tut)
* Follow here to maintain pacman regularly - https://wiki.archlinux.org/title/Pacman/Package_signing#Upgrade_system_regularly

## Reminders for new machines
* [X] Remember to set "filter_ignored" property of function M.setup(opts) in ~/.local/share/nvim/site/pack/packer/start/nvim-tree.lua/lua/nvim-tree/populate.lua to false
* [ ] Remind nvm bt solved by writing export 3lines tozshrc orbashrc
* [X] Remind stow ignore list
* [X] Ryanoasis nerdfonts repo
* [ ] Keybindings for insert mode?
%% * [ ] @MOHITDMAK: Turned Hardware acc usage off in brave (1.46.xxx) else caused blank rendering on overflow/github/few sites
* [ ] NOTE: For obsidian/other desktop apps integration with rofi see answer by *"notachraf"* here - https://unix.stackexchange.com/questions/364773/how-to-get-installed-application-to-be-detected-by-rofi
* [X] specific version of picom fork required, see its stow folder
* [ ] Lookup 'locate' command - useful
* [ ] $mod+shift+space toggles float/non-float
* [X] tokyonight package modifications? - placed the whole site package in dotfiles, directly use it in ~/.local/share/nvim/site/pack/packer/start/tokyonight.nvim/
* [X] super neovim/vim collection for reference - https://alpha2phi.medium.com/learn-neovim-the-practical-way-8818fcf4830f#ceef
* [X] NOTEEE: ":e" reloads buffer, used to syntax highlight fenced code by language in vimwiki
* [X] Works for Keychron K3. I presume K2 has the same hotkeys.

## Todo
* [ ] Automate toggling of sys keyboard using udev
* [ ] notifs for terminal outputs upon command exits
* [ ] common session buddy timeline of tabs in android-arch? (synced whenever arch sleeps)
* [ ] what to do of snap apps? slack/wa?
* [X] SCRCPY - android - arch control
    * debug performance - https://github.com/Genymobile/scrcpy/issues/4548#issuecomment-1868851015 
    * If you experience performance issues, check if your device has another h264 encoder which provides better performance (scrcpy --list-encoders). 
    * Then, to reduce latency, you can reduce the resolution and bit rate (scrcpy -m1024 -b2M).
* [o] daily session-buddy backup 
    * [ ] check backup download folder loc
    * [X] check same for gdrive -- UPDATE: able to sync btw browsers based on google login
* [X] fix pacman pkg untrusted pgp and marginal trust issues - https://wiki.archlinux.org/title/Pacman/Package_signing#Upgrade_system_regularly
* [O] Booting to emergency mode after editing /etc/fstab to automount ext drive!!!:
    * [X] https://bbs.archlinux.org/viewtopic.php?id=147478 - if ext drive isn't connected during boot up, systemd fails after not finding it for timeout (~90s) and fallbacks to emergency mode
    * [X] Modified /etc/fstab to include 'noauto' directive - to always manually mount ext drives
    * [X] TODO: look into creating a `/etc/rc.local` to maybe automount during boot (`nofail` directive in above would work as well) -- UPDATE: rc.local is outdated, look for alternatives
    * [X] TODO: write udev to automate mounting/unmounting DURING a session (not booting a new one) -- UPDATE: switched to tui - udiskie instead
    * [ ] TODO: anything to do with udiskie?
* [ ] vimium 'T' bt? not showing prev history?
* [X] vault iam reposization + android integration
* [ ] look walls - https://github.com/dharmx/walls - https://github.com/adi1090x?tab=repositories
* [ ] conky widgets
    * [ ] todo - remove if useless:
    * [ ] sudo pacman -S imagemagick
    * [ ] sudo pacman -S kdialog
* [ ] Useful tracking embedding todo later:
    * [ ] They're Tracking You! Companies secretly know when you open emails.
            Many emails have a tracking pixel at the end of the email content. It is a lightweight transparent 1x1 pixel image with a unique link. When you open the email, your email client has to make a HTTP call to that URL to fetch that image. Since the image URL is unique the image server can associate the http call with an email open event.
            Companies use this feature to track emails they send to their customers. This can help them determine what kind of emails their customers are interacting with.
            You can check it out yourself. Simply click on “Show Original” in Gmail to view the HTTP code of an email. If you spot an img tag at the very end but no actual image in your email, then you've just found the tracking pixel!
* [.] checkout - https://wiki.archlinux.org/title/list_of_applications
    * [X] download manager - nothing useful here
    * [X] power monitoring
    * [X] utilities for system/process monitoring (tui/gui/htop) - went with 'bottom' : docs - https://clementtsang.github.io/bottom/0.9.6/
    * [ ] calculator (Sci)
    * [ ] package (pacman) monitoring
    * [ ] notification server
    * [ ] https://github.com/majido/clipper - shared clipboard android & arch
    * [ ] video player?
    * [ ] webcam?
    * [ ] android notifs on pc? 
    * [ ] https://github.com/jersou/mouse-actions later?
* [O] Wlan0 issue debugging (might not cause issues for non-BITS wifi - non 8021):
    * [X] disabled and stopped iwd (conflicting service with Nm and wpa_supplicant)
    * [X] iw dev wlan0 set power_save off (tried for fix on wifi, lets see) (also created /etc/NetworkManager/conf.d/wifi-powersave-off.conf)
    * [X] created /etc/NetworkManager/conf.d/wifi_rand_mac.conf to disable randomization of MAC address sent to wifi routers (privacy, but unstable nw) (see https://wiki.archlinux.org/title/NetworkManager#Configuring_MAC_address_randomization)
    * [X] [todo] got to know I should disable dhcpd.service too (Nm has it's own dhcp manager)
    * [X] is this needed - https://wiki.archlinux.org/title/IPv6#Disable_IPv6 ? since dhcpd only attempts IPv6 solicitation in logs? - NOOO
    * [ ] after above, it got better, but only remaining BT - kernel would limit TX power, causing switches in AP connections, resulting in somewhat fluctuating wifi sometimes
    * [ ] created /etc/modprobe.d/iwlwifi.conf (options iwlwifi power_save=0) to remove powersaving for intel wireless cards
* [ ] what to do of stacer (installed, should uninstall?)
* [X] mpris controller (playerctl installed and bindings created)
* [ ] clipboard history size + fuzzy search fix
* [ ] browser open ranger for file upload download
    * [ ] upload multiple files? - lel prolly too complex as of now - has to do with creating a re modded kdialog script
* [O] allow mouse inputs - 
    * [X] >>toggling sys keyboard / 
    * [X] system shut/sleep / power / 
    * [X] brightness/volume/bt fullscreen etc
    * [X] gestures DONE!
    * [ ] allow above/some of above from sleep locked screen?
* [X] ask for save location scrot screenshot
    * [X] maybe ranger enugh?
* [o] rofi bluetooth and network
    * [X] bluetooth
    * [ ] network
* [X] TODO: REMOVE BOTTOM LUALINE -- NEVER REALLY USE IT
* [ ] tmux/alacritty vim nav
* [ ] bell in alacritty
* [ ] fzf_lua telescope search
* [ ] htop config, launch as .desktop with i3 for_window settings like pulsemixer's
* [ ] <leader>F search text - toggling between allowing search on hidden/gitignored files or not
* [ ] Customize recently added Grammarly LSP
* [ ] op status bar but too bad, only for macos - https://github.com/FelixKratz/SketchyBar
* [X] https://github.com/folke/todo-comments.nvim
* [X] Battery low warning more verbal
* [X] keychron k2 extend sleep timeout
* [X] nvim startify add systemd config page and batterypopup
* [ ] maybe replace current to use mason.nvim later
* [ ] lazy.nvim?
* [ ] conky widgets?
* [ ] wine configs - picom, fonts, etc
* [X] fingerprint reader for sudo/etc?
    * [ ] TOO risky, for corruption due to 2 drivers from windows/linux
* [ ] screen blackout / saver timeout configurable?
* [ ] lookup tmux/zsh vim keybindings 
* [ ] tokyonight border on float term
* [ ] script run from i3.config to start all custom --user services on startup
* [ ] Stream mobile notififications on linux
* [ ] Way to save tmux sessions locally periodically  (maybe even on cloud)
* [X] systemd service to keep gh repos for dotfiles/local settings updated periodically
* [X] obstidian hack for above
* [X] Try out later: https://www.reddit.com/r/vim/comments/s1f14h/the_vimium_extension_for_chrome_is_amazing/
* [ ] Try out later: https://vim.fandom.com/wiki/Browsing_programs_with_tags
* [X] <leader>z reversal
* [X] indent lines plus reversal
* [ ] just another mac font, try later - https://github.com/shaunsingh/SFMono-Nerd-Font-Ligaturized
* [ ] Fix vim conceal for colorized tags in vimwiki
* [ ] Fix: visual and normal mode to switch bw '', "", (), {}, [], <>
* [ ] Nvim tree current dir doesnt set, causing further problems in telescope file and text search
* [X] Remove line numberings in situations where its not needed
* [X] Battery low indicator (more verbal)
* [ ] `set lazydraw` for improved macro performance?
* [ ] n & N mappings for VWS interfere with that of normal search
* [X] Default app for pdf/png alacritty - feh
* [ ] Installer scripts
    - [ ] Nvim
    - [ ] Zsh
    - [ ] Misc
    - [ ] I3
    - [ ] etc
* [X] Nvim-tree doesnt copy to clipboard
* [X] Vim wiki setup
    - [X] Table bindings?
    - [X] etc
* [ ] LSP doesnt asynchronously check for each file in background, only the ones open.
* [ ] Spell as nvim-cmp source for lsp
* [ ] Map <leader>H/L, unused
* [X] Map <leader>H/L, unused, window move left/right, switch bw horizontal and vertical layout. - not really neeeded
* [ ] Started using ultisnips, but removing luasnips causes cmp to die altogether?
* [X] Lookup /usr/share/doc/ranger

