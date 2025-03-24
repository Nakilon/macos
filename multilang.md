RU:## Настройки системы
EN:## System preferences

RU:* настроить все в **Системных настройках**, например:
RU:  * выключить "Исправлять ошибки автоматически", "Смарт-кавычки"
RU:  * "Использовать функциональные клавиши как стандартные"
RU:  * "Источник ввода -- США, Русская ПК" (на новых макбуках тильда будет слева внизу)
RU:* включив **ускорение указателя трекпада** понадобится перелогиниться (https://www.reddit.com/r/osx/comments/4u5cny/is_there_a_way_to_disable_trackpad_acceleration/)
EN:* go through the **System Preferences**, for example:
EN:  * turn off the **Correct spelling automatically**, smart quotes
EN:  * switch change the Fn keys mode
EN:* after turning on the **trackpad pointer acceleration** you'll have to relogin (https://www.reddit.com/r/osx/comments/4u5cny/is_there_a_way_to_disable_trackpad_acceleration/)
  ```bash
  defaults write .GlobalPreferences com.apple.trackpad.scaling -1
  ```
RU:  возможно нынче уже есть возможность включать ее и через настройки, а не из консоли
RU:* настроить **Finder** (войти в настройки любой программы в Mac OS можно комбинацией `⌘,`)

RU:## Поставить главные проги
EN:## Install main software

RU:* поставить Google **Chrome** и
RU:  * либо (если это домашний компьютер) настроить параметры синхронизации, чтоб не засинхрил табы или еще чего
RU:  * либо (если это рабочий компьютер) добавить в закладки корпоративные сервисы, проверить почту
RU:  * поставить расширения **uBlock Origin** (https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm) и **Empty New Tab Page** (https://chrome.google.com/webstore/detail/empty-new-tab-page/dpjamkmjmigaoobjbekmfgabipmfilij?hl=ru)
RU:* установить **чатики** (Slack и пр.) либо пооткрывать их в браузере вместе с почтой и пр.
EN:  maybe it's already possible to turn on via GUI, not only Terminal
EN:* configure **Finder** (on macOS you can open Preferences on any program with `⌘,`)
EN:* install Google **Chrome** and
EN:  * either (if it's a personal machine) configure syncronization to avoid unwanted tab sync or anything
EN:  * or (if it's a machine given at work) bookmark corporative services, check the email
EN:  * install **uBlock Origin** (https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm) and **Empty New Tab Page** (https://chrome.google.com/webstore/detail/empty-new-tab-page/dpjamkmjmigaoobjbekmfgabipmfilij?hl=ru) browser extensions
EN:* install **messengers** (Slack, etc.) or open them as browser tabs together with email, etc.
RU:* установить **Sublime Text** (http://www.sublimetext.com/), настроить:
EN:* install **Sublime Text** (http://www.sublimetext.com/), configure:
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
RU:* и чтоб от последней опции не обрезались пробелы на концах строк в Markdown файлвх, создаем файл `~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Markdown.sublime-settings` с содержимым:
EN:* and to avoid the unwanted space trimming for Markdown files, create the `~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Markdown.sublime-settings` like this:
  ```
  {
    "trim_trailing_white_space_on_save": false,
  }
  ```
RU:  можно в этот файл попасть и так: ![](https://i.imgur.com/RWFBSbq.png)
EN:  you also can open this file from GUI: ![](https://i.imgur.com/RWFBSbq.png)

RU:## Настроить Терминал
EN:## Configure Terminal

RU:* настроить **Терминал** и **hostname**, который отображается в prompt-е (справка по настройке bash prompt -- http://ss64.com/osx/syntax-prompt.html)
EN:* configure **Terminal** and **hostname**, that is displayed to the left from the bash prompt (bash prompt configuration help -- http://ss64.com/osx/syntax-prompt.html)
  ```bash
  sudo scutil --set ComputerName "nakibook"
  sudo scutil --set LocalHostName "nakibook"
  sudo scutil --set HostName "nakibook"
  ```
RU:  возможно, это можно сделать и через GUI: http://apple.stackexchange.com/a/83801/54395
EN:  maybe it's already possible to do in GUI: http://apple.stackexchange.com/a/83801/54395
RU:* настроить `~/.bash_profile`
EN:* configure `~/.bash_profile`
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
RU:  export LESS=' -R '  # `less` будет всегда запускаться с флагом `-R` (для цветных букв)
EN:  export LESS=' -R '  # colored letters support for `less`

  export BASH_SILENCE_DEPRECATION_WARNING=1  # https://apple.stackexchange.com/q/371997/54395
RU:
RU:  export LANG='en_US.UTF-8'  # потому что иначе локаль берется из настроек ОС, а там у нас стоит русский

RU:  # склонируйте этот репозиторий и добавьте bin к PATH
EN:  # git clone this repo somewhere and append the bin dir to PATH
  export PATH="$HOME/_/REPOS/macos/bin:$PATH"
RU:  # bin/ql                   открывает картинки быстрей (а некоторые файлы, например .obj, даже правильней), чем просмотрщик, который вызывается через open
EN:  # bin/ql                   opens images faster (and for some files such as .obj even more correctly), than a `open` app
RU:  # bin/subl                 симлинк на Sublime Text
EN:  # bin/subl                 symlink to Sublime Text
  # bin/size-by-extension    https://serverfault.com/a/367195/67097
RU:  # bin/number-by-directory  считает файлы в директориях
EN:  # bin/number-by-directory  counts files in directories

RU:  # если вы -- это я
EN:  # if you are me
  source "$HOME/_/REPOS/trash/bash_profile.sh"


RU:  # позволяет из Терминала инициировать напоминалки, которые вылезут в правом верхнем углу через заданное время
EN:  # allows you to create a OS corner notifications after a while
  # notification(){
  #   ( sleep `expr "$1"` && osascript -e "display notification \"$*\" with Title \"Notification from Terminal\"" )&
  # }
  ```
RU:  далее уже в зависимости от того, что у вас будет установлено
EN:  the rest depends on what you've installed
  ```
  # eval "$(rbenv init -)"
  # export PATH="$HOME/.jenv/bin:$PATH"
  # eval "$(jenv init -)"

  # export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
RU:  # и положить туда одну строку: `--no-ignore`, чтоб он не игнорил файлы из `.gitignore`
EN:  # and put the`--no-ignore` to make it stop ignoring the files from `.gitignore`
  ```

RU:## Поставить остальные проги
EN:## Install other software

RU:* установить Homebrew (http://brew.sh/) -- при этом будут автоматически установлены **XCode Command Line Utils**, в составе которых `git`, а далее всякие полезности по необходимости:
EN:* install Homebrew (http://brew.sh/) -- this will automatically install **XCode Command Line Utils**, including `git`, and then other useful stuff if needed:
  ```
  brew install ascii tree htop rg cpulimit wifi-password
  brew install jenv node rust go
  brew install ffmpeg exiftool media-info graphviz telnet
  ```
  ```bash
RU:  brew install rbenv  # установить rbenv
EN:  brew install rbenv  # install rbenv
RU:  # brew install -L   # получить список всех доступных для установки
EN:  # brew install -L   # to list all the available versions for install
  ```

RU:## Настроить SSH
EN:## Configure SSH

RU:* сгенерировать SSH-ключи и залить публичный ключ везде, куда нужно, например, в GitHub
EN:* generate the SSH keys and upload the public key everywhere, for example, to GitHub
  ```
  ssh-keygen -t ed25519 -C "mynewmac"
  chmod 700 ~/.ssh
  chmod 600 ~/.ssh/id_ed25519
  chmod 644 ~/.ssh/id_ed25519.pub
  ```
RU:* пример `~/.ssh/config`:
EN:* `~/.ssh/config` example:
  ```
  Include ~/_/REPOS/trash/ssh_config.txt
  Host *
    # IdentityFile ~/.ssh/id_rsa_from_backup
  Host myserver1
    HostName myserver.com
    User root
    # ServerAliveInterval 120
  ```

RU: Прочее
EN: Miscelanous

RU:* настроить GIT
EN:* configure GIT
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
RU:* выключить глючную колоризацию IRB
EN:* disable the glitchy IRB colorization
  ```
  echo "IRB.conf[:USE_COLORIZE] = false" >> ~/.irbrc
  ```
