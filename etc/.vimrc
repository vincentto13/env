function! BuildYCM(info)
" info is a dictionary with 3 fields
" - name: name of the plugin
" - status: 'installed', 'updated', or 'unchanged'
" - force: set on PlugInstall! or PlugUpdate!
if a:info.status == 'installed' || a:info.force
!python3 ./install.py
endif
endfunction

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'
Plugin 'ycm-core/YouCompleteMe', { 'do': function('BuildYCM') }
call vundle#end()
call glaive#Install()
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.  Glaive codefmt plugin[mappings]

if has("syntax")
  syntax on
endif

set encoding=utf-8
