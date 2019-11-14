execute pathogen#infect()
filetype plugin indent on
" 开行号模式
set number
syntax on
" 设置粘贴模式，以免拷贝代码时出现格式混乱
" set paste

set ts=4
set shiftwidth=4
set expandtab
" 高亮搜索结果
set hlsearch
" 在输入搜索内容时自动匹配
set incsearch

" 空行无折行
set noendofline

" 约定 backspace 生效范围
set backspace=indent,eol,start

" 设置折叠模式
" set foldmethod=indent

" 设置私有指令前缀
let mapleader=","
let maplocalleader=","
" 交换 <Leader> 和 ,
nmap \ ,

    " 关联NERDTree 快捷键
    map <Leader>, :NERDTreeToggle<cr>
    " 以root身份保存当前修改
    map <Leader>w :w !sudo tee %<cr>
    " 直接退出
    map <Leader>q :q<cr>
    " 打开TagBar窗口
    nmap <Leader>. :TagbarToggle<cr>
    " 搜索当前单词(高亮状态下效果最佳)
    map <Leader>/ /<C-r><C-w><cr>
    " 随时编辑vimrc
    map <Leader>ee :e ~/.vim/vimrc<cr>
    autocmd! bufwritepost .vimrc source ~/.vimrc

" 分屏相关
    " 窗口切换
    map <C-h> <C-w>h
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-l> <C-w>l
    " 这里换掉了两个系统自带的快捷键
    " <C-k> 特殊字符输入 :help graph-table
    " <C-l> 屏幕刷新
    " 用新的快捷键重写上述功能
    noremap <C-m> <C-l>
    noremap <C-p> <C-k>

    " 调整窗口大小
    " map <C-y> <C-W><
    " map <C-u> <C-W>+
    " map <C-i> <C-W>-
    " map <C-o> <C-W>>

" NERDTree 相关
" 忽略以下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']

" autocmd vimenter * NERDTree
au BufNewFile *.h        set filetype=h
au BufNewFile *.py,*.[ch],*.cpp,*.sh,*.java,*.go exec ":call SetTitle()"
func SetTitle()
    let FILENAME=expand("%")
    let AUTHOR="rootkiter"
    let EMAIL ="rootkiter@rootkiter.com"
    let TIMENOW=strftime("%Y-%m-%d %T %Z")
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
        call append(line(".")+ 0, "\###############################################")
        call append(line(".")+ 1, "\# File Name : ".FILENAME)
        call append(line(".")+ 2, "\#    Author : ".AUTHOR)
        call append(line(".")+ 3, "\#    E-mail : ".EMAIL)
        call append(line(".")+ 4, "\#   Created : ".TIMENOW)
        call append(line(".")+ 5, "\###############################################")
        call append(line(".")+ 6, "")
        call append(line(".")+ 7, "echo \$#")
    elseif &filetype == 'python'
        call setline(1, "\#!/bin/python")
        call append(line(".")+ 0, "\###############################################")
        call append(line(".")+ 1, "\# File Name : ".FILENAME)
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
        call append(line(".")   , " * File Name : ".FILENAME)
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
        call append(line(".")   , " * File Name : ".FILENAME)
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
    elseif &filetype == 'h'
        let DEFINE_MIC ="_".toupper(expand('%:t:r'))."_H_"
        call setline(1          , "\/** ***********************************************")
        call append(line(".")   , " * File Name : ".FILENAME)
        call append(line(".")+ 1, " * Author    : ".AUTHOR)
        call append(line(".")+ 2, " * E-mail    : ".EMAIL)
        call append(line(".")+ 3, " * Created   : ".TIMENOW)
        call append(line(".")+ 4, "************************************************* */")
        call append(line(".")+ 5, "")
        call append(line(".")+ 6, "#ifndef ".DEFINE_MIC)
        call append(line(".")+ 7, "#define ".DEFINE_MIC)
        call append(line(".")+ 8, "")
        call append(line(".")+ 9, "")
        call append(line(".")+10, "#endif //".DEFINE_MIC)
        set filetype=cpp
    else
        call setline(1         , "\/** ***********************************************")
        call append(line(".")   , " * File Name : ".FILENAME)
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
set encoding=utf8
set laststatus=2
"}


" Tagbar
let g:tagbar_width=35

" add a definition for Objective-C to tagbar
if !exists("g:tagbar_type_objc")
    let g:tagbar_type_objc = {
        \ 'ctagstype' : 'ObjectiveC',
        \ 'kinds'     : [
            \ 'i:interface',
            \ 'I:implementation',
            \ 'p:Protocol',
            \ 'm:Object_method',
            \ 'c:Class_method',
            \ 'v:Global_variable',
            \ 'F:Object field',
            \ 'f:function',
            \ 'p:property',
            \ 't:type_alias',
            \ 's:type_structure',
            \ 'e:enumeration',
            \ 'M:preprocessor_macro',
        \ ],
        \ 'sro'        : ' ',
        \ 'kind2scope' : {
            \ 'i' : 'interface',
            \ 'I' : 'implementation',
            \ 'p' : 'Protocol',
            \ 's' : 'type_structure',
            \ 'e' : 'enumeration'
        \ },
        \ 'scope2kind' : {
            \ 'interface'      : 'i',
            \ 'implementation' : 'I',
            \ 'Protocol'       : 'p',
            \ 'type_structure' : 's',
            \ 'enumeration'    : 'e'
        \ }
    \ }
endif

if !exists("g:tagbar_type_go")
    let g:tagbar_type_go = {  
        \ 'ctagstype' : 'go',
        \ 'kinds'     : [
            \ 'p:package',
            \ 'i:imports:1',
            \ 'c:constants',
            \ 'v:variables',
            \ 't:types',
            \ 'n:interfaces',
            \ 'w:fields',
            \ 'e:embedded',
            \ 'm:methods',
            \ 'r:constructor',
            \ 'f:functions'
        \ ],
        \ 'sro' : '.',
        \ 'kind2scope' : {
            \ 't' : 'ctype',
            \ 'n' : 'ntype'
        \ },
        \ 'scope2kind' : {
            \ 'ctype' : 't',
            \ 'ntype' : 'n'
        \ },
        \ 'ctagsbin'  : 'gotags',
        \ 'ctagsargs' : '-sort -silent'
    \ }
endif
