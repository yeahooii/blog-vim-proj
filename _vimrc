""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 作者:     凝霜
" E-mail:   mdl2009 # vip.qq.com
" GitHub:   https://github.com/NsLib
" Blog:     http://blog.csdn.net/MDL13412
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"===============================================================================
" Vim Settings
"===============================================================================

"{{{ start pathogen
execute pathogen#infect()
"}}}

"{{{ 基本设置
set nocompatible                    " 不兼容老得VI，除非有特殊的理由
"}}}

"{{{语法检测设定
filetype    on                      " 检测打开文件的类型
syntax      on                      " 开启语法高亮
syntax      enable                  " 激活语法高亮
filetype    plugin on               " 允许特定的文件类型载入插件文件
filetype    indent on               " 允许特定的文件类型载入缩进文件
"}}}

"{{{ 编码及存储
"显示中文帮助
if version >= 603
    set helplang=cn
endif
set fileencodings=ucs-bom,utf-8,shift-jis,gb18030,gbk,gb2312,cp936,chinese " 文件编码自动识别顺序
"新建文件优先选用编码
if has("windows")
	set fileencoding=chinese
else
	set fileencoding=utf-8
endif
set encoding=utf-8                  " vim内部编码
set nobomb                          " 不使用bom编码
set nobackup                        " 不使用备份文件
set noswapfile                      " 不产生交换文件
set autoread                        " 自动同步外部修改
set autowrite                       " 自动把内容写回文件
"}}}

"{{{ 缩进/换行/空白/行号/折叠/滚动
" 缩进
set autoindent                      " 开启新行时，自动缩进
set smartindent                     " 开启新行时，智能缩进
set cindent                         " C程序自动缩进

" 换行
set wrap                            " (当一行长度超过屏幕宽度后)自动换行显示
set linebreak                       " 不在单词中间断行
set fo+=mB                          " 打开断行模块对亚洲语言支持
set whichwrap+=<,>,h,l              " 命令模式下可以直接移动到下一行或上一行
set iskeyword+=$,%                  " 带有如下符号的单词不要被换行分割
set textwidth=0                     " 关闭代码自动折行，插入模式下，默认每80个字开启新行。

" 空白
set shiftwidth=4                    " 缩进空白数
set tabstop=4                       " Tab所占空格数
set noexpandtab                     " 默认不要将Tab展开为空格
"autocmd FileType make set noexpandtab " Makefile中需要使用Tab
"autocmd FileType h set noexpandtab  " h file中需要使用Tab
"autocmd FileType c set noexpandtab  " c file中需要使用Tab
"autocmd FileType cpp set noexpandtab " cpp file中需要使用Tab
autocmd FileType java set expandtab " 在java file中需要使用空格
autocmd FileType lua set expandtab " 在java file中需要使用空格
set softtabstop=4                   " 配合tabstop
set listchars=tab:▸\ ,trail:▫       " 指定Tab和结尾空白字符
set backspace=eol,start,indent      " 插入模式下使用 <BS>、<Del> <C-W> <C-U>
set smarttab                        " 在行和段开始处使用制表符

" 行号
set number                          " 显示行号

" 代码折叠
set nofoldenable                    " 关闭Vim不启动时打开代码折叠功能
set foldmethod=syntax               " 根据语法折叠代码

" Vim折叠
autocmd FileType vim    setlocal foldmethod=marker
autocmd FileType vim    setlocal foldmarker={{{,}}}
" 用空格键开关折叠
nnoremap <silent> <space> @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR>
"}}}

"{{{ 状态栏/标尺
set ruler                           " 显示光标所在位置
set cursorline                      " 高亮当前行
set showcmd                         " 再屏幕最后一行显示命令
set laststatus=2                    " 始终显示状态栏
set cmdheight=1                     " 命令行使用的屏幕行数
"}}}

"{{{ 搜索和匹配
set showmatch                       " 高亮显示匹配的括号
set matchtime=5                     " 匹配括号高亮的时间(单位是十分之一秒)
set ignorecase                      " 搜索时忽略大小写
set smartcase                       " 如果搜索模式包含大写字符，不使用'ignorecase'选项
set hlsearch                        " 高亮被搜索的内容
set incsearch                       " 增量搜索
"}}}

"{{{ 主题设置
set t_Co=256                        " 开启256色支持
"set background=dark
colorscheme desertEx_256
"colorscheme solarized
"colorscheme molokai
"colorscheme phd
"}}}

