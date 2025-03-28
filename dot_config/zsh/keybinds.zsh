bindkey -M viins '^a' beginning-of-line
bindkey -M viins '^e' end-of-line

bindkey -M viins '^b' backward-word
bindkey -M viins '^f' forward-word

bindkey -M vicmd '^k' kill-line
bindkey -M vicmd '^u' backward-kill-line

bindkey -M vicmd 'H'  run-help

# Up arrow:
bindkey '\e[A' history-substring-search-up
bindkey '\eOA' history-substring-search-up
# Down arrow:
bindkey '\e[B' history-substring-search-down
bindkey '\eOB' history-substring-search-down

# C-z to toggle current process (background/foreground)
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line -w
  else
    zle push-input -w
    zle clear-screen -w
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# Vim's C-x C-l in zsh
history-beginning-search-backward-then-append() {
  zle history-beginning-search-backward
	zle vi-add-eol
}
zle -N history-beginning-search-backward-then-append
bindkey -M viins '^x^l' history-beginning-search-backward-then-append

arch () {
  o "$(fd . /usr/share/doc/arch-wiki/html/en | fzf)"
}
zle -N arch

# FZF
bindkey '^T' fzf-file-widget
bindkey '^R' fzf-history-widget
bindkey '^H' arch 
# goto argument
bindkey '^[1' beginning-of-line
bindkey -s '^[2' '^A^F'
bindkey -s '^[3' '^A^F^F'
bindkey -s '^[4' '^A^F^F^F'
bindkey -s '^[5' '^A^F^F^F^F'
bindkey -s '^[6' '^A^F^F^F^F^F'
bindkey -s '^[7' '^A^F^F^F^F^F^F'
bindkey -s '^[8' '^A^F^F^F^F^F^F^F'

# just vim :)
bindkey -s '^V' 'vim . ^M'

# just vim :)
bindkey -s '^G' 'lazygit ^M'
