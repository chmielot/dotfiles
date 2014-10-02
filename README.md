# Installation

    curl https://raw.githubusercontent.com/chmielot/dotfiles/master/bin/bootstrap.sh | bash

# Structure

1. Symlinks in `locations` indicate where the soon-to-be-created symlinks end up
   (relative to `$HOME/`)
1. The `topics` directory contains the acutal dotfiles (grouped by domain)
1. The whole configure-my-osx stuff is based on Ansible and located in `ansible`

# Warning / TODO

Everything is currently hardcoded to my personal stuff:
* `$WORKSPACE_DIR` in `bin/bootstrap.sh`
* `$DOTFILED_DIR` in `bin/bootstrap.sh`
* Dotfiles git repository in `bin/bootstrap.sh`
* The whole ansible stuff in `ansible/group_vars/all`
