"个人配置信息(popfeng@yeah.net)

"基本配置
"set ic "查找时忽略大小写
set nonu "显示行号
set ruler "在右下角显示光标的坐标
set hlsearch "高亮显示搜索结果
set incsearch "边输边搜，即时更新搜索结果
set showcmd "在ruler左边显示当前正在输入的命令
set expandtab "将tab键改为空格
set tabstop=2 "将tab键改为2个空格
set cindent "使用C语言的规则自动缩进
set shiftwidth=4 "自动缩进时，使用4个空格，默认是8个
set backspace=indent,eol,start "激活退格删除
set mouse=a "使用鼠标
"set tw=80 fo+=Mm "80字自动换行，或全选后按gq
"不要生成swap文件，当buffer被丢弃的时候隐藏它
set bufhidden=hide
setlocal noswapfile
"不让vim发出讨厌的滴滴声
set noerrorbells
"文件编码
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set enc=utf8
set fencs=utf8,gbk,gb2312,gb18030

"vim配色方案
:colo peachpuff

"上一个/下一个标签页切换的快捷键
nmap <F11> <ESC>:tabprevious<RETURN>
nmap <F12> <ESC>:tabnext<RETURN>
"代码缩进
map <F4> za
" 打开语法高亮
syntax enable
syntax on
" 打开对文件类型插件的支持
filetype indent on
filetype plugin on
filetype plugin indent on

"PATHOGEN 插件管理插件加载选项
call pathogen#runtime_append_all_bundles()

"NERDTREE插件配置
let NERDTreeWinSize=24
let NERDTreeShowBookmarks=0
let NERDTreeChDirMode=2
nmap <F2> <ESC>:NERDTreeToggle<RETURN>

" taglist配置信息
nmap <F1> <ESC>:TlistToggle<RETURN>
set tags=tags
set autochdir
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1

" ######### VimWiki 写作助手 ######### "
" 使用鼠标映射
let g:vimwiki_use_mouse = 1
" 不要将驼峰式词组作为 Wiki 词条
let g:vimwiki_camel_case = 0
" 标记为完成的 checklist 项目会有特别的颜色
let g:vimwiki_hl_cb_checked = 1
" 是否在计算字串长度时用特别考虑中文字符
let g:vimwiki_CJK_length = 1
" 多个维基项目的配置
let g:vimwiki_list = [{'path': '~/.vim/vimwiki/', 
                     \ 'path_html': '~/.vim/vimwiki_html/', 
                     \ 'auto_export': 0}]

"php定制内容
autocmd FileType php noremap <C-L> :!php -l %<CR>

"php doc注释插件
nnoremap <C-K> :call PhpDocSingle()<CR>
vnoremap <C-K> :call PhpDocRange()<CR>
let g:pdv_cfg_Author = 'popfeng <popfeng@yeah.net> ' . strftime("%F")

"vim session插件配置
let g:session_autoload = 'no'
let g:session_autosave = 'yes'
let g:session_command_aliases = 1
