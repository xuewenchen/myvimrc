set rtp+=/usr/local/opt/fzf

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'Blackrush/vim-gocode'
" Plug 'fatih/vim-go'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-expand-region'    " 快速选择文本
Plug 'terryma/vim-smooth-scroll'    " 平滑滚动
Plug 'terryma/vim-multiple-cursors' " 多行选择
Plug 'morhetz/gruvbox' " 土色配色
Plug 'owickstrom/vim-colors-paramount' " 黑色配色
Plug 'tomasiser/vim-code-dark' " vscode theme
Plug 'rakr/vim-one'
Plug 'tpope/vim-commentary'
Plug 'Yggdroot/indentLine' " 竖线注释
Plug 'bling/vim-bufferline'
Plug 'majutsushi/tagbar'

" must brew install the_silver_searcher
Plug 'ctrlpvim/ctrlp.vim'             " 模糊目录搜索文件
Plug 'FelikZ/ctrlp-py-matcher'          " 模糊搜索高速
Plug 'rking/ag.vim'                     " 模糊搜索高速
Plug 'mileszs/ack.vim'
Plug 'google/vim-searchindex'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tracyone/fzf-funky',{'on': 'FzfFunky'}

" float window
Plug 'voldikss/vim-floaterm'

" nerdtree
Plug 'preservim/nerdtree'

" startify show history editor file
Plug 'mhinz/vim-startify'

" git
Plug 'tpope/vim-fugitive'

" coco.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" clang format
Plug 'rhysd/vim-clang-format', {'for' : ['c', 'cpp']}

" icon
Plug 'ryanoasis/vim-devicons'

" buffer only :BufOnly
Plug 'vim-scripts/BufOnly.vim'

call plug#end()

" ---------------------------------- theme ------------------------------
colorscheme gruvbox
" colorscheme delek
" colorscheme paramount
" colorscheme codedark
set background=dark
set t_Co=256
set t_ut=
" colorscheme one
" syntax enable
" if (empty($TMUX))
"   if (has("nvim"))
"     let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"   endif
"   if (has("termguicolors"))
"     set termguicolors
"   endif
" endif
" let g:one_allow_italics = 1

" ---------------------------------- set leader ------------------------
let mapleader=","

" ---------------------------------- 基础设定 ----------------------------
syntax on
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
set mouse=v                                " 允许鼠标
set relativenumber                         " 相对行号
set autoread
set title

" --------------------------------- 缩进相关 --------------------------------
set autoindent                             " 自动缩进
set smartindent                            " 智能缩进
set softtabstop=4                          " 缩进长度
set shiftwidth=4                           " 缩进长度
set tabstop=4                              " tab键长度
set expandtab                              " 设置将tab转换为4个空格

" --------------------------------- 搜索和匹配 ------------------------------
set showmatch 			" 高亮显示匹配的括号
set matchtime=1 		" 匹配括号高亮的时间（单位是十分之一秒）
set hlsearch 			" 高亮搜索
set incsearch 			" 边输入边查找
set ignorecase 			" 在搜索的时候忽略大小写

" =========== make vim faster
set timeoutlen=1000
set ttimeoutlen=0

" =========== Split fast
nnoremap <leader>\ :vs<space>
nnoremap <leader>- :sp<space>

" =========== ag config
" let g:ag_working_path_mode="r"
let g:ackprg = 'ag --nogroup --nocolor --column'

nnoremap <F3> :Ag -i

" ============= fzf config
nnoremap <silent> <Leader>ff :Files<CR>
nnoremap <silent> <Leader>bb :Buffers<CR>

" ============== fzf-function config
nnoremap <Leader>fu :FzfFunky<Cr>
nnoremap <Leader>fU :execute 'FzfFunky ' . expand('<cword>')<Cr>
nnoremap <Leader>Ag :Ag
nnoremap <Leader>Rg :Rg<Cr>

" =============== floaterm mapping config
let g:floaterm_keymap_toggle = '<F10>'

" =============== nerdtree config
map <F1> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" =============== Tagbar config
 map <F2> :Tagbar<CR>

" =============== close match paire highlight
function! g:FuckThatMatchParen ()
    if exists(":NoMatchParen")
        :NoMatchParen
    endif
endfunction
augroup plugin_initialize
    autocmd!
    autocmd VimEnter * call FuckThatMatchParen()
augroup END

" =============== 平滑滚动
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" 缩进
xnoremap < <gv
xnoremap > >gv

" ==================== clang format
let g:clang_format#auto_format=0

" =================== coco.nvim
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
" Note coc#float#scroll works on neovim >= 0.5.0 or vim >= 8.2.0750
nnoremap <expr><C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <expr><C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <expr><C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<Right>"
inoremap <expr><C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<Left>"

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" some setting add to coc.nvim
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
autocmd FileType go nmap gtj :CocCommand go.tags.add json<cr>
