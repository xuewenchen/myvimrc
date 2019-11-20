"set nocompatible              " be iMproved, required
filetype off                   " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plugin 'vim-airline/vim-airline'        " airline
Plugin 'vim-airline/vim-airline-themes' " airline theme
Plugin 'scrooloose/nerdtree'            " 目录
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Xuyuanp/nerdtree-git-plugin'    " git显示文件修改
Plugin 'ctrlpvim/ctrlp.vim'             " 搜索当前目录文件
Plugin 'dracula/vim'
Plugin 'Raimondi/delimitMate'          " 括号自动补全
Plugin 'sheerun/vim-polyglot'
Plugin 'flazz/vim-colorschemes'        " 主题
" Plugin 'scrooloose/syntastic'        " 太古老的插件 语法检查插件    
Plugin 'majutsushi/tagbar'             " 显示tags
Plugin 'moll/vim-node'                 " node js plugin
" Plugin 'w0rp/ale'                    " vim8 异步语法检查
Plugin 'terryma/vim-multiple-cursors'  " 多行操作
Plugin 'godlygeek/tabular'             " 代码格文本式化插件
Plugin 'plasticboy/vim-markdown'       " markdown
Plugin 'nvie/vim-flake8'               " flake 8
" Plugin 'tomasiser/vim-code-dark'       " vscode-them for vim
Plugin 'rakr/vim-one'                  " atom colortheme now for vim
Plugin 'mhinz/vim-signify'             " show git change
Plugin 'tpope/vim-commentary'          " 代码注释
" Plugin 'Valloric/YouCompleteMe'        " 代码补全
Plugin 'taglist.vim'                   " vim taglist
Plugin 'Yggdroot/indentLine'           " 对齐竖线
Plugin 'chase/vim-ansible-yaml'        " ansible

call vundle#end()            " required
filetype plugin indent on    " required

" --------------------------------------------- 
" set leader
let mapleader=","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 主题
"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
syntax on                   " 开启语法高亮
set background=dark
colorscheme one
let g:one_allow_italics = 1


" ---------------------------------- 基础设定 ----------------------------
set vb t_vb=
set number
set showcmd                                " 显示出输入的命令
set ruler                                  " 显示光标所在位置
set nocompatible                           " 关闭兼容模式
set nobackup                               " 不要备份文件
set noswapfile                             " 不要交换文件
set autoread                               " 当文件在外部被改变时，vim自动更新载入
set history=1000                           " 历史记录条数从20到1000
set autowrite                              " 自动保存
set nowrap                                 " 设置不自动折行
set mouse=a                                " 允许鼠标

" --------------------------------- 缩进相关 --------------------------------
set autoindent                             " 自动缩进
set smartindent                            " 智能缩进
set softtabstop=4                          " 缩进长度
set shiftwidth=4                           " 缩进长度
set tabstop=4                              " tab键长度
set expandtab                              " 设置 将 tab 转换为 4 个空格


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索和匹配
set showmatch 			" 高亮显示匹配的括号
set matchtime=1 		" 匹配括号高亮的时间（单位是十分之一秒）
set hlsearch 			" 高亮搜索
set incsearch 			" 边输入边查找
set ignorecase 			" 在搜索的时候忽略大小写
set cursorline          "高亮当前行

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" key map

" 拷贝相关
set mouse=v

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 其他插件设置


" -------------- vim-airline theme ------------
let g:airline_theme='one'


" -------------- nodetree -------------------
map <C-t> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


" -------------- nodetreetab -------------------
" let g:nerdtree_tabs_focus_on_files = 1
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1


" --------------- nodetree git -------------
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }


" -------------- ctrlp -------------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 'ra'


" -------------- vim-go ---------------
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'


" ------------- markdown ---------------
set nofoldenable
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
l
