execute pathogen#infect()
filetype plugin indent on
" 开行号模式
set number
syntax on
" 设置粘贴模式，以免拷贝代码时出现格式混乱
set paste

set ts=4
set shiftwidth=4
set expandtab
" 高亮搜索结果
set hlsearch
" 在输入搜索内容时自动匹配
set incsearch

" 设置折叠模式
set foldmethod=indent

" 设置私有指令前缀
let mapleader=","
let maplocalleader=","

    " 关联NERDTree 快捷键
    map <Leader>, :NERDTreeToggle<cr>
    " 保存退出快捷键
    map <Leader>w :wq<cr>
    " 直接退出
    map <Leader>q :q<cr>
    " 以root身份保存当前修改
    map <Leader>W :w !sudo tee %<cr>
    " 打开TagBar窗口
    nmap <Leader>. :TagbarToggle<cr>
    " 搜索当前单词(高亮状态下效果最佳)
    map <Leader>/ /<C-r><C-w><cr>
    " 随时编辑vimrc
    map <Leader>ee :e ~/.vimrc<cr>
    autocmd! bufwritepost .vimrc source ~/.vimrc

" 在窗口中快速跳转
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" 调整窗口大小
map <C-y> <C-W><
map <C-u> <C-W>+
map <C-i> <C-W>-
map <C-o> <C-W>>

map <space> za

" NERDTree 相关
" 忽略以下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']


" autocmd vimenter * NERDTree
autocmd BufNewFile *.py,*.sh,*.java exec ":call SetTitle()"
func SetTitle()
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
        call append(line(".")+0, "\###############################################")
        call append(line(".")+1, "\# File Name : ".expand("%"))
        call append(line(".")+2, "\#    Author : rootkiter")
        call append(line(".")+3, "\#    E-mail : rootkiter@rootkiter.com")
        call append(line(".")+4, "\#   Created : ".strftime("%c"))
        call append(line(".")+5, "\###############################################")
        call append(line(".")+6, "")
    elseif &filetype == 'python'
        call setline(1, "\#!/bin/python")
        call append(line(".")+0, "\###############################################")
        call append(line(".")+1, "\# File Name : ".expand("%"))
        call append(line(".")+2, "\#    Author : rootkiter")
        call append(line(".")+3, "\#    E-mail : rootkiter@rootkiter.com")
        call append(line(".")+4, "\#   Created : ".strftime("%c"))
        call append(line(".")+5, "\###############################################")
        call append(line(".")+6, "")
    else
        call setline(1,"/**")
        call append(line("."), "* File Name :".expand("%"))
        call append(line(".")+1, "* Author: rootkiter")
        call append(line(".")+2, "* E-mail: rootkiter@rootkiter.com")
        call append(line(".")+3, "* Created Time : ".strftime("%c"))
        call append(line(".")+4, "*/")
    endif
    normal G
endfunc

"powerline{
set guifont=PowerlineSymbols\ for\ Powerline
set nocompatible
set t_Co=256
let g:Powerline_symbols = 'unicode'
set laststatus=2
"}

