#!/usr/bin/env bash

set -e

ROOT="$HOME/.dotfiles"

function main {
    echo "Linking config files..."

    folder "$HOME/.config/alacritty"
    folder "$HOME/.config/fish/functions"
    folder "$HOME/.ssh"

    link "$ROOT/vim"                    "$HOME/.vim"
    link "$ROOT/config/ctags"           "$HOME/.ctags"
    link "$ROOT/config/gitconfig"       "$HOME/.gitconfig"
    link "$ROOT/config/gitignore"       "$HOME/.gitignore"
    link "$ROOT/config/inputrc"         "$HOME/.inputrc"
    link "$ROOT/config/sbt_config"      "$HOME/.sbt_config"
    link "$ROOT/config/screenrc"        "$HOME/.screenrc"
    link "$ROOT/config/ssh_config"      "$HOME/.ssh/config"
    link "$ROOT/config/tmux.conf"       "$HOME/.tmux.conf"
    link "$ROOT/config/tigrc"           "$HOME/.tigrc"
    link "$ROOT/config/alacritty.yml"   "$HOME/.config/alacritty/alacritty.yml"
    link "$ROOT/fish/functions/g.fish"  "$HOME/.config/fish/functions/g.fish"

    echo "Done!"
}

function folder {
    if [ ! -d "$1" ]
    then
        mkdir -p "$1"
    fi
}

function link {
    if [ ! -e "$2" ]
    then
        ln -sfn "$1" "$2"
    fi
}

main
