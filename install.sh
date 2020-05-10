#!/bin/sh
set -e

cd ~/.vim_runtime

if [ $1 == "--basic" ]; then
    cat ~/.vim_runtime/vimrcs/basic.vim > ~/.vimrc
    echo "Installed the Basic Vim configuration successfully! Enjoy :-)"
else
    echo 'set runtimepath+=~/.vim_runtime

    source ~/.vim_runtime/vimrcs/basic.vim
    source ~/.vim_runtime/vimrcs/filetypes.vim
    source ~/.vim_runtime/vimrcs/plugins_config.vim
    source ~/.vim_runtime/vimrcs/extended.vim

    try
    source ~/.vim_runtime/my_configs.vim
    catch
    endtry' > ~/.vimrc

    cp coc-settings.json ~/.vim/
    echo "Installed the Ultimate Vim configuration successfully! Enjoy :-)"
fi
