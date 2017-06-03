set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=$HOME/Vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tomasr/molokai'
Plugin 'dracula/vim'
Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdtree'

call vundle#end()            " required
filetype plugin indent on    " required

" ---------------------------vim base config ----------------
" color setting
syntax on
color dracula

" font set
set gfn=Consolas:h12

" set window size
set lines=50
set columns=120

" set number
set number

set smartindent

set hlsearch

set showmatch

set noerrorbells

" voice setting
set vb t_vb=

" hide menu
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar

" mouse allowed
set mouse=a

" key map
map <F1> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

map <F2> :GoBuild<CR>
map <F3> :GoRun<CR>

" set window middle
function WindowCenterInScreen()
    set lines=9999 columns=9999
    let g:windowsSizeFixX = 58
    let g:windowsSizeFixY = 118
    let g:windowsScaleX = 7.75
    let g:windowsScaleY = 17.0
    let g:windowsPosOldX = getwinposx()
    let g:windowsPosOldY = getwinposy()
    let g:windowsScreenWidth = float2nr(winwidth(0) * g:windowsScaleX) + g:windowsPosOldX + g:windowsSizeFixX
    let g:windowsScreenHeight = float2nr(winheight(0) * g:windowsScaleY) + g:windowsPosOldY + g:windowsSizeFixY
    set lines=50 columns=120
    let g:windowsSizeWidth = float2nr(winwidth(0) * g:windowsScaleX) + g:windowsSizeFixX
    let g:windowsSizeHeight = float2nr(winheight(0) * g:windowsScaleY) + g:windowsSizeFixY
    let g:windowsPosX = ((g:windowsScreenWidth - g:windowsSizeWidth) / 2)
    let g:windowsPosY = ((g:windowsScreenHeight - g:windowsSizeHeight) / 2)
    exec ':winpos ' . g:windowsPosX . ' ' . g:windowsPosY
endfunc
au GUIEnter * call WindowCenterInScreen()
