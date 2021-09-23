" turn on syntax highlighting
syntax enable

" set the colorscheme
colorscheme slate

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


" don't make mistakes lol jk i just hate those undofiles
set noundofile

" set tabs to four spaces
set tabstop=4
set shiftwidth=4
set expandtab

" except for makefiles
autocmd FileType make setlocal noexpandtab

" remember previous indent when creating new lines
set smartindent

" linting things
" shoutout to this gist: https://gist.github.com/romainl/ce55ce6fdc1659c5fbc0f4224fd6ad29
augroup Linting
    autocmd!
    autocmd FileType go setlocal makeprg=staticcheck\ .
    autocmd BufWritePost *.go silent make! | silent redraw!
    autocmd QuickFixCmdPost [^l]* cwindow
augroup END
