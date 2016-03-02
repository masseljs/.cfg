" VIM Configuration File
" Description: Optimized for C/C++ development, but useful also for other things.
" Author: Gerhard Gappmeier

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set mouse=a
set backspace=2

let mapleader = ","

set wildmode=list:longest,full
set wildmenu
"set ruler
"set laststatus=2

" disable vi compatibility (emulation of old bugs)
set nocompatible
set nobackup
" use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent
" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces
" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
set textwidth=120
" turn syntax highlighting on
"set t_Co=256

hi DiffAdd      ctermfg=0 ctermbg=2 guibg='green'
hi DiffDelete   ctermfg=0 ctermbg=1 guibg='red'
hi DiffChange   ctermfg=0 ctermbg=3 guibg='yellow'
hi Pmenu ctermfg=0 ctermbg=5
hi PmenuSel ctermfg=0 ctermbg=2

highlight Pmenu ctermbg=6 gui=bold
syntax on
autocmd BufNewFile,BufRead *.cpp,*.h call HighlightAndFormat()

function! HighlightAndFormat()
 set syn=cpp11
 set formatprg=astyle\ --style=ansi\ --indent=spaces=2\ --pad-oper\ --pad-header\ --delete-empty-lines\ --keep-one-line-blocks\ --convert-tabs\ --align-pointer=type\ --indent-namespaces
endfunction

"colorscheme wombat256
" turn line numbers on
set number
set nowrap
set incsearch
set hlsearch

"set list!
"set listchars=trail:~

" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" Install OmniCppComplete like described on http://vim.wikia.com/wiki/C++_code_completion
" This offers intelligent C++ completion when typing ... .->. or <C-o>
" Load standard tag files
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/sdl
set tags+=~/.vim/tags/qt4

" Install DoxygenToolkit from http://www.vim.org/scripts/script.php?script_id=987
" let g:DoxygenToolkit_authorName="Bryan McDonnel <bryan.mcdonnel@spottradingllc.com>"

" Enhanced keyboard mappings
map <leader>/ /\c
" Fuzzy Finder
map <leader>ff :FufCoverageFile<CR>
map <leader>fb :FufBuffer<CR>
" in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i
" switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" recreate tags file with F5
map <F5> :!ctags -R .c++-kinds=+p .fields=+iaS .extra=+q .<CR>
" build using makeprg with <F7>
map <F7> :make<CR>
" build using makeprg with <S-F7>
map <S-F7> :make clean all<CR>

noremap <F8> :call Svndiff("prev")<CR> 
noremap <F9> :call Svndiff("next")<CR>
noremap <F10> :call Svndiff("clear")<CR>

" goto definition with F12
map <F12> <C-]>

execute pathogen#infect()

