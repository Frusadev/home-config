if status is-interactive
    # Commands to run in interactive sessions can go here
end

# aliases

alias cls=clear

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
set --export PATH "$HOME/.local/bin/" $PATH
set -ga fish_user_paths /home/frusadev/.nimble/bin
