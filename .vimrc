set nocompatible              " required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'            " 插件管理
Plugin 'dracula/vim'                     " 颜色主题
Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'fatih/vim-go'                    " golang 插件
Plugin 'scrooloose/nerdtree'             " 目录插件
Plugin 'vim-airline/vim-airline'         " 底边栏目插件
Plugin 'kien/ctrlp.vim'                  " 最近打开文件插件
Plugin 'flazz/vim-colorschemes'
Plugin 'joshdick/onedark.vim'
" Plugin 'Valloric/YouCompleteMe'          " 自动补全插件

call vundle#end()            " required
filetype plugin indent on    " required

" --------------------------- vim base config ----------------
" syntax
syntax on

" set utf-8
set encoding=utf-8

" colorscheme
" colorscheme dracula 
colorscheme onedark

" font set
set guifont=Menlo\ Regular:h13

" set window size
set lines=50
set columns=100

" set number and indent
set number
set smartindent
set hlsearch
set showmatch
set noerrorbells
set tabstop=4
set softtabstop=4
set shiftwidth=4

" voice setting
set vb t_vb=

" set no swap
set noswapfile

" hide menu
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar

" mouse allowed
set mouse=a

" plugin key map
map <F2> :GoBuild<CR>
map <F3> :GoRun<CR>
map <F1> :NERDTreeToggle<CR>
map <F4> :CtrlPMRU<CR>

" base key map
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {<CR>}<ESC>kA<CR>
inoremap " ""<ESC>i
inoremap ' ''<ESC>i
inoremap <C-l> <Esc>$a
inoremap <C-f> <Esc>lli

" node tree config
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd BufEnter * lcd %:p:h

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
