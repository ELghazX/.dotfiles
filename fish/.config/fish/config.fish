if status is-interactive
    function fish_greeting
    end

    # Starship custom prompt
    starship init fish | source

    set -gx EDITOR nvim
    set -e NODE_OPTIONS

    set -x GOPATH $HOME/go
    set -x PATH $PATH /usr/local/go/bin $GOPATH/bin

    # Direnv + Zoxide
    command -v direnv &>/dev/null && direnv hook fish | source
    command -v zoxide &>/dev/null && zoxide init fish --cmd cd | source

    # Better ls
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

    # Abbrs
    abbr mkdir 'mkdir -p'

    # another alias
    alias n="nvim"
    alias anime="curd"
    alias cls="clear"
    alias cpp="g++"
    alias pretest="tty-countdown -m 8"
    alias jam="tty-clock -c -C 6 -s"
    # alias cpp="g++ \$argv.cpp -o \$argv && ./\$argv"
    alias cpp="g++ \$argv  && ./a.out"
    alias tidur="sudo shutdown -h +60"
    alias lg="lazygit"
    alias t="tmux"
    # Custom colours
    #
    cat ~/.config/fish/color.txt 2>/dev/null

    # For jumping between prompts in foot terminal
    function mark_prompt_start --on-event fish_prompt
        echo -en "\e]133;A\e\\"
    end

    # pnpm
    set -gx PNPM_HOME "/home/elghaz/.local/share/pnpm"
    if not string match -q -- $PNPM_HOME $PATH
        set -gx PATH "$PNPM_HOME" $PATH
    end

    #pip 
    function venv
        if test -f "venv/bin/activate.fish"
            source venv/bin/activate.fish
        else
            echo "Virtual environment 'venv' tidak ditemukan di direktori ini."
        end
    end
end
