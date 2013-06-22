set nocompatible
call pathogen#infect()

colorscheme jellybeans

let g:EasyMotion_leader_key = '<Leader>'
let g:sparkupNextMapping = '<c-y>'

syntax enable
filetype on
set cindent
filetype indent on
filetype plugin on

set ttyfast
set shell=bash
set t_Co=256

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set noexpandtab " Make sure that every file uses real tabs, not spaces
set shiftround  " Round indent to multiple of 'shiftwidth'
set cul
hi CursorLine term=none cterm=none ctermbg=0
set smartindent " Do smart indenting when starting a new line
set autoindent
set cindent
set number
set nofoldenable
set foldmethod=syntax
let s:tabwidth=2
exec 'set tabstop='    .s:tabwidth
exec 'set shiftwidth=' .s:tabwidth
exec 'set softtabstop='.s:tabwidth
set sw=2
set softtabstop=2
set ts=2
set tw=80
set wrap
set cc=+1
set laststatus=2
set statusline=%F%m%r%h%w\ {%Y}\ [%l,%v][%p%%]  "Modify the status line
set incsearch
set ignorecase
set smartcase
set hlsearch


nmap j gj
nmap k gk

" Map \c for tcomment plugin.
map <leader>c <c-_>
map <leader>R :s/\s\+$//<cr>            " Map \R to remove trailing whitespace
map <leader>r :vertical resize 85<CR>   " Map \r to resize to 85 cols.
map <leader>v :so ~/.vimrc<CR>          " Map \v to redload .vimrc file.
vmap <leader>C <esc>:'<,'>:w !xclip -selection clipboard -i <CR>

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

map gM :set mouse=a<cr>                 " Map zm to enable  mouse in console
map gm :set mouse=c<cr>                 " Map zM to disable mouse in console

map ]] j0[[%/{<CR>                      " Map ]] to goto next {
map [[ ?{<CR>w99[{
map ][ /}<CR>b99]}
map [] k$][%?}<CR>                      " Map [] to matching previous }

hi ColorColumn ctermbg=black guibg=black
" hi OverFlow ctermfg=209 guibg=#592929
hi ExtraWhitespace ctermbg=darkred guibg=red

" au BufWinEnter * let w:m2=matchadd('OverFlow', '\%>80v.\+', -1)
au BufWinEnter * call matchadd('ExtraWhitespace', '\s\+$\| \+\ze\t', -1)
au BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

:au BufNewFile,BufRead *.html set ts=4
:au BufNewFile,BufRead *.html set sw=4
:au BufNewFile,BufRead *.html set cc=0
