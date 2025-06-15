set fish_greeting
zoxide init fish | source
starship init fish | source
# ~/.config/fish/config.fish
set -Ux CARAPACE_BRIDGES 'zsh,fish,bash,inshellisense' # optional
carapace _carapace | source
