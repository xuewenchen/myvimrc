"set nocompatible              " be iMproved, required
filetype off                   " required

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'vim-airline/vim-airline'        " airline
Plugin 'vim-airline/vim-airline-themes' " airline theme
Plugin 'ctrlpvim/ctrlp.vim'             " 模糊目录搜索文件
Plugin 'FelikZ/ctrlp-py-matcher'        " 模糊搜索高速
Plugin 'tacahiroy/ctrlp-funky'          " can search func
Plugin 'Raimondi/delimitMate'           " 括号自动补全
Plugin 'sheerun/vim-polyglot'
Plugin 'flazz/vim-colorschemes'        " 主题
Plugin 'majutsushi/tagbar'             " 显示tags
Plugin 'terryma/vim-multiple-cursors'  " 多行操作
Plugin 'godlygeek/tabular'             " 代码格文本式化插件
Plugin 'plasticboy/vim-markdown'       " markdown
Plugin 'iamcco/markdown-preview.nvim'  " markdown
Plugin 'suan/vim-instant-markdown'     " mardown instance view 
Plugin 'nvie/vim-flake8'               " flake 8
" Plugin 'rakr/vim-one'                " atom colortheme now for vim
Plugin 'morhetz/gruvbox'               " the yellow theme
Plugin 'tpope/vim-commentary'          " 代码注释
Plugin 'taglist.vim'                   " vim taglist
Plugin 'Yggdroot/indentLine'           " 对齐竖线
Plugin 'chase/vim-ansible-yaml'        " ansible
" ====== rust
Plugin 'racer-rust/vim-racer'
Plugin 'rust-lang/rust.vim'            
Plugin 'mileszs/ack.vim'             " code auto save
" ============ google search =========
Plugin 'google/vim-searchindex'      " this is count search count

" =========== aysnc check code is right ===========
" Plugin 'dense-analysis/ale'

" =============== git ==============
Plugin 'mhinz/vim-signify'             " show git change
Plugin 'airblade/vim-gitgutter'

" ================= fzf ===============
Plugin 'junegunn/fzf.vim'

Plugin 'vim-scripts/indentpython.vim'


" ========= youcomplete me ========
Plugin 'VundleVim/YouCompleteMe'

Plugin 'ervandew/supertab'    " super table
Plugin 'marijnh/tern_for_vim' " javascript代码分析引擎


" =========== vim python ===========
" Plugin 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }


call vundle#end()            " required
filetype plugin indent on    " required

" --------------------------------------------- 
" set leader
let mapleader=","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" one 主题
" if (empty($TMUX))
"   if (has("nvim"))
"   let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"   endif
"   if (has("termguicolors"))
"     set termguicolors
"   endif
" endif
" syntax on                   " 开启语法高亮
" set background=dark
" colorscheme one
" let g:one_allow_italics = 1

syntax on                   " 开启语法高亮
colorscheme gruvbox

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
set relativenumber                         " 相对行号
set autoread

" --------------------------------- 缩进相关 --------------------------------
set autoindent                             " 自动缩进
set smartindent                            " 智能缩进
set softtabstop=4                          " 缩进长度
set shiftwidth=4                           " 缩进长度
set tabstop=4                              " tab键长度
set expandtab                              " 设置将tab转换为 4 个空格


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索和匹配
set showmatch 			" 高亮显示匹配的括号
set matchtime=1 		" 匹配括号高亮的时间（单位是十分之一秒）
set hlsearch 			" 高亮搜索
set incsearch 			" 边输入边查找
set ignorecase 			" 在搜索的时候忽略大小写
set cursorline          " 高亮当前行

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" key map

" ================= 拷贝相关
set clipboard=autoselect " 如果设置如下选项，那么可视模式下选择的文本就会被放到系统剪切板中
set clipboard=unnamed " can use system copy"

" =========== 删除并不剪切
nnoremap x "_x
nnoremap X "_X
nnoremap s "_s
nnoremap S "_S
nnoremap d "_d
nnoremap dd "_dd
nnoremap D "_D
vnoremap d "_d
vnoremap dd "_dd

nnoremap <leader>x ""x
nnoremap <leader>X ""X
nnoremap <leader>d ""d
nnoremap <leader>dd ""dd
nnoremap <leader>D ""D
vnoremap <leader>d ""d
vnoremap <leader>dd ""dd

inoremap <leader>c <C-x><C-o>

" =========== make vim faster
set timeoutlen=1000
set ttimeoutlen=0

