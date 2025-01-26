alias ..='cd ..'

alias ...='cd ../..'
alias ....='cd ../../..'
alias -- -='cd -'

# alias q=exit
alias clr=clear
alias sudo='sudo '
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias nr='sudo nixos-rebuild'
alias egit="run emacs --eval '(magit)'"
alias less="less -R"
alias dc="docker-compose"

# 1password
alias opx="op run --no-masking --"

alias teich-up="wakeonlan 40:b0:34:f3:d4:00"
alias teich-ssh="ssh tim@teichserver"

alias lman="man -M $HOME/ubuntu-man/"

# ai pair programming
# alias aider="op run --no-masking -- python3 -m aider --vim"
alias vimdiff="nvim -d"


if command -v nvim >/dev/null; then
	alias vim='nvim'
	alias vi='nvim'
fi

if [[ "$OSTYPE" =~ ^darwin ]]; then
  alias o='open'
  alias y=pbcopy
  alias p=pbpaste
else
  alias o='xdg-open'
  alias y="xclip -selection clipboard -in"
  alias p="xclip -selection clipboard -ou"
fi

if command -v wget >/dev/null; then
	alias wget='wget -c'
fi

if command -v lazygit >/dev/null; then
  alias lg='lazygit'
fi

if command -v lazydocker >/dev/null; then
  alias lzd='lazydocker'
fi

if command -v python >/dev/null; then
  alias py='python'
fi

if command -v python3 >/dev/null; then
  alias py='python3'
fi

if command -v exa >/dev/null; then
	alias cat='bat --theme Dracula'
fi

show() {
  # check for options
  for arg in "$@"; do
    if [[ $arg =~ "-.*" ]]; then
      cat "$@"
      return
    fi
  done

  # if no options, try to be smart
  for arg in "$@"; do
    if [[ -f $arg ]]; then
      type=$(xdg-mime query filetype "$arg")
      if [[ $type =~ "image" && $TERM =~ ".*kitty.*" ]]; then
        kitten icat "$arg"
      else
        cat "$arg"
      fi
    fi
  done
}; compdef show=cat

alias cat=show

if command -v exa >/dev/null; then
  alias exa="exa --group-directories-first";
  alias l="exa -1";
	alias ls="exa"
  alias ll="exa -lg";
  alias la="LC_COLLATE=C exa -la";
fi

take() {
  mkdir -p "$1" && cd "$1";
}; compdef take=mkdir

ig() {
  "$@" &> /dev/null
}

run() {
  ig "$@" &
}

function yi() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ "$cwd" != "" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

e() {
  type=$(xdg-mime query filetype "$1")
  if [[ -f $1 ]] && [[ $type =~ ".*text.*" ]]; then
    "$EDITOR" "$1"
  elif [[ -d $1 ]] && command -v yazi > /dev/null; then
    yi "$1"
  else 
    o "$1"
  fi
}

r() {
  local time=$1; shift;
  sleep "${time}m" && notify-send --urgency=critical 'Reminder:' "$@" > /dev/null &;
}; compdef r=sched
