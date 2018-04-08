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
Plugin 'klen/python-mode'              " python mode
Plugin 'nvie/vim-flake8'               " flake 8
Plugin 'tomasiser/vim-code-dark'       " vscode-them for vim
Plugin 'mhinz/vim-signify'             " show git change
Plugin 'tpope/vim-commentary'          " 代码注释
Plugin 'Valloric/YouCompleteMe'        " 代码补全
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
syntax on                   " 开启语法高亮
" set background=dark
" color dracula             " 可以显示背景的主题
" colorscheme gruvbox         " 设置主题---有点灰色
colorscheme codedark
set t_Co=256
set t_ut=


" ---------------------------------- 础设定 ----------------------------
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
vmap y :w !pbcopy<CR><CR>
nmap yy :.w !pbcopy<CR><CR>
nmap p :r !pbpaste<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 其他插件设置


" -------------- vim-airline theme ------------
let g:airline_theme='simple'


" -------------- nodetree -------------------
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


" ------------- markdown ---------------
set nofoldenable
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_no_extensions_in_markdown = 1


""""""""""""""""""""""
 "Quickly Run
""""""""""""""""""""""
" map <C-r> :call CompileRunGcc()<CR>
" func! CompileRunGcc()
"     exec "w"
"     if &filetype == 'c'
"                 exec "!g++ % -o %<"
"                 exec "!time ./%<"
"     elseif &filetype == 'cpp'
"                 exec "!g++ % -o %<"
"                 exec "!time ./%<"
"     elseif &filetype == 'java'
"                 exec "!javac %"
"                 exec "!time java %<"
"     elseif &filetype == 'sh'
"                 exec "!sh %"
"                 exec "!time sh %<"
"     elseif &filetype == 'python'
" 		        exec "!time python2.7 %"
"     elseif &filetype == 'go'
"                 exec "!go build %<"
"                 exec "!time go run %"
"     elseif &filetype == 'javascript.jsx'
"                 exec "!node %<"
"                 exec "!time node %"
"     endif
" endfunc


" -------------------- youcomplate me --------------
" 自动补全配置
set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif    "离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"    "回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"youcompleteme  默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

let g:ycm_collect_identifiers_from_tags_files=1    " 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2        " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0                         " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1           " 语法关键字补全
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>    "force recomile with syntastic
"nnoremap <leader>lo :lopen<CR>    "open locationlist
"nnoremap <leader>lc :lclose<CR>    "close locationlist
inoremap <leader><leader> <C-x><C-o>
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处

" --------- 
"indentLine
let g:indentLine_setColors = 0
let g:indentLine_char='┆'
let g:indentLine_enabled = 1


" --------------------------- pymode ------------------------
let g:pymode_options_max_line_length = 0
