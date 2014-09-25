# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Disable greeting message
set fish_greeting

# Theme
set fish_theme krisleech

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler
set fish_plugins brew extract aliases path lastcd

# Path to your custom folder (default path is $FISH/custom)
set fish_custom $HOME/.fish_custom/

# TODO: move this somewhere else
set -x HOMEBREW_CASK_OPTS "--appdir=/Applications"
set -x PYTHONSTARTUP "$HOME/.pythonrc"

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish
