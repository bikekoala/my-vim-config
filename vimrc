" 个人配置信息

" 基本配置
"set ic " 查找时忽略大小写
set clipboard=unnamed " 拷贝字符到系统剪切板
set nonu " 显示行号
set ruler " 在右下角显示光标的坐标
set hlsearch " 高亮显示搜索结果
set incsearch " 边输边搜，即时更新搜索结果
set showcmd " 在ruler左边显示当前正在输入的命令
set expandtab " 将tab键改为空格
set tabstop=2 " 将tab键改为n个空格
set cindent " 使用C语言的规则自动缩进
set backspace=indent,eol,start " 激活退格删除
set nocompatible " 取消vi兼容
set noshowmode " 不显示左下角的状态行
"set laststatus=2 " 在所有 window 中都顯示狀態列
"set tw=80 fo+=Mm " 80字自动换行，或全选后按gq
set noswapfile " 不要生成swap文件，当buffer被丢弃的时候隐藏它
set autoread " 打开文件监视
set noeb vb t_vb= " 不让vim发出滴滴声
set visualbell " 出错时，发出视觉提示，通常是屏幕闪烁
set mouse=a " 使用鼠标
set t_Co=256 " 开启256色支持
:colo peachpuff " vim配色方案
syntax enable " 打开语法高亮
" 如果行尾有多余的空格（包括 Tab 键），该配置将让这些空格显示成可见的小方块
set listchars=tab:»■,trail:■
set list
" 命令模式下，底部操作指令按下 Tab 键自动补全
set wildmenu
set wildmode=longest:list,full
" 文件编码
set enc=utf8
set fencs=utf8
set encoding=utf-8
set fileencodings=utf-8
" 打开对文件类型插件的支持
filetype off
filetype indent on
filetype plugin on
filetype plugin indent on
" 首行缩进
au BufRead,BufNewFile *.ts set filetype=javascript
autocmd FileType vue syntax sync fromstart
autocmd FileType vue set sw=2
autocmd FileType javascript set sw=2
autocmd FileType json set sw=2
autocmd FileType html set sw=2
autocmd FileType php set sw=4

" 上一个/下一个标签页切换的快捷键
nmap <F11> <ESC>:tabprevious<RETURN>
nmap <F12> <ESC>:tabnext<RETURN>

" Plug
call plug#begin()
" basic
Plug 'mhinz/vim-signify'
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'
" nerdtree
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
" completion & linting (:CocInstall coc-phpls)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'w0rp/ale'
" javascript
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
" php
Plug 'mikehaertl/pdv-standalone'
call plug#end()

" NERDTREE
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
set tags=.tags
nmap <F1> :TagbarToggle<CR>
nnoremap <silent> <Leader>b :TagbarToggle<CR>

" CtrlP
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_max_height = 15
let g:ctrlp_line_prefix = '♪ '
nnoremap <leader>. :CtrlPTag<cr>

" phpdoc
nnoremap <C-K> :call PhpDocSingle()<CR>
vnoremap <C-K> :call PhpDocRange()<CR>
let g:pdv_cfg_Author = 'evansun <sunxuewu@moxiu.net> ' . strftime("%F")

" Powerline
set rtp+=~/Library/Python/3.7/lib/python/site-packages/powerline/bindings/vim

" Gutentags
" Gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.git', '.vue']
" 所生成的数据文件的名称 "
let g:gutentags_ctags_tagfile = '.tags'
" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
