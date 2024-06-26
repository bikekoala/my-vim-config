" 基本配置
"""""""""""""
"set ic " 查找时忽略大小写
"set clipboard=unnamed " 拷贝字符到系统剪切板
set nonu " 显示行号
set ruler " 在右下角显示光标的坐标
set hlsearch " 高亮显示搜索结果
set incsearch " 边输边搜，即时更新搜索结果
set showcmd " 在ruler左边显示当前正在输入的命令
set expandtab " 将tab键改为空格
set tabstop=2 " 将tab键改为n个空格
set shiftwidth=2 " 默认首行缩进
set backspace=indent,eol,start " 激活退格删除
set nocompatible " 取消vi兼容
set noshowmode " 不显示左下角的状态行
set laststatus=2 " 在所有 window 中都顯示狀態列
"set tw=80 fo+=Mm " 80字自动换行，或全选后按gq
set noswapfile " 不要生成swap文件，当buffer被丢弃的时候隐藏它
set autoread " 打开文件监视
set noeb vb t_vb= " 不让vim发出滴滴声
set visualbell " 出错时，发出视觉提示，通常是屏幕闪烁
set mouse=a " 使用鼠标
set t_Co=256 " 开启256色支持
syntax enable " 打开语法高亮
set listchars=tab:»■,trail:■ "如果行尾有多余的空格（包括 Tab 键），该配置将让这些空格显示成可见的小方块
set nolist " 隐藏行尾的$
" 命令模式下，底部操作指令按下 Tab 键自动补全
set wildmenu
set wildmode=longest:list,full
" 文件编码
set enc=utf8
set fencs=utf8
set encoding=utf-8
set fileencodings=utf-8
scriptencoding utf-8
" 打开对文件类型插件的支持
filetype off
filetype indent on
filetype plugin on
filetype plugin indent on
" 首行缩进
autocmd BufRead,BufNewFile *.ts set filetype=javascript
autocmd FileType vue syntax sync fromstart
autocmd FileType python set shiftwidth=4 | set tabstop=4
let g:pyindent_open_paren = 4
" 美化界面
:colo classic
set fillchars+=vert:\ " 设置纵向分割线填充字符
" 上一个/下一个标签页切换的快捷键
nmap <F11> <ESC>:tabprevious<RETURN>
nmap <F12> <ESC>:tabnext<RETURN>

" OSC52 copy text
"""""""""""""""""""
autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '' | execute 'OSCYankReg "' | endif

" Plug
"""""""""""""
call plug#begin()
" basic
Plug 'mhinz/vim-signify'
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'ojroques/vim-oscyank'
Plug 'ludovicchabant/vim-gutentags'
" nerdtree
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
" javascript
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
" php
Plug 'mikehaertl/pdv-standalone'
" c
Plug 'skywind3000/asyncrun.vim'
" completion & linting (:CocInstall coc-phpls coc-json coc-tsserver coc-clangd coc-pyright coc-prettier)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" NERDTREE
"""""""""""""
let NERDTreeStatusline = "V    %{strftime('%a %b %d %H:%M:%S')}"
let NERDTreeWinPos='right'
let NERDTreeWinSize=25
let NERDTreeShowBookmarks=0
let NERDTreeChDirMode=2
let NERDTreeMinimalUI=2
let NERDTreeDirArrowExpandable="\u00a0"
let NERDTreeDirArrowCollapsible="\u00a0"
let WebDevIconsNerdTreeBeforeGlyphPadding=''
let WebDevIconsUnicodeDecorateFolderNodes=v:true
let nerdtree_tabs_synchronize_view=0
highlight! link NERDTreeFlags NERDTreeDir
nmap <F2> <ESC>:NERDTreeToggle<RETURN>

" Tagbar
"""""""""""""
" Ctrl+] 跳转
" Ctrl+o 返回
set tags=.tags
nmap <F1> :TagbarToggle<CR>

" CtrlP
"""""""""""""
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_max_height = 15
let g:ctrlp_line_prefix = '♪ '

" Powerline
"""""""""""""
set rtp+=~/.vim/powerline
"let s:uname = system("uname -s")
"if s:uname == "Darwin\n"
"    set rtp+=~/Library/Python/3.8/lib/python/site-packages/powerline/bindings/vim
"else
"    set rtp+=/usr/local/lib/python3.9/site-packages/powerline/bindings/vim
"endif

" Gutentags
"""""""""""""
let g:gutentags_ctags_exclude = [
      \ '.git', 'tags*', 'node_modules', 'build', 'dist', 'docs', 'example', 'bundle', 'vendor',
      \ '*.vue', '*.md', '*-lock.json', '*.css', '*.less', '*.scss',
      \ '*.mp3', '*.ogg', '*.flac', '*.wav',
      \ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
      \ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
      \ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2'
      \ ]
let g:gutentags_ctags_tagfile = '.tags'
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" coc-nvim
"""""""""""""
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use Shift + K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Range format
vmap = <Plug>(coc-format-selected)
nmap = <Plug>(coc-format-selected)

" PHP Doc
"""""""""""""
"nnoremap <C-K> :call PhpDocSingle()<CR>
"vnoremap <C-K> :call PhpDocRange()<CR>
"let g:pdv_cfg_Author = 'evansun <sunxuewu@moxiu.net> ' . strftime("%F")

" C 语言自动编译执行
"""""""""""""""""""""
let g:asyncrun_open = 10
let g:asyncrun_bell = 1
noremap <F10> :AsyncRun mkdir -p build && gcc -fsanitize=address -fno-omit-frame-pointer -g % -o build/%< && ./build/%<<cr>
"noremap <F10> :AsyncRun mkdir -p build && gcc -g % -o build/%< && ./build/%<<cr>
