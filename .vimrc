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

" don't make mistakes lol jk i just hate those undofiles
set noundofile

" set tabs to four spaces
set tabstop=4
set shiftwidth=4
set expandtab

