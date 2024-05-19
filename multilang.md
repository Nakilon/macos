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
RU:* поставить Google **Chrome** и
RU:  * либо (если это домашний компьютер) настроить параметры синхронизации, чтоб не засинхрил табы или еще чего
RU:  * либо (если это рабочий компьютер) добавить в закладки корпоративные сервисы, проверить почту
RU:  * поставить расширения **uBlock Origin** (https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm) и **Empty New Tab Page** (https://chrome.google.com/webstore/detail/empty-new-tab-page/dpjamkmjmigaoobjbekmfgabipmfilij?hl=ru)
RU:* установить **чатики** (Slack и пр.) либо пооткрывать их в закрепленных вкладках браузера вместе с почтой и пр.
RU:* настроить **Терминал** и **hostname**, который отображается в prompt-е (справка по настройке bash prompt -- http://ss64.com/osx/syntax-prompt.html)
EN:  maybe it's already possible to turn on via GUI, not only Terminal
EN:* configure **Finder** (on macOS you can open Preferences on any program with `⌘,`)
EN:* install Google **Chrome** and
EN:  * either (if it's a personal machine) configure syncronization to avoid unwanted tab sync or anything
EN:  * or (if it's a machine given at work) bookmark corporative services, check the email
EN:  * install **uBlock Origin** (https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm) and **Empty New Tab Page** (https://chrome.google.com/webstore/detail/empty-new-tab-page/dpjamkmjmigaoobjbekmfgabipmfilij?hl=ru) browser extensions
EN:* install **messengers** (Slack, etc.) or open them as pinned browser tabs together with email, etc.
EN:* configure **Terminal** and **hostname**, that is displayed to the left from the bash prompt (bash prompt configuration help -- http://ss64.com/osx/syntax-prompt.html)
  
  ```bash
  sudo scutil --set ComputerName "nakibook"
  sudo scutil --set LocalHostName "nakibook"
  sudo scutil --set HostName "nakibook"
  ```
RU:  возможно, что это можно сделать и через GUI: http://apple.stackexchange.com/a/83801/54395
RU:* установить **Sublime Text** (http://www.sublimetext.com/), настроить:
EN:  maybe it's already possible to do in GUI: http://apple.stackexchange.com/a/83801/54395
EN:* install **Sublime Text** (http://www.sublimetext.com/), configure:
  
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
RU:  (git status выключен потому, что из-за какой-то баги колошматит процессор как сумасшедший)
RU:* и чтоб от последней опции не обрезались пробелы на концах строк в Markdown файлвх, создаем файл `~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Markdown.sublime-settings` с содержимым:
EN:  (git status is turned of because there is some bug that kills the CPU)
EN:* and to avoid the unwanted space trimming for Markdown files, create the `~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Markdown.sublime-settings` like this:
  
  ```
  {
    "trim_trailing_white_space_on_save": false,
  }
  ```
RU:  можно в этот файл попасть и так: ![](https://i.imgur.com/RWFBSbq.png)
RU:* настроить `~/.bash_profile`
EN:  you also can open this file from GUI: ![](https://i.imgur.com/RWFBSbq.png)
EN:* configure `~/.bash_profile`
  
  ```bash
  shopt -s histappend
  export HISTFILESIZE=100500
  export HISTSIZE=9001
  export HISTCONTROL=ignorespace
  export HISTTIMEFORMAT='%F %T '
  # export PROMPT_COMMAND='history -a;'

RU:  # автоматически распечатывает локальный файл `CATME.txt`, когда вы делаете `cd` куда-либо
EN:  # automatically cats the local `CATME.txt` file when you `cd` anywhere
  export PROMPT_COMMAND="history -a; if [[ -e CATME.txt && \"\$PWD\" != \"\$HOME\" && \"\$(history 1 | awk '{print \$4;}')\" == 'cd' ]]; then cat CATME.txt; fi;"

RU:  export LANG="en_US.UTF-8"
RU:  # потому что иначе локаль берется из настроек ОС, а там у нас стоит русский
RU:
  export CLICOLOR=1
  export EDITOR=nano
  export GREP_COLOR='01;31'
  export GREP_OPTIONS='--color=always'

RU:  # `less` будет всегда запускаться с флагом `-R` (для цветных букв)
EN:  # colored letters support for `less`
  export LESS=' -R '

RU:  # открывает картинки быстрей (а некоторые файлы, например .obj, даже правильней), чем просмотрщик, который вызывается через open
EN:  # opens images faster (and for some files such as .obj even more correctly), than a `open` app
  ql(){
    qlmanage -p "$@" >/dev/null 2>&1
  }

RU:  # позволяет из Терминала инициировать напоминалки, которые вылезут в правом верхнем углу через заданное время
EN:  # allows you to create a OS corner notifications after a while
  notification(){
    ( sleep `expr "$1"` && osascript -e "display notification \"$*\" with Title \"Notification from Terminal\"" )&
  }
  ```
RU:  далее уже в зависимости от того, что у вас будет установлено
EN:  the rest depends on what you've installed
  ```
  export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc
RU:  # и положить туда одну строку: `--no-ignore`, чтоб он не игнорил файлы из `.gitignore`
EN:  # and put the`--no-ignore` to make it stop ignoring the files from `.gitignore`
  
  alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

  eval "$(rbenv init -)"
  export PATH="$HOME/.jenv/bin:$PATH"
  eval "$(jenv init -)"
  ```
RU:  либо хранить это все в другом месте
EN:  or store this all elsewhere
  ```bash
  source ~/somewhere/.bash_profile
  ```
RU:* настроить `~/.ssh/config`, например:
EN:* configure `~/.ssh/config`, for example:
  
  ```
  Host *
    IdentityFile ~/.ssh/id_rsa_ubuntu
  Host myserver
    HostName myserver.com
    User root
  ```
RU:* сгенерировать (либо взять из бэкапа старой машины) SSH-ключи и залить `id_rsa.pub` везде, куда нужно, например, в Github
EN:* generate (or take from some backup) the SSH keys and upload the `id_rsa.pub` everywhere, for example, to Github
  
  ```
  ssh-keygen -t rsa -C "johndoe@example.com"
  chmod 700 ~/.ssh
  chmod 600 ~/.ssh/id_rsa
  chmod 644 ~/.ssh/id_rsa.pub
  ```
RU:* установить Homebrew (http://brew.sh/) -- при этом будут автоматически установлены **XCode Command Line Utils**, в составе которых `git`, а далее всякие полезности по необходимости:
EN:* install Homebrew (http://brew.sh/) -- this will automatically install **XCode Command Line Utils**, including `git`, and then other useful stuff if needed:
  
  ```
  brew install ascii tree htop rg cpulimit wifi-password
  brew install jenv node rust go
  brew install ffmpeg exiftool media-info graphviz telnet
  ```
RU:* установить rbenv (https://github.com/rbenv/rbenv)
EN:* install rbenv (https://github.com/rbenv/rbenv)
  
  ```bash
  brew install rbenv
RU:  brew install -L   # получить список всех доступных для установки
EN:  brew install -L   # to list all the available versions for install
  ```
RU:* настроить `~/.gitconfig`
EN:* configure `~/.gitconfig`
  
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
RU:  либо заинклюдить из другого файла  
EN:  or include this all from elsewhere
  ```
  [include]
    path = /Users/johndoe/backup/.gitconfig
  ```
RU:* выключить глючную колоризацию IRB
EN:* disable the glitchy IRB colorization

  ```
  echo "IRB.conf[:USE_COLORIZE] = false" > ~/.irbrc
  ```
RU:* для восстановления атрибутов, если они попортились в ходе восстановления файлов из бэкапа
EN:* to restore attributes if they were broken during some backup restore
  
  ```bash
  find /path/to/base/dir -type f -exec chmod 644 {} +
  ```
