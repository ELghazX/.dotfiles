function fish_greeting
end

# for set nvim as default editor (alt+e)
set -gx EDITOR nvim
set -e NODE_OPTIONS

set -x GEMINI_API_KEY AIzaSyBiqoV9NlqfqCkyOd2QclLlD27dCjnCetA

set -x GOPATH $HOME/go
set -x PATH $PATH /usr/local/go/bin $GOPATH/bin
if status is-interactive
    starship init fish | source
end

# List Directory
alias l='eza -lh  --icons=auto' # long list
alias ls='eza -1   --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias lt='eza --icons=auto --tree' # list folder as tree

# Handy change dir shortcuts
abbr .. 'cd ..'
abbr ... 'cd ../..'
abbr .3 'cd ../../..'
abbr .4 'cd ../../../..'
abbr .5 'cd ../../../../..'

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
abbr mkdir 'mkdir -p'

# another alias
alias n="nvim"
alias anime="ani-cli"
alias cls="clear"
alias cpp="g++"
alias pretest="tty-countdown -m 8"
alias jam="tty-clock -c -C 6 -s"
# alias cpp="g++ \$argv.cpp -o \$argv && ./\$argv"
alias cpp="g++ \$argv  && ./a.out"
alias tidur="sudo shutdown -h +60"
alias lg="lazygit"
alias t="tmux"
alias furina="furina@52.175.30.127"
