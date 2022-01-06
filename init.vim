if has('win32') || has('win64')
  let g:plugged_home = '~/AppData/Local/nvim/plugged'
else
  let g:plugged_home = '~/.vim/plugged'
endif
" Plugins List
call plug#begin(g:plugged_home)
  " UI related
  Plug 'taiansu/smyck.vim', { 'as': 'smyck' }
  Plug 'artanikin/vim-synthwave84'

  Plug 'colepeters/spacemacs-theme.vim'
  Plug 'saltdotac/citylights.vim'
  Plug 'chriskempson/base16-vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'preservim/nerdtree'
  Plug 'gko/vim-coloresque'
  Plug 'sheerun/vim-polyglot'
  Plug 'ghifarit53/tokyonight-vim'
  " Better Visual Guide
  Plug 'Yggdroot/indentLine'
  Plug 'tmhedberg/SimpylFold'
  " Plug 'jiangmiao/auto-pairs'
   " Autocomplete
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
  " Formater
  Plug 'mhinz/vim-startify'
  Plug 'b4skyx/serenade'
  source $HOME/.config/nvim/plug-config/coc.vim

call plug#end()
filetype plugin indent on

" UI configuration
syntax on
syntax enable
" colorscheme
if has("termguicolors")
    set termguicolors
endif
if has("gui_running")
  set guicursor=n-v-c-sm:block,i-ci-ve:block,r-cr-o:blocks
endif


let g:tokyonight_style = 'storm'
colorscheme tokyonight

let t:is_transparent = 0
function! Toggle_transparent()
    if t:is_transparent == 0
        hi Normal guibg=NONE ctermbg=NONE
        let t:is_transparent = 1
    else
        colorscheme tokyonight 
        let t:is_transparent = 0
    endif
endfunction

nnoremap <C-t> :call Toggle_transparent()<CR>
" True Color Support if it's avaiable in terminal
set number
set hidden
set mouse=a
set noshowmode
set noshowmatch
set nolazyredraw
" Turn off backup
set nobackup
set nowritebackup

set directory^=$HOME/.nvim/swaps//
set nowrap
" Search configuration
" Tab and Indent configuration

nmap <S-Tab> :NERDTreeToggle<CR> 

au BufNewFile,BufRead *.py
    \ set expandtab       |" replace tabs with spaces
    \ set autoindent      |" copy indent when starting a new line
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set ignorecase                    " ignore case when searchingndif

au BufNewFile,BufRead *.tex
   \ set spell spelllang=en_gb
   \ let g:tex_comment_nospell = 1

function! Formatonsave()
  let l:formatdiff = 1
  py3f /opt/homebrew/Cellar/llvm/13.0.0_2/share/clang/clang-format.py
endfunction

autocmd BufWritePre *.h,*.cc,*.cpp call Formatonsave()

autocmd VimEnter *
            \   if !argc()
            \ |   Startify
            \ |   NERDTree
            \ |   wincmd w
            \ | endif
nnoremap <space> za
let g:tex_conceal=""
autocmd BufNewFile *.py 0put =\"#!/usr/bin/python\<nl>\"|$
set clipboard+=unnamedplus
autocmd FileType tex let b:coc_pairs=["$","$"]
