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
autocmd BufNewFile *.py,*.[ch],*.cpp,*.sh,*.java,*.go exec ":call SetTitle()"
func SetTitle()
    let AUTHOR="rootkiter"
    let EMAIL ="rootkiter@rootkiter.com"
    let TIMENOW=strftime("%Y-%m-%d %T %Z")
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
        call append(line(".")+ 0, "\###############################################")
        call append(line(".")+ 1, "\# File Name : ".expand("%"))
        call append(line(".")+ 2, "\#    Author : ".AUTHOR)
        call append(line(".")+ 3, "\#    E-mail : ".EMAIL)
        call append(line(".")+ 4, "\#   Created : ".TIMENOW)
        call append(line(".")+ 5, "\###############################################")
        call append(line(".")+ 6, "")
        call append(line(".")+ 7, "echo \$#")
    elseif &filetype == 'python'
        call setline(1, "\#!/bin/python")
        call append(line(".")+ 0, "\###############################################")
        call append(line(".")+ 1, "\# File Name : ".expand("%"))
        call append(line(".")+ 2, "\#    Author : ".AUTHOR)
        call append(line(".")+ 3, "\#    E-mail : ".EMAIL)
        call append(line(".")+ 4, "\#   Created : ".TIMENOW)
        call append(line(".")+ 5, "\###############################################")
        call append(line(".")+ 6, "")
        call append(line(".")+ 7 , "import sys")
        call append(line(".")+ 8 , "if __name__=='__main__':")
        call append(line(".")+ 9 , "    print \"Hello World ! \"")
        call append(line(".")+10, "    print sys.argv")
    elseif &filetype == 'c'
        call setline(1          , "\/** ***********************************************")
        call append(line(".")   , " * File Name : ".expand("%"))
        call append(line(".")+ 1, " * Author    : ".AUTHOR)
        call append(line(".")+ 2, " * E-mail    : ".EMAIL)
        call append(line(".")+ 3, " * Created   : ".TIMENOW)
        call append(line(".")+ 4, "************************************************* */")
        call append(line(".")+ 5, "")
        call append(line(".")+ 6, "#include <stdio.h>")
        call append(line(".")+ 7, "int main(){")
        call append(line(".")+ 8, "    printf(\"Hello World\\n\");")
        call append(line(".")+ 9, "    return 1;")
        call append(line(".")+10, "}")
    elseif &filetype == 'go'
        call setline(1          , "\/** ***********************************************")
        call append(line(".")   , " * File Name : ".expand("%"))
        call append(line(".")+ 1, " * Author    : ".AUTHOR)
        call append(line(".")+ 2, " * E-mail    : ".EMAIL)
        call append(line(".")+ 3, " * Created   : ".TIMENOW)
        call append(line(".")+ 4, "************************************************* */")
        call append(line(".")+ 5, "")
        call append(line(".")+ 6, "package main")
        call append(line(".")+ 7, "import (")
        call append(line(".")+ 8, "        \"os\"")
        call append(line(".")+ 9, "        \"fmt\"")
        call append(line(".")+10, ")")
        call append(line(".")+11, "")
        call append(line(".")+12, "func main() {")
        call append(line(".")+13, "    args := os.Args")
        call append(line(".")+14, "    fmt.Printf(\"%s\\n\",\"Hello, World!\")")
        call append(line(".")+15, "    fmt.Println(len(args))")
        call append(line(".")+16, "    fmt.Println(args)")
        call append(line(".")+17, "}")
    else
        call setline(1         , "\/** ***********************************************")
        call append(line(".")   , " * File Name : ".expand("%"))
        call append(line(".")+ 1, " * Author    : ".AUTHOR)
        call append(line(".")+ 2, " * E-mail    : ".EMAIL)
        call append(line(".")+ 3, " * Created   : ".TIMENOW)
        call append(line(".")+ 4, "************************************************* */")
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

