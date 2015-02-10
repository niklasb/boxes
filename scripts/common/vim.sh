#!/bin/sh

echo "Setting up vim..."

# Write bootstrap vimrc
cat > ~/.vimrc <<EOF
set nocompatible        " be IMproved
filetype off            " required, reverted below

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"
" Plugins
"
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'zhaocai/GoldenView.Vim'

Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
EOF

# Grab vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim > /dev/null 2>&1

# Install plugins
vim -c PluginInstall -c qa > /dev/null 2>&1

# Fetch real vimrc
curl -s https://gist.githubusercontent.com/saelo/da3e5ad7c6885472b1f0/raw/.vimrc > ~/.vimrc
