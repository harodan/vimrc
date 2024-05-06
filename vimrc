hi StatusLine ctermbg=8 cterm=NONE
" nnoremap / /\v\c
vnoremap :%s/ :s/
cnoremap %s/ %s/
nnoremap / /\c
" This sub ensures that comments are not automatically un-indented
nnoremap z= zr
nnoremap z+ zr
nnoremap z- zm
nnoremap z0 zM
nnoremap ,q :Rex<CR>
nnoremap [l :lprev<CR>
nnoremap ]l :lnext<CR>
nnoremap ,<space> :nohlsearch<CR>
nnoremap ,n :n<CR>
nnoremap <N :N<CR>
nnoremap ,d :argd %<CR>
xnoremap p pgvy
xnoremap / y/"<CR>
nnoremap gp `[v`]
set esckeys
set pastetoggle=<F2>

" Pathogen load
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on
let g:pymode_options_max_line_length = 120
set fo=cqt

" Formatting commands
nnoremap ,j :%!python -m json.tool<CR>
augroup start
autocmd FileType sql call SqlFormatter()
augroup end
function! SqlFormatter()
    set noai
    " set mappings...
    map ,s  :%!sqlformat --reindent --keywords upper --identifiers lower -<CR>
endfunction

" Auto-enclosures
" inoremap { {}<Esc>i
" inoremap {<CR> {<CR>}<Esc>O
" inoremap } <Esc>la
" inoremap [ []<Esc>i
" inoremap [<CR> [<CR>]<Esc>O
" inoremap ] <Esc>la
" inoremap ( ()<Esc>i
" inoremap (<CR> (<CR>)<Esc>O
" inoremap ) <Esc>la

hi Folded ctermbg=black
iabbrev </ </<C-X><C-O><Esc>==
set list listchars=tab:»·,trail:·
au BufRead,BufNewFile *.cls set filetype=java
" let g:syntastic_python_pyton_exec = 'python3.8'
" let g:syntastic_python_checkers = ['python']
au BufEnter *.cls set syntax=java nowrap noeol "binary
au BufEnter *.trigger set syntax=java nowrap noeol "binary
au BufEnter *.cls syn region javaString start=+'+ end=+'+ end=+$+ contains=javaSpecialChar,javaSpecialError,@Spell
au BufEnter *.trigger syn region javaString start=+'+ end=+'+ end=+$+ contains=javaSpecialChar,javaSpecialError,@Spell
set mouse=
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set smarttab
set smartindent
set hlsearch
set number
set laststatus=2
set statusline=%F\ %m%=%l/%L
set scrolloff=5
" set cursorline
set foldmethod=indent
set foldlevel=20
if &diff
    colorscheme desert
    vnoremap do :'<,'>diffget<CR>
    vnoremap dp :'<,'>diffput<CR>
endif
autocmd BufNewFile,BufRead *.ts set shiftwidth=2
autocmd BufNewFile,BufRead *.ts set tabstop=2
set wrap
