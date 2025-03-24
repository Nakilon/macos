## System preferences

* go through the **System Preferences**, for example:
  * turn off the **Correct spelling automatically**, smart quotes
  * switch change the Fn keys mode
* after turning on the **trackpad pointer acceleration** you'll have to relogin (https://www.reddit.com/r/osx/comments/4u5cny/is_there_a_way_to_disable_trackpad_acceleration/)
  ```bash
  defaults write .GlobalPreferences com.apple.trackpad.scaling -1
  ```

## Install main software

  maybe it's already possible to turn on via GUI, not only Terminal
* configure **Finder** (on macOS you can open Preferences on any program with `⌘,`)
* install Google **Chrome** and
  * either (if it's a personal machine) configure syncronization to avoid unwanted tab sync or anything
  * or (if it's a machine given at work) bookmark corporative services, check the email
  * install **uBlock Origin Lite** (https://chromewebstore.google.com/detail/ublock-origin-lite/ddkjiahejlhfcafbddmgiahcphecmpfh) and **Empty New Tab Page** (https://chrome.google.com/webstore/detail/empty-new-tab-page/dpjamkmjmigaoobjbekmfgabipmfilij?hl=ru) browser extensions
* install **messengers** (Slack, etc.) or open them as browser tabs together with email, etc.
* install **Sublime Text** (http://www.sublimetext.com/), configure:
  ```
  {
    "atomic_save": false,
    "auto_complete": false,
    "color_scheme": "Packages/Color Scheme - Default/Slush & Poppies.tmTheme",
    "ensure_newline_at_eof_on_save": true,
    "font_size": 32,
    "ignored_packages":
    [
      "Vintage"
    ],
    "index_files": false,
    // "show_git_status": false,
    "tab_size": 2,
    "translate_tabs_to_spaces": true,
    "trim_trailing_white_space_on_save": true
  }
  ```
* and to avoid the unwanted space trimming for Markdown files, create the `~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Markdown.sublime-settings` like this:
  ```
  {
    "trim_trailing_white_space_on_save": false,
  }
  ```
  you also can open this file from GUI: ![](https://i.imgur.com/RWFBSbq.png)

## Configure Terminal

* configure/create Profile -- background color (grey, 80%), shell (bash or zsh by default)
* (optionally) configure **hostname**, that is displayed to the left from the bash prompt (bash prompt configuration help -- http://ss64.com/osx/syntax-prompt.html)
  ```bash
  sudo scutil --set ComputerName "nakibook"
  sudo scutil --set LocalHostName "nakibook"
  sudo scutil --set HostName "nakibook"
  ```
  maybe it's already possible to do in GUI: http://apple.stackexchange.com/a/83801/54395
* if bash, then configure `~/.bash_profile`:
  ```bash
  shopt -s histappend
  export HISTFILESIZE=100500
  export HISTSIZE=9001
  export HISTCONTROL=ignorespace
  export HISTTIMEFORMAT='%F %T '

  export EDITOR=nano
  export PROMPT_COMMAND='history -a;'

  export CLICOLOR=1
  export GREP_COLOR='01;31'
  export GREP_OPTIONS='--color=always'
  export LESS=' -R '  # colored letters support for `less`

  export BASH_SILENCE_DEPRECATION_WARNING=1  # https://apple.stackexchange.com/q/371997/54395

  # git clone this repo somewhere and append the bin dir to PATH
  export PATH="$HOME/_/REPOS/macos/bin:$PATH"
  # bin/ql                   opens images faster (and for some files such as .obj even more correctly), than a `open` app
  # bin/subl                 symlink to Sublime Text
  # bin/size-by-extension    https://serverfault.com/a/367195/67097
  # bin/number-by-directory  counts files in directories

  # if you are me
  source "$HOME/_/REPOS/trash/bash_profile.sh"


  # allows you to create a OS corner notifications after a while
  # notification(){
  #   ( sleep `expr "$1"` && osascript -e "display notification \"$*\" with Title \"Notification from Terminal\"" )&
  # }
  ```
  the rest depends on what you've installed
  ```
  # export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
  # and put the `--no-ignore` there to make it stop ignoring the files from `.gitignore`
  ```
* if zsh, then configure `~/.zshrc`:
  ```
  export EDITOR=nano
  export PROMPT='%F{111}%m:%F{2}%~ %(!.#.$)%f '
  export LANG='en_US.UTF-8'
  export LESS=' -R '
  export PATH="$HOME/_/REPOS/macos/bin:$PATH"
  ```

## Configure SSH

* generate the SSH keys and upload the public key where needed, for example, to GitHub
  ```
  ssh-keygen -t ed25519 -C "mynewmac"
  chmod 700 ~/.ssh
  chmod 600 ~/.ssh/id_ed25519
  chmod 644 ~/.ssh/id_ed25519.pub
  ```
* `~/.ssh/config` example:
  ```
  Include ~/_/REPOS/trash/ssh_config.txt
  Host *
    # IdentityFile ~/.ssh/id_rsa_from_backup
  Host myserver1
    HostName myserver.com
    User root
    # ServerAliveInterval 120
  ```

## Install other software

* install Homebrew (http://brew.sh/) -- this will automatically install **XCode Command Line Utils**, including `git`, then follow the instructuions on how to add brew to PATH
* and then other useful stuff if needed:
  ```
  brew install tree htop rg graphviz
  brew install ascii cpulimit wifi-password
  brew install jenv node rust go
  brew install ffmpeg exiftool media-info telnet
  ```
  ```bash
  brew install rbenv
  # brew install -L   # to list all the available versions for install
  ```
  in case of zsh refer to their docs for setting up the autocomplete

## Miscelanous

* configure GIT
  ```
  # ~/.gitconfig
  [branch]
    autosetupmerge = always
    autosetuprebase = always
  [merge]
    conflictstyle = diff3
  [push]
    default = simple
  [pull]
    rebase = true

  [core]
    # editor = nano
    # pager = delta
    # excludesfile = /Users/john/.gitignore

  [format]
    pretty = %h (%ar) %C(bold)%s%Creset%d - %an
  [log]
    date = format:%y%m%d
  # [diff]
  #   wordDiff = color

  [user]
    name = Victor Maslov
    email = nakilon@gmail.com

  # [interactive]
  #   diffFilter = delta --color-only
  # [delta]
  #   navigate = true
  # [diff]
  #   colorMoved = default

  [include]
    path = /Users/johndoe/backup/.gitconfig
  ```
* disable the glitchy IRB colorization
  ```
  echo "IRB.conf[:USE_COLORIZE] = false" >> ~/.irbrc
  ```
