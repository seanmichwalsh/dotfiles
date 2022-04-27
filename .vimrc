" Set line numberings
set number

" Sane tab defaults
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent

" Search improvements
set ignorecase
set smartcase
set hlsearch
set incsearch
nnoremap <esc> :noh<return><esc>

" Prevents Vim from opening in 'Replace' mode due to the above remap
nnoremap <esc>^[ <esc>^[

" Highlight current cursor line
" set cursorline

" Set syntax highlighting
syntax on

" Powerline configuration for Vim
set rtp+=/home/sean/.local/lib/python3.9/site-packages/powerline/bindings/vim
set laststatus=2
set t_Co=256
