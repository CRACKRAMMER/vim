set number "设置行号
set ruler "设置游标
set wrap "设置折行
set linebreak "按单词进行折行
set showmode "设置显示当前处于的模式
set showcmd "设置显示当前使用的命令
set clipboard=unnamed "用系统粘贴板替换vim暂存器
set cursorline "光标所在行添加下划线
set scrolloff=5 "滚动时预留5行
set noswapfile "不会产生swap临时文件
set fileencodings=utf-8

" search
set hlsearch "高亮搜索结果
set ignorecase "搜索时不区分大小写
set incsearch "搜索时实时匹配
set smartcase "搜索单词时如果单词有大写字母时暂时忽略ignorecase

" tab and space
set softtabstop=4 "tab键以4个空白符显示
set shiftwidth=4 "快速排版时以4个空白符显示
set expandtab "可以使用retab命令将tab转换成空格

" tabe
set showtabline=2 "永远显示tab标签
set splitbelow "水平分割时新文档在下
set splitright "垂直分割时新文档在右

" color
syntax on
" try
"     colorscheme darkblue
" catch
"     colorscheme default
" endtry

" filetype
filetype on "匹配文件类型
filetype indent on "使用文件类型的缩进
filetype plugin on "使用插件

" keymap
map <UP> <Nop>
map <LEFT> <Nop>
map <RIGHT> <Nop>
map <DOWN> <Nop>

" autocmd
autocmd WinEnter * setlocal cursorline "进入窗口，添加下划线
autocmd WinLeave * setlocal nocursorline "离开窗口，取消下划线
autocmd BufWritePre * :%s/\s\+$//e "清除行尾空白字符

" <F5> 编译和运行C
autocmd BufRead,BufNewFile *.c noremap <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
exec "w"
silent! exec "!gcc % -o %<"
exec "! ./%<"
endfunc

"< F5> 编译和运行C++
autocmd BufRead,BufNewFile *.cpp noremap <F5> :call CompileRunGpp()<CR>
func! CompileRunGpp()
exec "w"
silent! exec "!g++ % -o %<\n"
exec "! ./%<"
endfunc

" <F5> 运行python程序
autocmd BufRead,BufNewFile *.py noremap <F5> :w<cr>:!python %<cr>

" <F5> 运行shell程序
autocmd BufRead,BufNewFile *.sh noremap <F5> :call CompileRunSH()<CR>
func! CompileRunSH()
exec "w"
silent! exec "!chmod a+x %"
exec "!./%"
endfunc

"<F9>  gdb调试
autocmd BufRead,BufNewFile *.c noremap <F9> :call Debug()<CR>
autocmd BufRead,BufNewFile *.cpp noremap <F9> :call Debug()<CR>
func!  Debug()
exec "w"
silent! exec "!gcc % -o %< -gstabs+"
exec "!gdb %<"
endfunc

autocmd BufRead,BufNewFile *.js noremap <F5> :w !ls&&node<Enter>
if executable("go")
    autocmd BufRead,BufNewFile *.go noremap <F5> :% w !go run<Enter>
    "读取或创建.go文件时，将f5映射为执行go run 命令
else
    autocmd BufRead,BufNewFile *.go noremap <F5> :echo "you need to install go first!"
endif

call plug#begin('~/.vim/plugged')
Plug 'ap/vim-css-color'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rails'
Plug 'tomtom/tcomment_vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'vim-syntastic/syntastic'
Plug 'ycm-core/YouCompleteMe'
call plug#end()
