" Vim Config Install Command.
" git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
" sh ~/.vim_runtime/install_awesome_vimrc.sh
" curl -fLo ~/.vim_runtime/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" wget -O ~/.vim_runtime/my_configs.vim https://raw.githubusercontent.com/bobodeity/lots-of-config/master/.vimrc

call plug#begin('~/.vim_runtime/my_plugins')
Plug 'tpope/vim-fugitive'
Plug 'bfredl/nvim-miniyank'
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'

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
set expandtab

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
 let g:NERDTreeWinPos = "left"
 let g:NERDTreeNodeDelimiter = "\u00a0"
 let g:NERDTreeDirArrowExpandable = '▸'
 let g:NERDTreeDirArrowCollapsible = '▾'
 let g:NERDTreeWinSize=30
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

" Asynchronous Lint Engine (ALE)
let g:ale_sign_error = '✗'
let g:ale_fix_on_save = 0
let g:ale_completion_enabled = 1
let g:ale_php_phpcs_standard = "PSR2"
let g:ale_fixers = {
\     '*': [ 'remove_trailing_lines', 'trim_whitespace' ],
\     'php': [ 'php_cs_fixer' ],
\     'javascript': [ 'eslint', 'prettier' ],
\   }
let b:ale_fixers = [ 'prettier', 'eslint' ]
let b:ale_fixers = {
\     '*': [ 'remove_trailing_lines', 'trim_whitespace' ],
\     'php': [ 'php_cs_fixer' ]
\   }

set omnifunc=ale#completion#OmniFunc

noremap <F3> :ALEToggle<Enter>
noremap <F4> :ALEFix<Enter>


" php-cs-fixer
let g:php_cs_fixer_rules = "PSR2"
let g:php_cs_fixer_enable_default_mapping = 0
