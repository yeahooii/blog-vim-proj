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
set nocompatible        " 不兼容老得VI，除非有特殊的理由
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
set fileencodings=ucs-bom,utf-8,shift-jis,gb18030,gbk,gb2312,cp936 " 文件编码自动识别顺序
"set fileencodings=utf-8             " 文件编码，强制UTF-8
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
set iskeyword+=_,$,@,%,#,-          " 带有如下符号的单词不要被换行分割
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
set softtabstop=4                   " 配合tabstop
set listchars=tab:▸\ ,trail:▫       " 指定Tab和结尾空白字符
set backspace=eol,start,indent      " 插入模式下使用 <BS>、<Del> <C-W> <C-U>
set smarttab                        " 在行和段开始处使用制表符

" 行号
set number                          " 显示行号

" 代码折叠
set foldenable                      " 开启代码折叠
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
"}}}

"{{{ 杂项
set noerrorbells                    " 错误时不发出声响
set novisualbell                    " 禁用可视响铃
set t_vb=                           " 可视响铃
set mouse=a                         " 所有模式下，开启鼠标支持
set wildmenu                        " 命令行补全以增强模式运行
set splitright                      " 竖直新分割的窗口在右侧
set splitbelow                      " 水平新分割的窗口在下面
" 打开上次编辑位置
autocmd BufReadPost * if line("'\"") > 1 
    \ && line("'\"") <= line("$") 
    \ | exe "normal! g'\"" | endif
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

"{{{ UltiSnips.vim
autocmd FileType * call UltiSnips#FileTypeChanged()
let g:UltiSnipsExpandTrigger="ii"	" 连续按下两次i触发代码补全
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
inoremap    jk                  <esc>           " 编辑模式下按jk等价于按ESC键, 非常高效
nnoremap    Q                   :q<CR>          " 命令模式下，输入Q，退出Vim
nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>

" 窗口间移动
nnoremap    <C-j>               <C-W>j
nnoremap    <C-k>               <C-W>k
nnoremap    <C-h>               <C-W>h
nnoremap    <C-l>               <C-W>l

" 插入模式下移动光标
inoremap    <C-y>               <Up>            " 输入模式下，按Ctrl+y移动光标到上一行
inoremap    <C-e>               <Down>          " 输入模式下，按Ctrl+e移动光标到下一行
inoremap    <c-h>               <left>
inoremap    <c-l>               <right>
inoremap    <c-j>               <c-o>gj
inoremap    <c-k>               <c-o>gk

" 绑定快捷键，默认是 <Leader>t
nnoremap    <leader>td          :TaskList<CR>

"===============================================================================
" Source User's Own Setting
"===============================================================================

"{{{ source
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
"}}}