"{{{ 杂项
set shortmess=atI                   " 启动的时候不显示那个援助乌干达儿童的提示
set history=1000                    " 历史记录数
set viminfo+=!                      " 保存全局变量
set report=0                        " 通过使用: commands命令，告诉我们文件的哪一行被改变过
set noerrorbells                    " 错误时不发出声响
set novisualbell                    " 禁用可视响铃
set t_vb=                           " 可视响铃
if has("gui_running") && has("unix")" 终端鼠标支持
    set mouse=a                     " "a" for GUI, MS-DOS and Win32
else
    set mouse=v
endif
set clipboard+=unnamed              " 共享剪贴板
"set selection=exclusive            " use default value(inclusive)
set selectmode=mouse,key
set wildmenu                        " 命令行补全以增强模式运行
set splitright                      " 竖直新分割的窗口在右侧
set splitbelow                      " 水平新分割的窗口在下面
" 打开上次编辑位置
autocmd BufReadPost * if line("'\"") > 1 
    \ && line("'\"") <= line("$") 
    \ | exe "normal! g'\"" | endif
"}}}

"===============================================================================
" Key Binding
"===============================================================================

" {{{映射快捷键
let mapleader=";"                               " 定义快捷键的前缀,即<Leader>
" vim 开发
nnoremap    <leader>sv          :source $MYVIMRC<cr>        " 刷新vim配置
nnoremap    <leader>ev          :vsplit $MYVIMRC<cr>        " 分割窗口打开vim配置

" 编辑相关
inoremap    kj        <esc>     " 编辑模式下按jk等价于按ESC键, 非常高效

" 复制
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY

:set pastetoggle=<F11>          " 粘贴情况下的自动对齐开关
map <F12> gg=G                  " 全文对齐
vnoremap <Leader>y "+y          " 将选中文本块复制至系统剪贴板
vmap <Leader>y "+y              " 选中状态下 Ctrl+c 复制
nmap <Leader>p "+p              " 将系统剪贴板内容粘贴至 vim

nnoremap <F2> :g/^\s*$/d<CR>    " 去空行

nnoremap <C-F2> :vert diffsplit " 比较文件
"map <M-F2> :tabnew<CR>         " 新建标签
"map <F3> :tabnew .<CR>         " 列出当前目录文件
"map <C-F3> \be                 " 打开树状文件目录
"
" 非插入模式下按Ctrl加上jklh在窗口间移动
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" 插入模式下按Ctrl加上jklh移动光标
inoremap <c-h> <left>
inoremap <c-l> <right>
inoremap <c-j> <c-o>gj
inoremap <c-k> <c-o>gk

" 绑定快捷键，默认是 <Leader>t
nnoremap    <leader>td          :TaskList<CR>

"保存和退出
nmap <Leader>q :q<CR>           " 关闭当前分割窗口
nmap <Leader>w :w<CR>           " 保存当前窗口内容
nmap <Leader>WQ :wa<CR>:q<CR>   " 保存所有窗口内容并退出 vim
nmap <Leader>Q :qa!<CR>         " 不做任何保存,直接退出 vim
"}}}

"===============================================================================
" Plugins
"===============================================================================
"{{{ tasklist.vim  任务列表插件
let g:tlTokenList = ["FIXME", "TODO", "HACK", "NOTE", "WARN", "MODIFY"]
"}}}

"{{{ vim-bookmarks
let g:bookmark_highlight_lines  = 1 " 高亮显示书签行
"}}}

"{{{ vim-powerline
let g:Powerline_colorscheme='solarized256' " 设置状态栏主题风格
"}}}

"{{{ UltiSnips.vim
autocmd FileType * call UltiSnips#FileTypeChanged()
let g:UltiSnipsExpandTrigger="ii"	" 连续按下两次i触发代码补全
"}}}

"{{{ tagbar
let tagbar_left=1                   " 设置 tagbar 子窗口的位置出现在主编辑区的左边
nnoremap <leader>tb :TagbarToggle<CR> " 设置显示/隐藏标签列表子窗口的快捷键。
let tagbar_width=32                 " 设置标签子窗口的宽度
let g:tagbar_compact=1              " tagbar 子窗口中不显示冗余帮助信息
"}}}

"===============================================================================
" Source User's Own Setting
"===============================================================================

"{{{ source
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
"}}}
