call pathogen#infect()

colorscheme jellybeans

let g:EasyMotion_leader_key = '<Leader>'

syntax enable
filetype on
" filetype indent on
filetype plugin on

set nocompatible
set ttyfast
set shell=bash
set t_Co=256

set autoindent
set cindent
set number
set foldmethod=manual
set shiftwidth=2
set ts=2
set softtabstop=2
set tw=80
set wrap
set cc=+1
set laststatus=2
set statusline=%F%m%r%h%w\ {%Y}\ [%l,%v][%p%%]  "Modify the status line

" Map \c for tcomment plugin.
map <leader>c <c-_>
map <leader>R :s/\s\+$//<cr>            " Map \R to remove trailing whitespace
map <leader>r :vertical resize 85<CR>   " Map \r to resize to 85 cols.
map <leader>v :so ~/.vimrc<CR>          " Map \v to redload .vimrc file.

map <space>w <c-W>w
map <space>W <c-W>W
map <space>\| <c-W>\|
map <space>q <c-W>q
map <space>> <c-W>>
map <space>< <c-W><
map <space>: :wincmd 
map <space>; :

map gN :NERDTree<CR>                    " Map gN for NERDTree
map gr :vertical resize 
map gn :set invnu<cr>                   " Map gn to toggle Numbers

map zM :set mouse=a<cr>                 " Map zm to enable  mouse in console
map zm :set mouse=c<cr>                 " Map zM to disable mouse in console

map ]] j0[[%/{<CR>                      " Map ]] to goto next {
map [[ ?{<CR>w99[{
map ][ /}<CR>b99]}
map [] k$][%?}<CR>                      " Map [] to matching previous }

hi ColorColumn ctermbg=black guibg=black
hi OverFlow ctermfg=209 guibg=#592929
hi ExtraWhitespace ctermbg=darkred guibg=red

au BufWinEnter * let w:m2=matchadd('OverFlow', '\%>80v.\+', -1)
au BufWinEnter * call matchadd('ExtraWhitespace', '\s\+$\| \+\ze\t', -1)
au BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

set sw=2

silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
