" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'scrooloose/nerdtree'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
  Plug 'zivyangll/git-blame.vim'
  Plug 'deoplete-plugins/deoplete-go', { 'do': 'make' }
endif
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'itchyny/lightline.vim'
call plug#end()

set number
set pastetoggle=<F2>
set laststatus=2
let g:deoplete#enable_at_startup = 1


let g:go_info_mode='gopls'

command! W w
command! Q q
command! Wq wq
command! WQ wq

let g:go_fmt_command = "goimports"

au FileType go nmap <Leader>gr <Plug>(go-referrers)
au FileType go nmap <Leader>gc <Plug>(go-callers)
au FileType go nmap <Leader>i <Plug>(go-info)

let mapleader = ","
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
inoremap <C-j> : <C-n><CR>