" =========== Split fast
nnoremap <leader>\ :vs<space>
nnoremap <leader>- :sp<space>

" ====== 可以使用tab在小窗口列出所有符合条件的命令和文件 
set wildmenu
set wildmode=list:full
set wildignorecase

" ========== newtr ==========
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 2
let g:netrw_winsize = 25
nnoremap <F1> :Vexplore<CR>
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END
"
"
" vim table change
noremap <silent><tab>m :tabnew<cr>
noremap <silent><tab>e :tabclose<cr>
noremap <silent><tab>n :tabn<cr>
noremap <silent><tab>p :tabp<cr>
noremap <silent><leader>t :tabnew<cr>
noremap <silent><leader>g :tabclose<cr>
noremap <silent><leader>1 :tabn 1<cr>
noremap <silent><leader>2 :tabn 2<cr>
noremap <silent><leader>3 :tabn 3<cr>
noremap <silent><leader>4 :tabn 4<cr>
noremap <silent><leader>5 :tabn 5<cr>
noremap <silent><leader>6 :tabn 6<cr>
noremap <silent><leader>7 :tabn 7<cr>
noremap <silent><leader>8 :tabn 8<cr>
noremap <silent><leader>9 :tabn 9<cr>
noremap <silent><leader>0 :tabn 10<cr>
noremap <silent><s-tab> :tabnext<CR>
inoremap <silent><s-tab> <ESC>:tabnext<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 其他插件设置

" ========== theme ============
set bg=dark

" -------------- vim-airline theme ------------
" let g:airline_theme='one'
let g:airline_theme='gruvbox'

" -------------- ctrlp -------------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_map = '<F2>'
let g:ctrlp_working_path_mode = 'ca'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" -------------- ctrlp func -------------------
nnoremap <F4> :CtrlPFunky<Cr>

" -------------- vim-go ---------------
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_def_reuse_buffer = 1
let g:go_def_mapping_enabled = 1
" let g:go_def_mode='gopls'
" let g:go_info_mode='gopls'
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <c-j> :GoDef<CR>
au FileType go nmap <c-o> :GoDefPop<CR>
au FileType go nmap <c-i> :GoInfo<CR>



" ------------- markdown ---------------
set nofoldenable
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_no_extensions_in_markdown = 1
let g:mkdp_path_to_chrome = "/Applications/Safari.app/Contents/MacOS/Safari"
let g:mkdp_markdown_css=''

" -------------- ultisnips -----------------
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetsDir = "~/.vim/bundle/vim-snippets/UltiSnips"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]


" ================== comment some line =====================
" gcc     注释当前行（普通模式）
" gc      可视模式下，注释当前选中的部分
" gcu     撤销上一次注释的部分，可以是一行也可以是多行
" gcgc    撤销注释当前行和邻近的上下两行

" =============== ack
nmap <F3> :Ack -i<space>
let g:ackprg = 'ag --nogroup --nocolor --column'


" =============== fzf ==========
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
let g:Lf_ReverseOrder = 1


" =========== ag =======
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
nnoremap <silent> <Leader>A :Ag<CR>


" ======== python ========
" au BufNewFile,BufRead *.py
" \ set tabstop=4
" \ set softtabstop=4
" \ set shiftwidth=4
" \ set expandtab
" \ set autoindent
" \ set fileformat=unix


" au BufNewFile,BufRead *.js, *.html, *.css
" \ set tabstop=2
" \ set softtabstop=2
" \ set shiftwidth=2
"
" ============= ale ===============
let g:ale_python_pylint_executable = 'python3'
let g:ale_python_flake8_executable = 'python3'
let g:ale_python_prospector_executable = 'python3'
let g:ale_python_flake8_options = '-m flake8'
let g:ale_linters_explicit = 1
let g:ale_linters = {
  \   'csh': ['shell'],
  \   'zsh': ['shell'],
  \   'go': ['gofmt', 'golint'],
  \   'python': ['flake8', 'mypy', 'pylint'],
  \   'c': ['gcc', 'cppcheck'],
  \   'cpp': ['gcc', 'cppcheck'],
  \   'text': [],
  \}
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++11'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''


" ============= you complete me ===========
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py' 
let g:ycm_confirm_extra_conf = 0
let g:ycm_use_clangd = 0
" 在注释输入中也能补全
let g:ycm_complete_in_comments = 1
" 在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
" 注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1


" ============== super table ==========
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
