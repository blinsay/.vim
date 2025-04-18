" ------------------------------------------------------------------------------
" Basics

execute pathogen#infect()
syntax on
filetype plugin indent on

" Compatibility
set nocompatible
set modelines=0

" Colors/Visibility
"
" NOTE: vim-solarized has been kinda jank, ditch it because the defaults look
" fine in ghostty and friends.
"
" set background=dark
" colorscheme solarized-dark
set scrolloff=10

" UI
set nowrap
set wildmenu

" Leader
let mapleader = ","

" Disable Arrow Keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" System clipboard
nnoremap <leader>y "*y
vnoremap <leader>y "*y
nnoremap <leader>p "*p
vnoremap <leader>p "*p

" Format text
nnoremap <leader>q gqip
noremap gq <leader>q

" Search
nnoremap / /\v
vnoremap / /\v
set incsearch hlsearch
set gdefault
set showmatch
nnoremap <leader><space> :noh<cr>
nnoremap <leader>a :Ag<space>

" Disable help key
inoremap <F1> <ESC>
vnoremap <F1> <ESC>
nnoremap <F1> <ESC>

" ------------------------------------------------------------------------------
" Formatting

" Character gutter
set colorcolumn=81

" Indents/tabs
set nobackup
set backspace=indent,eol,start
set nostartofline
set ruler
set number
set showcmd
set showmode
set expandtab
set tabstop=2 softtabstop=2 shiftwidth=2 ai
set encoding=utf-8

" Remove all trailing whitespace on write
autocmd BufWritePre * :%s/\s\+$//e

"find/replace selected text in Visual mode
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" ------------------------------------------------------------------------------
" Windows and splits

" Movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" New splits
noremap <leader>w <C-w>v<C-w>l

" ------------------------------------------------------------------------------
" ALE and language plugins

" ALE
set omnifunc=ale#completion#OmniFunc
let g:ale_linters = {
\   'go': ['go build', 'gofmt', 'govet'],
\   'python': ['flake8'],
\   'rust': ['analyzer'],
\}
let g:ale_rust_analyzer_config = {
\ 'diagnostics': { 'disabled': ['unresolved-import'] },
\ 'procMacro': { 'enable': v:true },
\ 'checkOnSave': { 'command': 'clippy', 'enable': v:true }
\}
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   'rust': ['rustfmt'],
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'typescriptreact': ['prettier'],
\   'css': ['prettier'],
\ }
let g:ale_pattern_options = {
\ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
\ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
\}
nmap <leader><F2> <Plug>(ale_next_wrap)
nmap <leader><F3> <Plug>(ale_detail)

nmap <leader>d <C-]>
nmap gd <Plug>(ale_go_to_definition)
nmap gh <Plug>(ale_hover)

" Go
let g:go_fmt_command = "goimports"
au FileType go nmap <leader>d <Plug>(go-def)
au FileType go nmap <leader>sd <Plug>(go-def-split)
au FileType go nmap <leader>vd <Plug>(go-def-vertical)
au FileType go nmap <leader>j <Plug>(go-doc)
