#!/bin/bash
set -e

DIR=$(dirname "$(readlink -f "$0")")
cd $DIR

if [[ $1 == "--basic" ]]; then
    cat $DIR/vimrcs/basic.vim > ~/.vimrc
    echo "Installed the Basic Vim configuration successfully! Enjoy :-)"
else
    echo "set runtimepath+=$DIR

source $DIR/vimrcs/basic.vim
source $DIR/vimrcs/filetypes.vim
source $DIR/vimrcs/plugins_config.vim
source $DIR/vimrcs/extended.vim

try
source $DIR/my_configs.vim
catch
endtry" > ~/.vimrc

    cp coc-settings.json ~/.vim/

    GIT_PATH=$(command -v git)
    GITLFS_PATH=$(command -v git-lfs)
    if [[ -x $GIT_PATH && `grep Microsoft /proc/version` ]]; then
        if [[ ! -e "$GIT_PATH.bak" ]]; then
            sudo cp $GIT_PATH "$GIT_PATH.bak"
        fi
        if [[ ! -e "$GITLFS_PATH.bak" ]]; then
            sudo cp $GITLFS_PATH "$GITLFS_PATH.bak"
        fi
        sudo cp ~/.vim_runtime/wsl_bin/* /usr/bin/
    else
        echo "no git excutable found!" 1>&2
    fi
    echo "Installed the Ultimate Vim configuration successfully! Enjoy :-)"
fi
