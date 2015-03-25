" Set default encoding to utf-8
set encoding=utf-8

" Set colorscheme to solarized
colorscheme jellybeans

" Start pathogen
execute pathogen#infect()

" Syntax highlighting on
syntax on

" Set loading of plugin files and indent files on 
filetype plugin indent on

" Show line numbers
set number

" Set the python path to be visible for powerline, the enable powerline
let $PYTHONPATH='/usr/lib/python3.4/site-packages' 
set laststatus=2

" Make it so that we always go to the last position we were at
" in the buffer when we were last in it.
if has("autocmd")
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
  endif

" Keymaps
let mapleader="§"

" Expansions
"
" %% expands to current path, all thanks to Gary Bernhardt
" See: http://vimcasts.org/episodes/the-edit-command/
cnoremap %% <C-R>=fnameescape(expand('%:h'))."/"<CR>
" %rc expands to vimrc
cnoremap %rc ~/code/vim/dotvim/.vimrc

map <Leader>n :NERDTreeToggle<CR>
map <Leader>cd :lcd %%<CR>

" Useful bindings for opening new files
" Current window
map <Leader>ew :e %%
" New tab
map <Leader>et :tabe %%
" New window from vertical split
map <Leader>ev :vsp %%
" New window from horizontal split
map <Leader>es :sp %%
