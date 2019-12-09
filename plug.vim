call plug#begin('~/.vim/plugged')

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug 'fatih/vim-go'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'Yggdroot/indentLine'

" Initialize plugin system
call plug#end()
