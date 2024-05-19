## Настройки системы

* настроить все в **Системных настройках**, например:
  * выключить "Исправлять ошибки автоматически", "Смарт-кавычки"
  * "Использовать функциональные клавиши как стандартные"
  * "Источник ввода -- США, Русская ПК" (на новых макбуках тильда будет слева внизу)
* включив **ускорение указателя трекпада** понадобится перелогиниться (https://www.reddit.com/r/osx/comments/4u5cny/is_there_a_way_to_disable_trackpad_acceleration/)
  ```bash
  defaults write .GlobalPreferences com.apple.trackpad.scaling -1
  ```
  возможно нынче уже есть возможность включать ее и через настройки, а не из консоли
* настроить **Finder** (войти в настройки любой программы в Mac OS можно комбинацией `⌘,`)

## Поставить главные проги

* поставить Google **Chrome** и
  * либо (если это домашний компьютер) настроить параметры синхронизации, чтоб не засинхрил табы или еще чего
  * либо (если это рабочий компьютер) добавить в закладки корпоративные сервисы, проверить почту
  * поставить расширения **uBlock Origin** (https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm) и **Empty New Tab Page** (https://chrome.google.com/webstore/detail/empty-new-tab-page/dpjamkmjmigaoobjbekmfgabipmfilij?hl=ru)
* установить **чатики** (Slack и пр.) либо пооткрывать их в браузере вместе с почтой и пр.
* установить **Sublime Text** (http://www.sublimetext.com/), настроить:
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
* и чтоб от последней опции не обрезались пробелы на концах строк в Markdown файлвх, создаем файл `~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Markdown.sublime-settings` с содержимым:
  ```
  {
    "trim_trailing_white_space_on_save": false,
  }
  ```
  можно в этот файл попасть и так: ![](https://i.imgur.com/RWFBSbq.png)

## Настроить Терминал

* настроить **Терминал** и **hostname**, который отображается в prompt-е (справка по настройке bash prompt -- http://ss64.com/osx/syntax-prompt.html)
  ```bash
  sudo scutil --set ComputerName "nakibook"
  sudo scutil --set LocalHostName "nakibook"
  sudo scutil --set HostName "nakibook"
  ```
  возможно, это можно сделать и через GUI: http://apple.stackexchange.com/a/83801/54395
* настроить `~/.bash_profile`
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
  export LESS=' -R '  # `less` будет всегда запускаться с флагом `-R` (для цветных букв)

  export BASH_SILENCE_DEPRECATION_WARNING=1  # https://apple.stackexchange.com/q/371997/54395

  export LANG='en_US.UTF-8'  # потому что иначе локаль берется из настроек ОС, а там у нас стоит русский

  # склонируйте этот репозиторий и добавьте bin к PATH
  export PATH="$HOME/_/REPOS/macos/bin:$PATH"
  # bin/ql                   открывает картинки быстрей (а некоторые файлы, например .obj, даже правильней), чем просмотрщик, который вызывается через open
  # bin/subl                 симлинк на Sublime Text
  # bin/size-by-extension    https://serverfault.com/a/367195/67097
  # bin/number-by-directory  считает файлы в директориях

  # если вы -- это я
  source "$HOME/_/REPOS/trash/bash_profile.sh"


  # позволяет из Терминала инициировать напоминалки, которые вылезут в правом верхнем углу через заданное время
  # notification(){
  #   ( sleep `expr "$1"` && osascript -e "display notification \"$*\" with Title \"Notification from Terminal\"" )&
  # }
  ```
  далее уже в зависимости от того, что у вас будет установлено
  ```
  # eval "$(rbenv init -)"
  # export PATH="$HOME/.jenv/bin:$PATH"
  # eval "$(jenv init -)"

  # export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
  # и положить туда одну строку: `--no-ignore`, чтоб он не игнорил файлы из `.gitignore`
  ```

## Поставить остальные проги

* установить Homebrew (http://brew.sh/) -- при этом будут автоматически установлены **XCode Command Line Utils**, в составе которых `git`, а далее всякие полезности по необходимости:
  ```
  brew install ascii tree htop rg cpulimit wifi-password
  brew install jenv node rust go
  brew install ffmpeg exiftool media-info graphviz telnet
  ```
  ```bash
  brew install rbenv  # установить rbenv
  # brew install -L   # получить список всех доступных для установки
  ```

## Настроить SSH

* сгенерировать SSH-ключи и залить `id_rsa.pub` везде, куда нужно, например, в GitHub
  ```
  ssh-keygen -t rsa -C "mynewmacbook"
  chmod 700 ~/.ssh
  chmod 600 ~/.ssh/id_rsa
  chmod 644 ~/.ssh/id_rsa.pub
  ```
* пример `~/.ssh/config`:
  ```
  Include ~/_/REPOS/trash/ssh_config.txt
  Host *
    # IdentityFile ~/.ssh/id_rsa_from_backup
  Host myserver1
    HostName myserver.com
    User root
    # ServerAliveInterval 120
  ```

 Прочее

* настроить GIT
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
* выключить глючную колоризацию IRB
  ```
  echo "IRB.conf[:USE_COLORIZE] = false" >> ~/.irbrc
  ```
