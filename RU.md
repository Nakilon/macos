Т.к. локализация в системе хорошая и нет проблем в ней что-то найти, то и нет смысла отказываться от русского, поэтому названия всех компонентов настройки будут здесь на русском.

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
* поставить Google **Chrome** и
  * либо (если это домашний компьютер) настроить параметры синхронизации, чтоб не засинхрил табы или еще чего
  * либо (если это рабочий компьютер) добавить в закладки корпоративные сервисы, проверить почту
  * поставить расширения **uBlock Origin** (https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm) и **Empty New Tab Page** (https://chrome.google.com/webstore/detail/empty-new-tab-page/dpjamkmjmigaoobjbekmfgabipmfilij?hl=ru)
* установить **чатики** (Slack и пр.) либо пооткрывать их в закрепленных вкладках браузера вместе с почтой и пр.
* настроить **Терминал** и **hostname**, который отображается в prompt-е (справка по настройке bash prompt -- http://ss64.com/osx/syntax-prompt.html)
  
  ```bash
  sudo scutil --set ComputerName "nakibook"
  sudo scutil --set LocalHostName "nakibook"
  sudo scutil --set HostName "nakibook"
  ```
  возможно, что это можно сделать и через GUI: http://apple.stackexchange.com/a/83801/54395
* установить **Sublime Text** (http://www.sublimetext.com/), настроить:
  
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
  (git status выключен потому, что из-за какой-то баги колошматит процессор как сумасшедший)
* и чтоб от последней опции не обрезались пробелы на концах строк в Markdown файлвх, создаем файл `~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Markdown.sublime-settings` с содержимым:
  
  ```
  {
    "trim_trailing_white_space_on_save": false,
  }
  ```
  можно в этот файл попасть и так: ![](https://i.imgur.com/RWFBSbq.png)
* настроить `~/.bash_profile`
  
  ```bash
  shopt -s histappend
  export HISTFILESIZE=100500
  export HISTSIZE=9001
  export HISTCONTROL=ignorespace
  export HISTTIMEFORMAT='%F %T '
  # export PROMPT_COMMAND='history -a;'

  # автоматически распечатывает локальный файл `CATME.txt`, когда вы делаете `cd` куда-либо
  export PROMPT_COMMAND="history -a; if [[ -e CATME.txt && \"\$PWD\" != \"\$HOME\" && \"\$(history 1 | awk '{print \$4;}')\" == 'cd' ]]; then cat CATME.txt; fi;"

  export LANG="en_US.UTF-8"
  # потому что иначе локаль берется из настроек ОС, а там у нас стоит русский

  export CLICOLOR=1
  export EDITOR=nano
  export GREP_COLOR='01;31'
  export GREP_OPTIONS='--color=always'

  # `less` будет всегда запускаться с флагом `-R` (для цветных букв)
  export LESS=' -R '

  # открывает картинки быстрей (а некоторые файлы, например .obj, даже правильней), чем просмотрщик, который вызывается через open
  ql(){
    qlmanage -p "$@" >/dev/null 2>&1
  }

  # позволяет из Терминала инициировать напоминалки, которые вылезут в правом верхнем углу через заданное время
  notification(){
    ( sleep `expr "$1"` && osascript -e "display notification \"$*\" with Title \"Notification from Terminal\"" )&
  }
  ```
  далее уже в зависимости от того, что у вас будет установлено
  ```
  export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc
  # и положить туда одну строку: `--no-ignore`, чтоб он не игнорил файлы из `.gitignore`
  
  alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

  eval "$(rbenv init -)"
  export PATH="$HOME/.jenv/bin:$PATH"
  eval "$(jenv init -)"
  ```
  либо хранить это все в другом месте
  ```bash
  source ~/somewhere/.bash_profile
  ```
* настроить `~/.ssh/config`, например:
  
  ```
  Host *
    IdentityFile ~/.ssh/id_rsa_ubuntu
  Host myserver
    HostName myserver.com
    User root
  ```
* сгенерировать (либо взять из бэкапа старой машины) SSH-ключи и залить `id_rsa.pub` везде, куда нужно, например, в Github
  
  ```
  ssh-keygen -t rsa -C "johndoe@example.com"
  chmod 700 ~/.ssh
  chmod 600 ~/.ssh/id_rsa
  chmod 644 ~/.ssh/id_rsa.pub
  ```
* установить Homebrew (http://brew.sh/) -- при этом будут автоматически установлены **XCode Command Line Utils**, в составе которых `git`, а далее всякие полезности по необходимости:
  
  ```
  brew install ascii tree htop rg cpulimit wifi-password
  brew install jenv node rust go
  brew install ffmpeg exiftool media-info graphviz telnet
  ```
* установить rbenv (https://github.com/rbenv/rbenv)
  
  ```bash
  brew install rbenv
  brew install -L   # получить список всех доступных для установки
  ```
* настроить `~/.gitconfig`
  
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
  либо заинклюдить из другого файла  
  ```
  [include]
    path = /Users/johndoe/backup/.gitconfig
  ```
* выключить глючную колоризацию IRB

  ```
  echo "IRB.conf[:USE_COLORIZE] = false" > ~/.irbrc
  ```
* для восстановления атрибутов, если они попортились в ходе восстановления файлов из бэкапа
  
  ```bash
  find /path/to/base/dir -type f -exec chmod 644 {} +
  ```
