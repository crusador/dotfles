set nocompatible

" Pathogen
    filetype off                    " force reloading *after* pathogen loaded
    call pathogen#infect()
    call pathogen#helptags()

" Terminal
    set term=screen-256color
    set t_Co=256
    set ttyfast
    set shell=bash

" Encoding
    set termencoding=utf-8
    set encoding=utf-8

" Indent
    filetype plugin indent on       " enable detection, plugins and indenting in one step
    set cindent
    set smartindent " Do smart indenting when starting a new line
    set autoindent
    syntax on

" Colors
    colorscheme jellybeans
    hi CursorLine term=none cterm=none ctermbg=0
    hi ColorColumn ctermbg=black guibg=black
    hi ExtraWhitespace ctermbg=NONE ctermfg=darkblue

" Folding
    set foldenable
    set foldmethod=syntax
    set foldlevelstart=99
    set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo "which commands open a fold

" Tab character
    function! SetTabWidth(width)
        exec 'set tabstop='    .a:width
        exec 'set shiftwidth=' .a:width
        exec 'set softtabstop='.a:width
    endfunction
    :call SetTabWidth(4)
    set shiftround  " Round indent to multiple of 'shiftwidth'
    set expandtab
    set smarttab

" Text width
    set tw=80
    set wrap
    set cc=+1

