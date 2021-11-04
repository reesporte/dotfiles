" turn on syntax highlighting
syntax enable

" set the colorscheme
colorscheme shades-of-pastel

" turn on line numbers
set number

" minimize number spacing
set numberwidth=1

" set line number colors 
highlight LineNr ctermfg=White

" always show the status bar at the bottom
set laststatus=2

" search as you type rather than waiting to press enter
set incsearch

" if the file is edited, reload it
set autoread

" auto-format go files on save with goimports
autocmd BufWritePost *.go silent! !goimports -w <afile>
autocmd BufWritePost *.go redraw!

" auto-format c files on save with clang-format
autocmd BufWritePost *.c silent! !clang-format -i <afile>
autocmd BufWritePost *.c redraw!

" auto-format python files on save with black
autocmd BufWritePost *.py silent! !black --line-length 100 <afile>
autocmd BufWritePost *.py redraw!

" auto-format html files on save with html-compile
autocmd BufWritePost *.html silent! !html-compile --prettify <afile> --out .
autocmd BufWritePost *.html redraw!

" auto-format terraform files on save with terraform fmt
autocmd BufWritePost *.tf silent! !terraform fmt <afile>
autocmd BufWritePost *.tf redraw!

" auto-format rust files on save with rustfmt
autocmd BufWritePost *.rs silent! !rustfmt <afile>
autocmd BufWritePost *.rs redraw!

" auto-format js/typescript files on save with prettier
autocmd BufWritePost *.ts,*.tsx,*.js silent! !prettier --write <afile>
autocmd BufWritePost *.ts,*.tsx,*.js redraw!


" don't make mistakes lol jk i just hate those undofiles
set noundofile

" set tabs to four spaces
set tabstop=4
set shiftwidth=4
set expandtab

" except for makefiles
autocmd FileType make setlocal noexpandtab


" linting things
" shoutout to this gist: https://gist.github.com/romainl/ce55ce6fdc1659c5fbc0f4224fd6ad29
augroup Linting
    autocmd!
    autocmd FileType go setlocal makeprg=go\ vet\ <afile>
    autocmd BufWritePost *.go silent make! | silent redraw!
    autocmd QuickFixCmdPost [^l]* cwindow
augroup END

" custom syntax files 
" for terraform / hcl files
au BufRead,BufNewFile *.tf set filetype=hcl
au BufRead,BufNewFile *.hcl set filetype=hcl

" set ctags file name
set tags=./tags,./tags.o,./tags.dot;

" set regex engine to use NFA 
set re=2
