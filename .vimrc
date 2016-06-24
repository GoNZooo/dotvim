" Set default encoding to utf-8
set encoding=utf-8

" Disable swap files
set noswapfile

" Tab sizes. I can't stand tabsizes of 8 in the end
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Start pathogen
execute pathogen#infect()

" Syntax highlighting on
syntax enable

"set t_Co=256
set background=dark
colorscheme seti


" Set search highlighting to all matches
" in gray (color 8)
set hlsearch
highlight Search ctermbg=8
highlight MatchParen ctermbg=2
noremap <F4> :set hlsearch! hlsearch?<CR>

" Set colorcolumn 81
set colorcolumn=81

" Set loading of plugin files and indent files on 
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

" Show line numbers
set number
" Make line numbering relative to current line
set relativenumber

" Load rainbow parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Set the python path to be visible for powerline, the enable powerline
let $PYTHONPATH='/usr/lib/python3.5/site-packages' 
set laststatus=2

" Make it so that we always go to the last position we were at
" in the buffer when we were last in it.
if has("autocmd")
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
  endif

" Reload .vimrc immediately after writing
if has("autocmd")
	autocmd BufWritePost .vimrc source $MYVIMRC
endif

if has("autocmd")
    autocmd FileType racket set tabstop=2|set shiftwidth=2|set softtabstop=2|set expandtab
endif

" Keymaps
let mapleader="§"
let maplocalleader="\\"

" Expansions
"
" %% expands to current path, all thanks to Gary Bernhardt
" See: http://vimcasts.org/episodes/the-edit-command/
cnoremap %% <C-R>=fnameescape(expand('%:p:h'))."/"<CR>
" %rc expands to vimrc
cnoremap %rc ~/code/tools/dotvim/.vimrc

map <Leader>cd :lcd %:p:h<CR>

" Useful bindings for opening new files
" Current window
map <Leader>ew :e %%
" New tab
map <Leader>et :tabe %%
" New window from vertical split
map <Leader>ev :vsp %%
" New window from horizontal split
map <Leader>es :sp %%

" Map tilde (above TAB) to exit insert mode
imap § <Esc>
