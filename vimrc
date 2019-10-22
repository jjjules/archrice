let mapleader=" "

set nocompatible
set showcmd
set mouse=a
set backspace=indent,eol,start
set number relativenumber
set encoding=utf-8
set wildmode=longest,list,full
set bg=light

set shiftwidth=2
set tabstop=2
set autoindent
set smartindent
set infercase

set incsearch
set ignorecase
set smartcase
"set hlsearch

"colorscheme delek
syntax on
filetype plugin indent on

" Set to auto read when a file is changed from the outside
	set autoread

" Disables automatic commenting on newline:
" Does not work, see
" https://vim.fandom.com/wiki/Disable_automatic_comment_insertion
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Mappings
	map					Q <Nop>
	noremap			0 ^
	inoremap		<Home> <Esc>I
	noremap			<leader>s /
	nnoremap		<leader>c mtI#<Esc>'t
	nnoremap		<leader>h :nohlsearch<CR>
	nnoremap		<leader>l :b#<CR>

	nnoremap		<leader>p "0p
	nnoremap		<leader>P "0P
	nnoremap		Y y$
	vnoremap		<C-c> "*y :let @+=@*<CR>
	vnoremap 		<C-x> "*d :let @+=@*<CR>
	nnoremap 		<C-p> "+P
	inoremap 		<C-p> <Esc>"+pa
	nnoremap		<C-a> ggVG"*y :let @+=@*<CR>

	nnoremap		 o<Esc>
	nnoremap		<leader> O<Esc>
	nnoremap		 X

	inoremap		 <Esc>lbi
	inoremap		 <Esc>lwi
	inoremap		 <Esc>A
	inoremap		 <Esc>I

" Mysterious command for the map of <CR> in normal mode
	autocmd CmdwinEnter * nnoremap <CR> <CR>
	autocmd BufReadPost quickfix nnoremap <CR> <CR>

" Splits
	set splitbelow splitright
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Automatically deletes trailing white spaces on save
	fun! DeleteTrailinfWhiteSpaces()
		if exists('b:noStripWhitespace')
        return
    endif
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
	endfun

	autocmd FileType markdown,rmd let b:noStripWhitespace=1
	autocmd BufWritePre * :call  DeleteTrailinfWhiteSpaces()

" :W sudo saves the file
	command W w !sudo tee % > /dev/null

" Set syntax for known files
	autocmd BufNewFile,BufRead *profile set syntax=zsh
	autocmd BufNewFile,BufRead *xinitrc set syntax=sh


" Setup automatic fold
	autocmd BufWinLeave *.* mkview
	autocmd BufWinEnter *.* silent loadview
	set viewoptions-=options	" Avoid directory change because of loadview