" Apperance
    " Statusline
        set statusline=[%l,%v][%p%%]\ %{fugitive#statusline()}\ %F%m%r%h%w\ {%Y} "Modify the status line
        set laststatus=2

    " Tabs
        set tabpagemax=20
        set showtabline=2  " 0, 1 or 2; when to use a tab pages line
        set tabline=%!MyTabLine()  " custom tab pages line
        if exists("+showtabline")
            function! MyTabLine()
                let s = ''
                let t = tabpagenr()
                let i = 1
                while i <= tabpagenr('$')
                    let buflist = tabpagebuflist(i)
                    let winnr = tabpagewinnr(i)
                    let s .= '%' . i . 'T'
                    let s .= (i == t ? '%1*' : '%2*')
                    let s .= ' '
                    let s .= i . ')'
                    let s .= ' %*'
                    let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
                    let file = bufname(buflist[winnr - 1])
                    let file = fnamemodify(file, ':p:t')
                    if file == ''
                        let file = '[No Name]'
                    endif
                    let s .= file
                    let m = 0 " &modified counter
                    " loop through each buffer in a tab
                    for b in buflist
                        " check and ++ tab's &modified count
                        if getbufvar( b, "&modified" )
                            let m += 1
                        endif
                    endfor
                    " add modified label [n+] where n pages in tab are modified
                    if m > 0
                        if m > 1
                            let s.= ' '
                            let s.= m
                        endif
                        let s.= '+'
                    endif
                    let i = i + 1
                endwhile
                let s .= '%T%#TabLineFill#%='
                let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
                return s
            endfunction
            set tabline=%!MyTabLine()
        endif

    " Other
        set relativenumber
        set lazyredraw
        set cul                         " Highlight cursor line
        set scrolloff=4
        set showcmd                     " show (partial) command in the last line of the screen
                                        " this also shows visual selection info

" Behaviour
    set switchbuf=useopen
    set backspace=indent,eol,start  " allow backspacing over everything in insert mode
    set history=1000                " remember more commands and search history
    set splitright                  " split on the right side
    set splitbelow                  " split below
    set undolevels=1000             " use many muchos levels of undo
    if v:version >= 730
        set undofile                " keep a persistent backup file
        set undodir=~/.vim/.undo,~/tmp,/tmp
    endif
    set nobackup                    " do not keep backup files, it's 70's style cluttering
    set noswapfile                  " do not write annoying intermediate swap files,
    set directory=~/.vim/.tmp,~/tmp,/tmp " store swap files in one of these directories
    set viminfo='20,\"80            " read/write a .viminfo file, don't store more
    set wildmenu                    " make tab completion for files/buffers act like bash
    set wildignore=*.swp,*.bak,*.pyc,*.class
    set title                       " change the terminal's title
    set noerrorbells                " don't beep
    set timeoutlen=500

" Search
    set incsearch
    set ignorecase
    set smartcase
    set hlsearch

" Maps
    " Standard keys remaps
        nnoremap ; :
        nnoremap : ;
        vnoremap ; :
        vnoremap : ;
        nnoremap ' `
        nnoremap ` '
        map      Q <Nop>
        map      K <Nop>
        nmap     j gj
        nmap     k gk
        nnoremap ? ?\v
        vnoremap ? ?\v
        nnoremap / /\v
        vnoremap / /\v
        noremap! <F1> <Esc>
        nnoremap <Tab> %
        vnoremap <Tab> %

    " Control key maps
        inoremap <C-f> <C-x><C-f>
        inoremap <C-l> <C-x><C-l>
        imap     <C-c> <esc>;
        map      <C-s> <esc>;w<CR>
        imap     <C-s> <esc>;w<CR>
        map      <C-t> <esc>;tabe 
        imap     <C-t> <esc>;tabe 

    " Leader key maps
        let mapleader = ","
        map   <leader>c  <c-_>
        vmap  <leader>C  <esc>;'<,'>:w !xclip -selection clipboard -i <CR>
        map   <leader>p  <esc>;set invpaste<CR>
        map   <leader>r  ;vertical resize 85<CR>   " Map \r to resize to 85 cols.
        map   <leader>R  ;s/\s\+$//<cr>            " Map \R to remove trailing whitespace
        map   <leader>h  ;set invhlsearch<cr>
        map   <leader>s  ;let @/ = ""<CR>          " Clear the search pattern
        map   <leader>tw ;set tw=0<CR>            " Remove textwidth
        map   <leader>tW ;set tw=80<CR>           " Set textwidth to 80
        map   <leader>v  ;tabe $MYVIMRC<CR>        " Map \v to edit .vimrc file.
        map   <leader>V  ;so $MYVIMRC<CR>          " Map \V to redload .vimrc file.
        map   <leader>x  <esc>;windo q<cr>         " Quit all windows of this tab
        map   <leader>X  <esc>;!chmod +x %<CR>     " Map \X to add +x to a file

    " Space key maps
        map <space>q  <c-W>q
        map <space>H  <c-W>H
        map <space>J  <c-W>J
        map <space>K  <c-W>K
        map <space>L  <c-W>L
        map <space>h  <c-W>h
        map <space>j  <c-W>j
        map <space>k  <c-W>k
        map <space>l  <c-W>l
        map <space>w  <c-W>w
        map <space>W  <c-W>W
        map <space>=  <c-W>=
        map <space>\| <c-W>\|
        map <space>>  5<c-W>>
        map <space><  5<c-W><

    " 'g' key maps
        map gN ;NERDTree<CR>                    " Map gN for NERDTree
        map gr ;vertical resize 
        map gn ;set invnu<cr>                   " Map gn to toggle Numbers
        map gM ;set mouse=a<cr>                 " Map zm to enable  mouse in console
        map gm ;set mouse=c<cr>                 " Map zM to disable mouse in console

    " [] based key maps
        map ]] j0[[%/{<CR>                      " Map ]] to goto next {
        map [[ ?{<CR>w99[{
        map ][ /}<CR>b99]}
        map [] k$][%?}<CR>                      " Map [] to matching previous }

    " Custom commands
        com! -nargs=1 -complete=file Rot tab sview <args>
        com! -nargs=1 -complete=file Rov vnew | view <args>
        com! -nargs=1 -complete=file Ro view <args>
        com! Reload tabdo :windo :e %
        com! Q q
        com! Qa qa
        com! Qall qall

" Plugin Settings
    let g:EasyMotion_leader_key = '<Leader>'
    let g:sparkupNextMapping = '<c-y>'

" Macros
    let @m='/<<<<<<<<€kb€kb€kb€kb€kb€kb€kb€kb\<\<\<\<\<\<dd/=====€kb€kb€kb€kb€kb\=\=\=\=\=\=\€kbV/>>>>>€kb€kb€kb€kb€kb\>\>\>\>\>\>x'
    let @d='Oimport pdbpdb.set_trace()'

" Automate
    au BufWinEnter * call matchadd('ExtraWhitespace', '\s\+$\| \+\ze\t', -1)
    set list listchars=trail:Â¶

    " Filetype specific
        au BufNewFile,BufRead *.html set ts=4
        au BufNewFile,BufRead *.html set sw=4
        au BufNewFile,BufRead *.html set cc=0
        au BufNewFile,BufRead *.py set tw=0|set foldmethod=indent|set foldenable
        au BufNewFile,BufRead *.vimrc set tw=0|set foldmethod=indent|set foldenable

    autocmd BufEnter * silent! lcd %:p:h
