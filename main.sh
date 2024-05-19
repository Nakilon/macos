ruby -pe '$_[/^RU:/]and$_=$'"'"';$_[/^EN:/]and$_=p' < multilang.md > RU.md
ruby -pe '$_[/^EN:/]and$_=$'"'"';$_[/^RU:/]and$_=p' < multilang.md > EN.md
