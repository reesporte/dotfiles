" turn on syntax highlighting
syntax enable

" set the colorscheme
colorscheme lowlights

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

" automatically continue the indent
set autoindent

" TODO: fix trailx so it doesnt change file mode lol
" auto-format all files on save with trailx to remove trailing spaces
" autocmd BufWritePost * silent! !trailx <afile>
" autocmd BufWritePost * redraw!


" auto-format go files on save with goimports
autocmd BufWritePost *.go silent! !goimports -w <afile> && gofumpt -w <afile>
autocmd BufWritePost *.go redraw!

" auto-format c, c++, and java files on save with clang-format
autocmd BufWritePost *.c,*.cpp,*.java silent! !clang-format -i <afile>
autocmd BufWritePost *.c,*.cpp,*.java redraw!

" auto-format python files on save with black
autocmd BufWritePost *.py silent! !black <afile>
autocmd BufWritePost *.py redraw!

" auto-format html, css files on save with prettier
autocmd BufWritePost *.html,*.css silent! !prettier -w <afile>
autocmd BufWritePost *.html,*.css redraw!

" auto-format terraform files on save with terraform fmt
autocmd BufWritePost *.tf silent! !terraform fmt <afile>
autocmd BufWritePost *.tf redraw!

" auto-format rust files on save with rustfmt
autocmd BufWritePost *.rs silent! !rustfmt <afile>
autocmd BufWritePost *.rs redraw!

" auto-format js/typescript files on save with prettier
autocmd BufWritePost *.ts,*.tsx,*.js silent! !prettier --write <afile>
autocmd BufWritePost *.ts,*.tsx,*.js redraw!

" auto-format zig files on save with zig fmt
autocmd BufWritePost *.zig silent! !zig fmt <afile>
autocmd BufWritePost *.zig redraw!

" auto-format proto files on save with buf format
autocmd BufWritePost *.proto silent! !buf format -w <afile>
autocmd BufWritePost *.proto redraw!


" don't make mistakes lol jk i just hate those undofiles
set noundofile

" set tabs to four spaces
set tabstop=4
set shiftwidth=4
set expandtab

" except for makefiles
autocmd FileType make setlocal noexpandtab

" fuzzy file finding but recursive
set path+=.,**
" stack overflow says this works better
nnoremap <C-p> :find ./**/*


" linting things
" shoutout to this gist: https://gist.github.com/romainl/ce55ce6fdc1659c5fbc0f4224fd6ad29
" augroup Linting
"    autocmd!
"    autocmd FileType go setlocal makeprg=go\ vet\ <afile>
"    autocmd BufWritePost *.go silent make! | silent redraw!
"    autocmd QuickFixCmdPost [^l]* cwindow
"augroup END

" custom syntax files
" for terraform / hcl files
au BufRead,BufNewFile *.tf set filetype=hcl
au BufRead,BufNewFile *.hcl set filetype=hcl

" for zig files
au BufRead,BufNewFile *.zig set filetype=zig

" set ctags file name
set tags=./tags,./tags.o,./tags.dot;

" set regex engine to use NFA
set re=2

" make file-browsing more enjoyable
let g:netrw_banner=0 " no banner
let g:netrw_liststyle=3 " tree view
" turn off that dagnab bell
set noeb vb t_vb=

" allow filetype plugins
filetype plugin on

if has ('nvim')
    " fix neovim ugly cursor
    set guicursor=n-v-c-i:block

    " neovim thinks terminals should start in normal mode, this is dumb. make
    " it start in insert mode.
    autocmd TermOpen * startinsert!

    " neovim has numbers on in terminals all the time. this is dumb, make it
    " so that numbers are only on in normal mode.
    autocmd TermEnter * setlocal nonu
    autocmd TermLeave * setlocal nu

    " neovim leaves the terminal open when the process exits. this is dumb,
    " make it close immediately.
    autocmd TermClose * close

    " make ter start a terminal in a split
    cabbrev ter sp<bar>term

    " make esc put you back in normal mode, when you're in terminal mode
    tmap <Esc> <C-\><C-N>

    " neovim mouse scrolling sucks
    set mouse=

    " neovim opens shit with folds for no good reason
    set nofoldenable

    " neovim thinks it's fun to show you what your command is going to do
    " before you do it. this turns that off.
    let &inccommand = ""
endif
