""""
"" e2l vim
"""

syntax enable
syntax on
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set nofoldenable
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

" vundle 
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" 
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'


Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-tags.vim'
Plugin 'prabirshrestha/async.vim'

Plugin  'hrsh7th/vim-vsnip'
Plugin 'hrsh7th/vim-vsnip-integ'

"""""""""""""""
"""""
"    e2l ctags  IDE end
"""""
"""""""""""""""

call vundle#end()



source ~/.vim/e2_asyncomplete.vim
source ~/.vim/e2l.vim

autocmd BufNewFile,BufRead *.e2 set filetype=e2
autocmd VimEnter,BufNewFile,BufRead *.e2 call E2lf()
