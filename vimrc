let mapleader=" "

set number relativenumber
set encoding=utf-8
set mouse=a
set wildmode=longest,list,full
set bg=light

set ignorecase
set smartcase

set shiftwidth=2
set tabstop=2
set autoindent
set smartindent

" Set to auto read when a file is changed from the outside
	set autoread

"" Mappings
map 0 ^
map <leader><leader> /
map <leader>c "+y
map <leader>p "+P

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

	autocmd BufWritePre *.md,*.markdown let b:noStripWhitespace=1
	autocmd BufWritePre * :call  DeleteTrailinfWhiteSpaces()


" :W sudo saves the file
	command W w !sudo tee % > /dev/null

" Taken from defaults.vim
" Only do this part when Vim was compiled with the +eval feature.
if 1

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  " Revert with ":filetype off".
  filetype plugin indent on

  " Put these in an autocmd group, so that you can revert them with:
  " ":augroup vimStartup | au! | augroup END"
  augroup vimStartup
    au!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid, when inside an event handler
    " (happens when dropping a file on gvim) and for a commit message (it's
    " likely a different one than last time).
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif

  augroup END

endif

" Switch syntax highlighting on when the terminal has colors or when using the
" GUI (which always has colors).
if &t_Co > 2 || has("gui_running")
  " Revert with ":syntax off".
  syntax on

  " I like highlighting strings inside C comments.
  " Revert with ":unlet c_comment_strings".
  let c_comment_strings=1
endif
