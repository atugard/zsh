alias ls='ls --color=auto'
export EDITOR=vim
export TERMINAL="st"
export BROWSER=firefox
export READER="zathura"

bindkey -v
export KEYTIMEOUT=1

#Change cursor shape for different vi modes
zle-keymap-select(){
  if [[ ${KEYMAP} == vicmd ]] || 
     [[ $1 = 'block' ]]; then
      echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
        [[ ${KEYMAP} == viins ]] ||
        [[ ${KEYMAP} == '' ]] ||
        [[ $1 = 'beam' ]]; then
      echo -ne '\e[5 q'
  fi
}

zle -N zle-keymap-select

zle-line-init(){
zle -K viins  #initiative `vi insert` as keymap (can be removed if 'bindkey -V' has been set elsewhere)
  echo -ne "\e[5 q"
}

zle -N zle-line-init
echo -ne '\e[5 q' #Use beam shape cursor on startup
preexec() { echo -ne '\e[5 q' ;} #Use beam shape cursor for each new prompt

#Edit line in vim with ctrl-e
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line



PATH="/home/david/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/david/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/david/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/david/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/david/perl5"; export PERL_MM_OPT;

#scripts
source ~/scripts/shell-functions/main.sh

export beats_id=DC:D3:A2:C4:41:1F
export _JAVA_AWT_WM_NONREPARENTING=1
export NNN_USE_EDITOR=1

[ -f "/home/david/.ghcup/env" ] && source "/home/david/.ghcup/env" # ghcup-env

setopt prompt_subst
. ~/zsh/git-prompt.sh
PROMPT='%F{red}%n%f|%F{magenta}%m%f %F{blue} $(__git_ps1 "%s") %B%~%b%f %# '


source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source ~/zsh/git-completion.zsh
source ~/zsh/git-prompt.sh
