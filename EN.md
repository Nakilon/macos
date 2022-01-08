* go through the **System Preferences**, for example:
  * turn of the **Correct spelling automatically**, smart quotes
  * switch change the Fn keys mode
* after turning on the **trackpad pointer acceleration** you'll have to relogin (https://www.reddit.com/r/osx/comments/4u5cny/is_there_a_way_to_disable_trackpad_acceleration/)
  
  ```bash
  defaults write .GlobalPreferences com.apple.trackpad.scaling -1
  ```
  maybe it's already possible to turn on via GUI, not only Terminal
* configure **Finder** (on macOS you can open Preferences on any program with `⌘,`)
* install Google **Chrome** and
  * either (if it's a personal machine) configure syncronization to avoid unwanted tab sync or anything
  * or (if it's a machine given at work) bookmark corporative services, check the email
  * install **uBlock Origin** (https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm) and **Empty New Tab Page** (https://chrome.google.com/webstore/detail/empty-new-tab-page/dpjamkmjmigaoobjbekmfgabipmfilij?hl=ru) browser extensions
* install **messengers** (Slack, etc.) or open them as pinned browser tabs together with email, etc.
* configure **Terminal** and **hostname**, that is displayed to the left from the bash prompt (bash prompt configuration help -- http://ss64.com/osx/syntax-prompt.html)
  
  ```bash
  sudo scutil --set ComputerName "nakibook"
  sudo scutil --set LocalHostName "nakibook"
  sudo scutil --set HostName "nakibook"
  ```
  maybe it's already possible to do in GUI: http://apple.stackexchange.com/a/83801/54395
* install **Sublime Text** (http://www.sublimetext.com/), configure:
  
  ```
  {
    "atomic_save": false,
    "color_scheme": "Packages/Color Scheme - Default/Slush & Poppies.tmTheme",
    "ensure_newline_at_eof_on_save": true,
    "font_size": 30,
    "ignored_packages":
    [
      "Vintage"
    ],
    "show_git_status": false,
    "tab_size": 2,
    "translate_tabs_to_spaces": true,
    "trim_trailing_white_space_on_save": true
  }
  ```
  (git status is turned of because there is some bug that kills the CPU)
* and to avoid the unwanted space trimming for Markdown files, create the `~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Markdown.sublime-settings` like this:
  
  ```
  {
    "trim_trailing_white_space_on_save": false,
  }
  ```
  you also can open this file from GUI: ![](https://i.imgur.com/RWFBSbq.png)
* configure `~/.bash_profile`
  
  ```bash
  shopt -s histappend
  export HISTFILESIZE=100500
  export HISTSIZE=9001
  export HISTCONTROL=ignorespace
  export HISTTIMEFORMAT='%F %T '
  # export PROMPT_COMMAND='history -a;'

  # automatically cats the local `CATME.txt` file when you `cd` anywhere
  export PROMPT_COMMAND="history -a; if [[ -e CATME.txt && \"\$PWD\" != \"\$HOME\" && \"\$(history 1 | awk '{print \$4;}')\" == 'cd' ]]; then cat CATME.txt; fi;"

  export CLICOLOR=1
  export EDITOR=nano
  export GREP_COLOR='01;31'
  export GREP_OPTIONS='--color=always'

  # colored letters support for `less`
  export LESS=' -R '

  # opens images faster (and for some files such as .obj even more correctly), than a `open` app
  ql(){
    qlmanage -p "$@" >/dev/null 2>&1
  }

  # allows you to create a OS corner notifications after a while
  notification(){
    ( sleep `expr "$1"` && osascript -e "display notification \"$*\" with Title \"Notification from Terminal\"" )&
  }
  ```
  the rest depends on what you've installed
  ```
  export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc
  # and put the`--no-ignore` to make it stop ignoring the files from `.gitignore`
  
  alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

  eval "$(rbenv init -)"
  export PATH="$HOME/.jenv/bin:$PATH"
  eval "$(jenv init -)"
  ```
  or store this all elsewhere
  ```bash
  source ~/somewhere/.bash_profile
  ```
* configure `~/.ssh/config`, for example:
  
  ```
  Host *
    IdentityFile ~/.ssh/id_rsa_ubuntu
  Host myserver
    HostName myserver.com
    User root
  ```
* generate (or take from some backup) the SSH keys and upload the `id_rsa.pub` everywhere, for example, to Github
  
  ```
  ssh-keygen -t rsa -C "johndoe@example.com"
  chmod 700 ~/.ssh
  chmod 600 ~/.ssh/id_rsa
  chmod 644 ~/.ssh/id_rsa.pub
  ```
* install Homebrew (http://brew.sh/) -- this will automatically install **XCode Command Line Utils**, including `git`, and then other useful stuff if needed:
  
  ```
  brew install ascii tree htop rg cpulimit wifi-password
  brew install jenv node rust go
  brew install ffmpeg exiftool media-info graphviz telnet
  ```
* install rbenv (https://github.com/rbenv/rbenv)
  
  ```bash
  brew install rbenv
  brew install -L   # to list all the available versions for install
  ```
* configure `~/.gitconfig`
  
  ```
  [branch]
    autosetupmerge = always
    autosetuprebase = always
  [core]
    editor = nano
    # excludesfile = /Users/john/.gitignore
  [merge]
    conflictstyle = diff3
  [push]
    default = simple
  [pull]
    rebase = true

  [format]
    # pretty = %h %ar %C(bold)%s%Creset (%an)%d
    pretty = %h (%ar) %C(bold)%s%Creset%d - %an
  [log]
    date = format:%y%m%d
  [user]
    name = John Doe
    email = johndoe@example.com
  ```
  or include this all from elsewhere
  ```
  [include]
    path = /Users/johndoe/backup/.gitconfig
  ```
* disable the glitchy IRB colorization

  ```
  echo "IRB.conf[:USE_COLORIZE] = false" > ~/.irbrc
  ```
* to restore attributes if they were broken during some backup restore
  
  ```bash
  find /path/to/base/dir -type f -exec chmod 644 {} +
  ```
