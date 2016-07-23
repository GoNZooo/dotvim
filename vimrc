" Set default encoding to utf-8
set encoding=utf-8

" Disable swap files
set noswapfile

" Set lazy redrawing
" Works better when scrolling fast
set lazyredraw

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
colorscheme gonzcolors

" Set colorcolumn 81
set colorcolumn=81

" Set search highlighting to all matches
" in gray (color 8)
set hlsearch
highlight Search ctermbg=8
highlight MatchParen ctermbg=2
noremap <F4> :set hlsearch! hlsearch?<CR>

" Set loading of plugin files and indent files on 
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

" Show line numbers
set number
" Make line numbering relative to current line
set relativenumber

" Code search with ag (using ack.vim)
let g:ackprg = 'ag --smart-case'                                                   
cnoreabbrev ag Ack                                                                           
cnoreabbrev aG Ack                                                                           
cnoreabbrev Ag Ack                                                                           
cnoreabbrev AG Ack  

" Load rainbow parentheses
"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces

" Set the python path to be visible for powerline, the enable powerline
set rtp+=/usr/lib/python3.5/site-packages/powerline/bindings/vim/
set laststatus=2

" Make it so that we always go to the last position we were at
" in the buffer when we were last in it.
if has("autocmd")
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
  endif

" Ocaml
let g:ocamlshare = substitute(system('opam config var share'), '\n$', '', '''')

if executable('ocamlmerlin') && has('python')
    execute "set rtp+=".g:ocamlshare."/merlin/vim"
endif

let g:ocpindentfile = g:ocamlshare."/ocp-indent/vim/indent/ocaml.vim"
autocmd FileType ocaml execute "source" . g:ocpindentfile

let g:syntastic_ocaml_checkers = ['merlin']

"Syntastic"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Keymaps
" Space is the leader key (spacemacs <3)
let mapleader="\<Space>"
let maplocalleader="\\"

" Expansions
"
" %% expands to current path, all thanks to Gary Bernhardt
" See: http://vimcasts.org/episodes/the-edit-command/
cnoremap %% <C-R>=fnameescape(expand('%:p:h'))."/"<CR>
" %rc expands to vimrc
cnoremap %rc ~/code/vim/dotvim/vimrc

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

" Ack bind
map <Leader>/ :Ack 
map <Leader>* :Ack <c-r>=expand("<cword>")<cr>

" Map tilde (above TAB) to exit insert mode and visual mode
" For some reason it will actually press enter when trying to exit
" command line mode with tilde, meaning that if you try to cancel a :wq
" or the like it will execute it. Need a workaround...
imap § <Esc>
vmap § <Esc>

" Use sneak
let g:sneak#streak = 1
" <Space><Space> is sneak key (only forwards, backwards still S-s)
nmap <Leader><Leader> <Plug>Sneak_s
xmap <Leader><Leader> <Plug>Sneak_s
omap <Leader><Leader> <Plug>Sneak_s

" Erlang
let g:ref_use_vimproc = 1
let g:ref_open = 'split'
let g:ref_cache_dir = expand('/tmp/vim_ref_cache/')
nno <leader>K :<C-u>Unite ref/erlang
            \ -vertical -default-action=split<CR>

" Elm
let g:elm_format_autosave = 1
