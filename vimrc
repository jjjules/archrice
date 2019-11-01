let mapleader=" "

" Basics behavior and appearance
set nocompatible
set showcmd
set mouse=a
set backspace=indent,eol,start
set number relativenumber
set encoding=utf-8
set bg=light
set splitbelow splitright
syntax on
filetype plugin indent on

" Auto-completion
set wildmode=longest,list,full
set completeopt=longest,menuone

" Handle tabs
set shiftwidth=2
set tabstop=2
set autoindent
set smartindent
set infercase

" Searching
set incsearch
set ignorecase
set smartcase
"set hlsearch

" Set to auto read when a file is changed from the outside
	set autoread

" Disables automatic commenting on newline:
" Does not work, see
" https://vim.fandom.com/wiki/Disable_automatic_comment_insertion
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Mappings
	" Misc
	map					Q <Nop>
	nnoremap 		<C-s> <Nop>
	noremap			0 ^
	inoremap		<Home> <Esc>I
	noremap			<leader>s /
	nnoremap		<leader>c :let save_cursor = getpos('.')<CR>I#<Esc>:call setpos('.', save_cursor)<CR>l
	nnoremap		<leader>d :let save_cursor = getpos('.')<CR>^x:call setpos('.', save_cursor)<CR>h
	nnoremap		<leader>h :nohlsearch<CR>
	nnoremap		<leader>l :b#<CR>
	nnoremap		<leader>ee :Explore
	nnoremap		<leader>et :Texplore
	nnoremap		<leader>es :Sexplore
	nnoremap		<leader>ev :Vexplore

	" Copy and Pasting
	nnoremap		<leader>p "0p
	nnoremap		<leader>P "0P
	nnoremap		Y y$
	vnoremap		<C-c> "*y :let @+=@*<CR>
	vnoremap 		<C-x> "*d :let @+=@*<CR>
	nnoremap 		<C-p> "+P
	inoremap 		<C-p> <Esc>"+pa
	nnoremap		<C-a> ggVG"*y :let @+=@*<CR>

	" Normal mode direct action
	nnoremap		 o<Esc>
	nnoremap		<leader> O<Esc>
	nnoremap		 X

	" Insert mode direct action
	inoremap		<C-h> <C-o>b
	inoremap		<C-j> <Down>
	inoremap		<C-k> <Up>
	inoremap		<C-l> <C-o>w
	inoremap		<C-e> <C-o>$
	inoremap		<C-a> <C-o>0

	" Splits
	nnoremap <C-h> <C-w>h
	nnoremap <C-j> <C-w>j
	nnoremap <C-k> <C-w>k
	nnoremap <C-l> <C-w>l

	" Completion
	inoremap <C-Space> <C-n>
	"" Makes Enter key works as expected
	"inoremap <expr> <CR> call pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
	"" Simulates Down key when entering in completion mode
	"inoremap <expr> <C-n> call pumvisible() ? '<C-n>' :
  "\ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Mysterious command for the map of <CR> in normal mode
	autocmd CmdwinEnter * nnoremap <CR> <CR>
	autocmd BufReadPost quickfix nnoremap <CR> <CR>




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
	autocmd BufWritePre * :%s,^\s\+$,,e

" :W sudo saves the file
	command W w !sudo tee % > /dev/null

" Set syntax for known files
	autocmd BufNewFile,BufRead *profile set syntax=zsh
	autocmd BufNewFile,BufRead *xinitrc set syntax=sh


" Setup automatic fold
	autocmd BufWinLeave *.* mkview
	autocmd BufWinEnter *.* silent loadview
	set viewoptions-=options	" Avoid directory change because of loadview
