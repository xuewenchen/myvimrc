set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'dracula/vim'
" PluginSearch

call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"基础设置
" solarized
set background=dark
syntax on
color dracula
set vb t_vb=
set number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
" set colorcolumn=110
set nocompatible
set nobackup                               " 不要备份文件
" highlight ColorColumn ctermbg=darkgray
set clipboard+=unnamed  " use the clipboards of vim and win
set paste               " Paste from a windows or from vim
set go+=a               " Visual selection automatically copied to the clipboard

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索和匹配
"
set showmatch 			" 高亮显示匹配的括号
set matchtime=1 		" 匹配括号高亮的时间（单位是十分之一秒）
set scrolloff=10  		" 光标移动到buffer的顶部和底部时保持10行距离
set hlsearch 			" 高亮搜索
set incsearch 			" 边输入边查找
set ignorecase 			" 在搜索的时候忽略大小写

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文件设置
"
set shortmess=atI
set mouse=a
set selectmode=mouse,key

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" key 设置 
"
map <C-g> :GoRun<CR>
map <leader>b :GoBuild<CR>
map <F8> :!gcc % -o %< && ./%< <CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 其他插件设置
"
" -------------- vim-airline theme ------------
let g:airline_theme='simple'

" -------------- nodetree -------------------
map <C-n> :NERDTreeToggle<CR>

" -------------- ctrlp -------------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" -------------- vim-go ---------------
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
