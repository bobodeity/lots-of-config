" Vim-Plug Install command.
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'bfredl/nvim-miniyank'
Plug 'scrooloose/nerdtree'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()

" Normal
set fileencodings=utf-8,utf-16,big5,gb2312,gbk,gb18030,euc-jp,euc-kr,latin1
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

filetype plugin indent on
syntax on

highlight CursorLine cterm=none ctermbg=233 ctermfg=none
highlight CursorColumn cterm=none ctermbg=233 ctermfg=none
highlight Comment ctermfg=white ctermbg=darkblue

set nocompatible                      " not compatible with the old-fashion vi mode
set backspace=2                       " allow backspacing over everything in insert nc >kkmode
set history=500                       " keep 500 lines of command line history
set laststatus=2
set showcmd
set autowrite                         " when the file blur then auto save
set confirm

" Indent
set nosmartindent
set noautoindent
set nocindent
set noexpandtab
set tabstop=2                           " tab character size
set softtabstop=2                       " tab indent size
set shiftwidth=2                        " auto indent size

" Search
set hlsearch                            " search highlighting
set incsearch                           " real-time searching
set ignorecase                          " ignore case when searching
set smartcase                           " when you search 'the' then 'the', 'The' will match, if you search 'The' then it will match 'The' only

" Disable sound on errors
set visualbell
set noerrorbells
set t_vb=
set tm=500

" NERDTree Config
let NERDTreeIgnore = ['\.git$', '^\.ftp*$', '\.DS_Store$']
noremap <F2> :NERDTreeToggle<Enter>

" fzf Config
command! -bang -nargs=* Commits call fzf#vim#commits({'options': '--no-reverse'})
command! -bang -nargs=* BTags call fzf#vim#buffer_tags('', {'options': '--no-reverse'})
command! -bang -nargs=* BCommits call fzf#vim#buffer_commits({'options': '--no-reverse'})
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '--ignore=*.lock --ignore=.git --hidden', {'options': '--bind ctrl-a:select-all,ctrl-d:deselect-all'})
let g:fzf_colors={
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment']
  \ }
