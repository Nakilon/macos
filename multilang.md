RU:## Настройки системы
EN:## System preferences

RU:* настроить все в **Системных настройках**, например:
RU:  * выключить "Исправлять ошибки автоматически", "Смарт-кавычки"
RU:  * "Использовать функциональные клавиши как стандартные"
RU:  * "Источник ввода -- США, Русская ПК" (на новых макбуках тильда будет слева внизу)
RU:  * размер указателя мыши
RU:* включив **ускорение указателя трекпада** понадобится перелогиниться (https://www.reddit.com/r/osx/comments/4u5cny/is_there_a_way_to_disable_trackpad_acceleration/)
EN:* go through the **System Preferences**, for example:
EN:  * turn off the **Correct spelling automatically**, smart quotes
EN:  * switch change the Fn keys mode
RU:  * mouse pointer size
EN:* after turning on the **trackpad pointer acceleration** you'll have to relogin (https://www.reddit.com/r/osx/comments/4u5cny/is_there_a_way_to_disable_trackpad_acceleration/)
  ```bash
  defaults write .GlobalPreferences com.apple.trackpad.scaling -1
  ```
RU:  возможно нынче уже есть возможность включать ее и через настройки, а не из консоли
RU:* настроить **Finder** (войти в настройки любой программы в Mac OS можно комбинацией `⌘,`)
EN:  maybe it's already possible to turn on via GUI, not only Terminal
EN:* configure **Finder** (on macOS you can open Preferences on any program with `⌘,`)

RU:## Поставить главные проги
EN:## Install main software

RU:* поставить Google **Chrome** и
RU:  * либо (если это домашний компьютер) настроить параметры синхронизации, чтоб не засинхрил табы или еще чего
RU:  * либо (если это рабочий компьютер) добавить в закладки корпоративные сервисы, проверить почту
RU:  * поставить расширения **uBlock Origin Lite** (https://chromewebstore.google.com/detail/ublock-origin-lite/ddkjiahejlhfcafbddmgiahcphecmpfh) и **Empty New Tab Page** (https://chrome.google.com/webstore/detail/empty-new-tab-page/dpjamkmjmigaoobjbekmfgabipmfilij?hl=ru)
RU:* установить **чатики** (Slack и пр.) либо пооткрывать их в браузере вместе с почтой и пр.
EN:* install Google **Chrome** and
EN:  * either (if it's a personal machine) configure syncronization to avoid unwanted tab sync or anything
EN:  * or (if it's a machine given at work) bookmark corporative services, check the email
EN:  * install **uBlock Origin Lite** (https://chromewebstore.google.com/detail/ublock-origin-lite/ddkjiahejlhfcafbddmgiahcphecmpfh) and **Empty New Tab Page** (https://chrome.google.com/webstore/detail/empty-new-tab-page/dpjamkmjmigaoobjbekmfgabipmfilij?hl=ru) browser extensions
EN:* install **messengers** (Slack, etc.) or open them as browser tabs together with email, etc.
RU:* включить в системе Уведомления для каждого приложения явным образом, потому что по умолчанию они будут выключены (протестировать можно на https://www.bennish.net/web-notifications.html)
EN:* turn on the Notifications explicitly, since they will be turned off by default for some reason (test browser notification here: https://www.bennish.net/web-notifications.html)
RU:* установить **Sublime Text** (http://www.sublimetext.com/), настроить:
EN:* install **Sublime Text** (http://www.sublimetext.com/), configure:
  ```
  {
    "atomic_save": false,
    // "auto_complete": false,
    "color_scheme": "Packages/Color Scheme - Default/Slush & Poppies.tmTheme",
    "ensure_newline_at_eof_on_save": true,
    "font_size": 16,
    "ignored_packages":
    [
      "Vintage"
    ],
    // "index_files": false,
    // "show_git_status": false,
    "tab_size": 2,
    "translate_tabs_to_spaces": true,
    "trim_trailing_white_space_on_save": true,
    "ui_scale": 2.0,  // need restart
  }
  ```
RU:  и чтоб от последней опции не обрезались пробелы на концах строк в Markdown файлвх, создаем файл `~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Markdown.sublime-settings` с содержимым:
EN:  and to avoid the unwanted space trimming for Markdown files, create the `~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Markdown.sublime-settings` like this:
  ```
  {
    "trim_trailing_white_space_on_save": false,
  }
  ```
RU:  можно в этот файл попасть и так: ![](https://i.imgur.com/RWFBSbq.png)
EN:  you also can open this file from GUI: ![](https://i.imgur.com/RWFBSbq.png)
  cmd+shift+P -> Install Package Control, cmd+shift+P -> Install Package -> sublimelinterruby, cmd+shift+P -> Install Package -> xpath

RU:## Настроить Терминал
EN:## Configure Terminal

RU:* настроить/создать Профиль -- цвет фона (оттенки серого, 80%), шелл (bash или zsh по умолчанию)
EN:* configure/create Profile -- background color (grey, 80%), shell (bash or zsh by default)
RU:* (опционально) настроить **hostname**, который отображается в prompt-е (справка по настройке bash prompt -- http://ss64.com/osx/syntax-prompt.html)
EN:* (optionally) configure **hostname**, that is displayed to the left from the bash prompt (bash prompt configuration help -- http://ss64.com/osx/syntax-prompt.html)
  ```bash
  sudo scutil --set ComputerName "nakibook"
  sudo scutil --set LocalHostName "nakibook"
  sudo scutil --set HostName "nakibook"
  ```
RU:  возможно, это можно сделать и через GUI: http://apple.stackexchange.com/a/83801/54395
EN:  maybe it's already possible to do in GUI: http://apple.stackexchange.com/a/83801/54395
RU:* если bash, то настроить `~/.bash_profile`:
EN:* if bash, then configure `~/.bash_profile`:
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
  # export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
RU:  # и положить туда одну строку: `--no-ignore`, чтоб он не игнорил файлы из `.gitignore`
EN:  # and put the `--no-ignore` there to make it stop ignoring the files from `.gitignore`
  ```
RU:* если zsh, то настроить `~/.zshrc`:
EN:* if zsh, then configure `~/.zshrc`:
  ```
  export EDITOR=nano
  export PROMPT='%F{111}%m:%F{2}%~ %(!.#.$)%f '
  export LANG='en_US.UTF-8'
  export LESS=' -R '
  export PATH="$HOME/_/REPOS/macos/bin:$PATH"
  ```

RU:## Настроить SSH
EN:## Configure SSH

RU:* сгенерировать SSH-ключи и залить публичный ключ везде, куда нужно, например, в GitHub
EN:* generate the SSH keys and upload the public key where needed, for example, to GitHub
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

RU:## Поставить остальные проги
EN:## Install other software

RU:* установить Homebrew (http://brew.sh/) -- при этом будут автоматически установлены **XCode Command Line Utils**, в составе которых `git`, после чего следуйте инструкциям по добавлению brew в PATH
RU:* а далее всякие полезности по необходимости:
EN:* install Homebrew (http://brew.sh/) -- this will automatically install **XCode Command Line Utils**, including `git`, then follow the instructuions on how to add brew to PATH
EN:* and then other useful stuff if needed:
  ```
  brew install tree htop rg graphviz
  brew install ascii cpulimit wifi-password
  brew install jenv node rust go
  brew install ffmpeg exiftool media-info telnet
  ```
  ```bash
  brew install rbenv
RU:  # brew install -L   # получить список всех доступных для установки
EN:  # brew install -L   # to list all the available versions for install
  ```
RU:  в случае zsh нужно вручную добавить rbenv в autocomplete -- см. ихнюю документацию
EN:  in case of zsh refer to their docs for setting up the autocomplete

RU:## Прочее
EN:## Miscelanous

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
