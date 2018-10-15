" 个人配置信息

" 基本配置
"set ic "查找时忽略大小写
set nonu "显示行号
set ruler "在右下角显示光标的坐标
set hlsearch "高亮显示搜索结果
set incsearch "边输边搜，即时更新搜索结果
set showcmd "在ruler左边显示当前正在输入的命令
set expandtab "将tab键改为空格
set tabstop=4 "将tab键改为n个空格
set cindent "使用C语言的规则自动缩进
set shiftwidth=4 "自动缩进时，使用4个空格，默认是8个
set nocompatible "取消vi兼容
set noshowmode "不显示左下角的状态行
"set laststatus=2 "在所有 window 中都顯示狀態列
"set tw=80 fo+=Mm "80字自动换行，或全选后按gq
set noswapfile "不要生成swap文件，当buffer被丢弃的时候隐藏它
set noeb vb t_vb= "不让vim发出滴滴声
set mouse=a "使用鼠标
set t_Co=256 "开启256色支持
:colo peachpuff "vim配色方案
" 打开语法高亮
syntax enable
syntax on
"文件编码
set fileencodings=utf-8,gbk,gb2312,gb18030
set enc=utf8
set fencs=utf8,gbk,gb2312,gb18030
"打开对文件类型插件的支持
filetype indent on
filetype plugin on
filetype plugin indent on

"上一个/下一个标签页切换的快捷键
nmap <F11> <ESC>:tabprevious<RETURN>
nmap <F12> <ESC>:tabnext<RETURN>

"PATHOGEN 插件管理插件加载选项
call pathogen#runtime_append_all_bundles()

"NERDTREE 插件配置
let NERDTreeWinSize=24
let NERDTreeShowBookmarks=0
let NERDTreeChDirMode=2
nmap <F2> <ESC>:NERDTreeToggle<RETURN>

"taglist 配置信息
nmap <F1> <ESC>:TlistToggle<RETURN>
set tags=tags
set autochdir
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1

"php定制内容
"autocmd FileType php noremap <C-L> :!php -l %<CR>

"php doc注释插件
"nnoremap <C-K> :call PhpDocSingle()<CR>
"vnoremap <C-K> :call PhpDocRange()<CR>
"let g:pdv_cfg_Author = 'popfeng <xuewu.sun@juzigo.com> ' . strftime("%F")

"powerline
set rtp+=~/Library/Python/3.7/lib/python/site-packages/powerline/bindings/vim
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
