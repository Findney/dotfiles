""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                                  "
"                                                                                  "
"            ███████╗██╗███╗   ██╗██████╗ ███╗   ██╗███████╗██╗   ██╗              "
"            ██╔════╝██║████╗  ██║██╔══██╗████╗  ██║██╔════╝╚██╗ ██╔╝              "
"            █████╗  ██║██╔██╗ ██║██║  ██║██╔██╗ ██║█████╗   ╚████╔╝               "  
"            ██╔══╝  ██║██║╚██╗██║██║  ██║██║╚██╗██║██╔══╝    ╚██╔╝                "
"            ██║     ██║██║ ╚████║██████╔╝██║ ╚████║███████╗   ██║                 " 
"            ╚═╝     ╚═╝╚═╝  ╚═══╝╚═════╝ ╚═╝  ╚═══╝╚══════╝   ╚═╝                 " 
"                                                                                  "
"                                                                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" SET SETTINGS ---------------------------------------------------------------- {{{

" set code goes here.

" enable syntax highlighting
syntax on

" enable smartindents
set smartindent

" enable autoindents
set autoindent

" enable mouse
"set mouse=a 
" to unenable mouse
set mouse=

" Disable compatibility with vi which can cause unexpected issues
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" number of spaces in a <Tab>
set tabstop=4
set softtabstop=4
set expandtab

" number of spaces used for autoindents
set shiftwidth=4

" columns used for the line number
set numberwidth=4

" adds line Number
set number
set relativenumber

" Linebreak
set lbr 

" for ensure that no line can ever be longer than 80 characters
set textwidth=129

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
set cursorcolumn
" Higlight right margin
set colorcolumn=130
" Coloring
"highlight ColorColumn ctermbg=16

" background color
set background=dark

"Do not save backup files.
se nobackup

" Do not jrap lines. Allow long lines to extend as far as the line goes.
set wrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" This will allow you to search specifically for capital letters.
set smartcase

" Set the commands to save in history default number is 20.
set history=500

" Always shows current position
set ruler

" A buffer becomes hidden when it is abandoned
set hid

" Mark result search
set hlsearch

" automatically writes the contents of a file to disk 
"before certain actions that may cause data loss, such as switching buffers or quitting Vim
set aw

" configure backspace
set backspace=indent,eol,start

" Support encoding 
set encoding=utf-8

" Allow to undo changes to a file even after saving it
"set undodir=~/.vim/backup/temp_dirs/undodir
set undofile

" Display cursorline and cursorcolumn only in active window
augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline nocursorcolumn
    autocmd WinEnter * set cursorline cursorcolumn 
augroup END

" Add extra margin to the left
set foldcolumn=1 

" }}}


" PLUGINS ---------------------------------------------------------------- {{{

" Call the myplugin.plug file
"let myplugin_file = expand('~/.vim/.vimrc.plug')
"if filereadable(myplugin_file)
"    source myplugin_file
"else 
"    echomsg("ERROR READING FILE " . myplugin_file)
"endif

"let myplugin_file = '~/.vim/.vimrc.plug'
"if filereadable(expand(myplugin_file))
"     source myplugin_file
"else
"     echomsg("ERROR READING FILE " . myplugin_file)
"endif



" }}}


" MAPPINGS --------------------------------------------------------------- {{{

" Map esacape to jj
inoremap jj <ESC> 

" Set mapleader to space
let mapleader = " "

" Save quickly
nnoremap <silent> <leader>w :w!<CR>

" remove highlight when search
nnoremap <silent> <leader>/ :noh<CR>

" To sourcing mapping
nnoremap <silent> <leader>sc :source /etc/vimrc<CR>


" Press \p to print the current file to the default printer from a Linux operating system.

" Set default printer:      lpoptions -d <printer_name>
" <silent> means do not display output.
nnoremap <silent> <leader>p :%w !lp<CR>

" To type ':' quickly
noremap <leader>; :

" Map the F5 key to run a Python script inside Vim.
"nnoremap <F5> :w <CR>:!clear <CR>:!python3 % <CR>

" New line within normal mode
nnoremap o o<ESC>
nnoremap O O<ESC>

" Yank from cursor to the end of line
nnoremap Y y$

" Switch the window
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j

" Resize split windows
nnoremap <c-up> <c-w>+
nnoremap <c-down> <c-w>-
nnoremap <c-left> <c-w><
nnoremap <c-right> <c-w>>

" Expand split windows
nnoremap <c-n> <c-w>_
nnoremap <c-=> <c-w>=

" Tab next and previous
nnoremap <silent> <leader>tk :tabn<CR>
nnoremap <silent> <leader>tj :tabp<CR>

" New tab
nnoremap <silent> <leader>tn :tabnew<CR>

nnoremap <silent> <leader>to :tabonly<CR>

" Tab close
nnoremap <silent> <leader>tc :tabc<CR>
" Tab move 
nnoremap <silent> <leader>tm :tabm<CR>

" Toggle for switch the last tab
let g:lasttab = 1
nnoremap <silent> <leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Open new tab with the current buffer path
nnoremap <leader>te :tabedit <C-r>=escape(expand("%:p:h"), " ")<CR>/

" Toggle to open and close NERDTree
nnoremap <silent> <leader>t :NERDTree<CR>

" NERDTree ignore certain files
let NERDTreeIgnore=['\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

" Searches current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Open file manager (BETA)
"nnoremap  :silent !xdg-open . 2>/dev/null<CR>
"nnoremap  :silent execute '!xdg-open ' . expand('%:p:h') . ' 2>/dev/null'<CR>


"nnoremap <A-j> mz:m+<cr>`z
"nnoremap <A-k> mz:m-2<cr>`z
"vnoremap <A-j> :m'>+<cr>`<my`>mzgv`yo`z
"vnoremap <A-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Use parenthesis/bracker in visual mode for single character
vnoremap $1 <ESC>`>a)<ESC>`<i(<ESC>
vnoremap $2 <ESC>`>a]<ESC>`<i[<ESC>
vnoremap $3 <ESC>`>a}<ESC>`<i{<ESC>
vnoremap $$ <ESC>`>a"<ESC>`<i"<ESC>
vnoremap $q <ESC>`>a'<ESC>`<i'<ESC>
vnoremap $e <ESC>`>a`<ESC>`<i`<ESC>

" Map for auto complete of (, [, {,",'
inoremap $1 ()<ESC>i
inoremap $2 []<ESC>i
inoremap $3 {}<ESC>i
inoremap $4 {<ESC>o}<ESC>O
inoremap $q ""<ESC>i
inoremap $e ''<ESC>i

" }}}


" COMMAND LINE --------------------------------------- {{{


" Edit certain file quickly
cno $h e ~/

" Edit current directory quickly
cno $c e <C-\>eCurrentFileDir("e")<cr>



" }}}


" COLORS ----------------------------------- {{{

colorscheme slate




" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{

" Display the friendly cute emoticon when open vim
autocmd VimEnter * echo "        ( ͡° ͜ʖ ͡°)     ƪ(˘⌣˘)ʃ    (>^ . ^<) "

" Auto back to last position kursor during edit file when open edited file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Auto reload of virmc config (BETA)
"autocmd! BufWritePost ~/.vim/.vimrc source ~/.vim/.vimrc 

" This will enable code folding and use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" If the current file type is HTML
augroup htmlAutocmds
    autocmd!
    autocmd FileType html silent! autocmd BufWritePre <buffer> normal! gg=G
    autocmd FileType html silent! autocmd BufReadPost <buffer> setlocal shiftwidth=4 tabstop=4 expandtab
augroup END


function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        "call CmdLine("Ack '" . l:pattern . "' " )
        execute 'vimgrep /' . l;pattern . '/g %'
        copen
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

func! CurrentFileDir(cmd)
    return a:cmd . " " . escape(expand("%:p:h"), " ") . "/"
endfunc


" }}}


" STATUS LINE ------------------------------------------------------------ {{{

" Status bar code goes here.

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline=%F%m%r%h%w

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=[FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

" Show the status on the second to last line.
set laststatus=2


" }}}


" DEFAULT ------------------------------------------------------------------------------- {{{

" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
"runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim80/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1

" }}}



