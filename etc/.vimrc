set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'
Plugin 'ycm-core/YouCompleteMe'
call vundle#end()
call glaive#Install()
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.  
Glaive codefmt plugin[mappings]

augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType vue AutoFormatBuffer prettier
augroup END

if has("syntax")
  syntax on
endif

set encoding=utf-8
filetype plugin indent on
" show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
" set textwidth=90
set colorcolumn=90
set number
set foldmethod=syntax
hi Folded ctermbg=black
map <C-]> :YcmCompleter GoToImprecise<CR>
let g:ycm_enable_diagnostic_signs = 1
highlight YcmErrorLine ctermfg=White cterm=bold
