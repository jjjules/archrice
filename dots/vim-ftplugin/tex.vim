setlocal breakindent
setlocal breakindentopt=min:40,sbr
setlocal showbreak=>

setlocal listchars=tab:\┊\ 
setlocal list

nnoremap <leader>w m':g/^/norm gqq<CR>:w<CR>''zz
nnoremap <leader><leader> gqip`^
" autocmd! InsertLeave *.tex norm gqip
