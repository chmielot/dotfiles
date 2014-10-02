#!/usr/bin/env bash

set -e

if [[ ! -x /usr/local/bin/brew ]]; then
    echo "Info   | Install   | homebrew"
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
fi
export PATH=/usr/local/bin:$PATH

if [[ ! -x /usr/local/bin/python ]]; then
    echo "Info   | Install   | python"
    brew install python --framework --with-brewed-openssl
fi

if [[ ! -x /usr/local/bin/ansible ]]; then
    echo "Info   | Install   | ansible"
    brew install ansible
fi

WORSPACE_DIR="$HOME/Workspace"
mkdir -p $WORSPACE_DIR

DOTFILES_DIR="$WORSPACE_DIR/chmielot/dotfiles"
mkdir -p $WORSPACE_DIR/chmielot

if [[ ! -d $DOTFILES_DIR ]]; then
    echo "Info   | Clone     | dotfiles"
    git clone https://github.com/chmielot/dotfiles.git $DOTFILES_DIR
    (cd $DOTFILES_DIR && git submodule update --init)
fi

echo "Info   | Run       | ansible-playbook"
ansible-playbook --inventory-file=$DOTFILES_DIR/ansible/inventory $DOTFILES_DIR/ansible/osx.yml
