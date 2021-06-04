* настроить все в **System Preferences**, например
  * выключить **Correct spelling automatically**
  * инвертировать кнопку Fn
  * поставить раскладки "США" (на новых макбуках тильды будет слева внизу) и "Русская - ПК"
* выключить ускорение указателя трекпада [и перелогиниться](https://www.reddit.com/r/osx/comments/4u5cny/is_there_a_way_to_disable_trackpad_acceleration/)
  
  ```bash
  defaults write .GlobalPreferences com.apple.trackpad.scaling -1
  ```
* настроить **Finder** (войти в настройки любой программы в Mac OS можно комбинацией `⌘,`)
* установить [FreeSMUG Chromium](http://www.freesmug.org/chromium) или [Chrome](https://www.google.com/chrome/browser/desktop/) и
  * либо (если это домашний компьютер) настроить параметры синхронизации, чтоб не засинхрил табы или еще что
  * либо (если это рабочий компьютер) добавить в закладки корпоративные сервисы, проверить почту, м.б. завести гмейл акк для выборочной синхронизации и воостановлением пароля на корпоративную
  * а также поставить [uBlock Origin](https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm) и [расширение Empty New Tab Page](https://chrome.google.com/webstore/detail/empty-new-tab-page/dpjamkmjmigaoobjbekmfgabipmfilij?hl=ru)
* установить [**Slack**](https://itunes.apple.com/us/app/slack/id803453959) и прочие чатики
* настроить **Terminal** и hostname, который отображается в prompt-е ([справка](http://ss64.com/osx/syntax-prompt.html))
  
  ```bash
  sudo scutil --set ComputerName "nakibook"
  sudo scutil --set LocalHostName "nakibook"
  sudo scutil --set HostName "nakibook"
  ```
  возможно, что это можно сделать и через GUI: http://apple.stackexchange.com/a/83801/54395
* установить [**Sublime**](http://www.sublimetext.com/), настроить
  
  ```
  {
    "atomic_save": false,
    "color_scheme": "Packages/Color Scheme - Default/Slush & Poppies.tmTheme",
    "ensure_newline_at_eof_on_save": true,
    "font_size": 21,
    "tab_size": 2,
    "translate_tabs_to_spaces": true,
    "trim_trailing_white_space_on_save": true,
    "show_git_status": false
    //"ignored_packages":
    //[
     // "Vintage"
     //],
    //"theme": "Default.sublime-theme",
  }
}
  ```
* и чтоб от последней опции не обрезались пробелы на концах строк в Markdown-файлвх, создаем файл `~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Markdown.sublime-settings` с содержимым:
  
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
  export PROMPT_COMMAND='history -a;'
  
  export LANG="en_US.UTF-8"   # потому что иначе локаль берется из настроек ОС, а там может стоять русский

  export CLICOLOR=1
  export EDITOR=nano
  export GREP_COLOR='01;31'
  export GREP_OPTIONS='--color=always'
  
  export LESS=' -R '   # less будет всегда запускаться с флагом -R (для цветных букв)
  
  eval "$(rbenv init -)"

  alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
  ```
  либо заинклюдить из другого файла  
  ```bash
  source /Users/johndoe/backup/.bash_profile
  ```
* установить rbenv + ruby + bundler
  
  ```bash
  ...
  rbenv install 2.3.8
  cd /tmp
  rbenv local 2. 3.8
  # <restart Terminal tab> otherwise `gem install` tried to install to /Library`
  cd /tmp
  gem install bundler
  ```
  
* настроить `~/.ssh/config`; примеры:
  
  ```
  Host *
    IdentityFile ~/.ssh/id_rsa_ubuntu
  Host myserver
    HostName myserver.com
    User root
  ```
* сгенерировать (либо взять из бэкапа старой машины) SSH-ключи и залить `id_rsa.pub` везде, куда нужно
  
  ```
  ssh-keygen -t rsa -C "johndoe@example.com"
  ```
  TODO: правильный chmod
* установить [Homebrew](http://brew.sh/) -- при этом будут автоматически установлены **XCode Command Line Utils**, в составе которых `git`, а `git-lfs` и прочие опциональные полезности можно доустановить потом
  
  ```
  brew install tree htop rg
  ```
  чтобы не ломать системный `ruby`, установить [**rbenv**](https://github.com/rbenv/rbenv)
* настроить `~/.gitconfig`
  
  ```
  [branch]
    autosetupmerge = always
    autosetuprebase = always
  [core]
    editor = nano
    excludesfile = /Users/john/.gitignore
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
* для восстановления правильных атрибутов, если они попортились в ходе восстановления файлов из бэкапа
  
  ```bash
  find /path/to/base/dir -type f -exec chmod 644 {} +
  ```
* прочие полезные штуки для вашего `~/.bash_profile`
  
  ```bash
  # позволяет из Терминала инициировать напоминалки, которые вылезут в правом верхнем углу через заданное время
  notification(){
    ( sleep `expr "$1"` && osascript -e "display notification \"$*\" with Title \"Notification from Terminal\"" )&
  }
  ```
  ```bash
  # алиас к Quick View -- эта штука открывает картинки быстрей, чем просмотрщик, который вызывается через open
  ql(){
    qlmanage -p "$@" >/dev/null 2>&1
  }
  ```
  ```bash
  # по команде cd выполняет файл .bashrc, если такой обнаруживается в директории
  # полезно для установки переменных окружения и echo с подсказками
  export PROMPT_COMMAND="history -a; if [[ -e .bashrc && \"\$PWD\" != \"\$HOME\" && \"\$(history 1 | awk '{print \$4;}')\" == 'cd' ]]; then source .bashrc; fi;"
  ```

TODO: придумать этому алиас
```
find my_folder -type f -exec md5 -q {} + | sort | md5 -q
```
