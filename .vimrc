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
"set colorcolumn=130
" Coloring
"highlight ColorColumn ctermbg=16

" background color
set background=dark

"Do not save backup files.
set backup

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

" Set backup dir
set backupdir=~/.vim/backup//

" Allow to undo changes to a file even after saving it
set undodir=~/.vim/temp_dirs/undodir//
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
"
if filereadable(expand("~/.vim/.vimrc.plug"))
     source ~/.vim/.vimrc.plug
else
endif

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
nnoremap <silent> <leader>sc :source ~/.vimrc<CR>

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
nnoremap <leader><leader>c :call nerdcommenter#Comment(0,"toggle")<CR>
vnoremap <leader><leader>c :call nerdcommenter#Comment(0,"toggle")<CR>
nnoremap <leader>p :Prettier<CR>

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

"colorscheme slate
colorscheme vim-monokai-tasty 
" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{

" Display the friendly cute emoticon when open vim
autocmd VimEnter * echo "        ( ͡° ͜ʖ ͡°)     ƪ(˘⌣˘)ʃ    (>^ . ^<) "

" Auto back to last position kursor during edit file when open edited file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Auto format the code
"au VimEnter * Prettier

" Auto reload of virmc config (BETA)
"autocmd! BufWritePost ~/.vim/.vimrc source ~/.vim/.vimrc 

" This will enable code folding and use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" This group for HTML file
augroup htmlAutocmds
    autocmd!
    autocmd FileType html silent! autocmd BufWritePre <buffer> normal! gg=G
    autocmd FileType html silent! autocmd BufReadPost <buffer> setlocal shiftwidth=4 tabstop=4 expandtab

 "       autocmd Filetype html nnoremap <leader> <F5> :!open %<CR>
  " Define key mapping for HTML template
autocmd FileType html nnoremap <leader>ht :silent! execute 'normal!i\|' \| put = '<!DOCTYPE html>' \| put ='<html>'\| put ='<head>' \| put ='<title></title>' \| put ='<link rel=\"stylesheet\" href=\"style.css\">' \| put ='</head>' \| put ='<body>' \| put ='</body>' \| put ='</html>' \| 1 \| delete _\| Prettier<CR>

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

"let g:user_emmet_leader_key='<C-i>'

let g:user_emmet_settings = {
\  'variables': {'lang': 'ja'},
\  'html': {
\    'default_attributes': {
\      'option': {'value': v:null},
\      'textarea': {'id': v:null, 'name': v:null, 'cols': 10, 'rows': 10},
\    },
\    'snippets': {
\      'html:5': "<!DOCTYPE html>\n"
\              ."<html lang=\"${lang}\">\n"
\              ."<head>\n"
\              ."\t<meta charset=\"${charset}\">\n"
\              ."\t<title></title>\n"
\              ."\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
\              ."</head>\n"
\              ."<body>\n\t${child}|\n</body>\n"
\              ."</html>",
\    },
\  },
\}



