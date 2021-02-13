source $HOME/.config/nvim/plug-config/coc.vim
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'mbbill/undotree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'relase'}
Plug 'lervag/vimtex'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'tmhedberg/simpylfold'
Plug 'pseewald/vim-anyfold'
Plug 'frazrepo/vim-rainbow'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
Plug 'vimwiki/vimwiki'
Plug 'skywind3000/asyncrun.vim'
Plug 'lervag/vimtex'
Plug 'blindFS/vim-taskwarrior'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'preservim/tagbar'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'jupyter-vim/jupyter-vim'
Plug 'fisadev/vim-isort'
Plug 'mhinz/vim-startify'
Plug 'yuttie/comfortable-motion.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'ryanoasis/vim-devicons'

call plug#end()

" Setting termguicolors and colorizer
set termguicolors

set nocompatible

" Setting leader and localleader
let mapleader = ","
let maplocalleader = "\\"

" Using colorizer
lua require'colorizer'.setup()

" Setting filetype detection, plugin and indent
filetype plugin indent on

" Enable syntax highlighting
syntax on

" Setting key timeout
set timeout timeoutlen=1000

" Setting blink frequency of cursor
set guicursor=a:blinkon200

" Defining file encoding
set encoding=utf-8

" Showing line numbers
set number

" Setting tab size, indentation and notabstop
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set smarttab

" Setting auto indentation
set autoindent

" Highlighting matching parentheses
set showmatch

" Defining the reading file format
set fileformat=unix

" Highlighting the row and column of the cursor
set cursorline
set cursorcolumn

" Autoreading files that were saved outside neovim
set autoread

" Deleting any backup files created prior to saving
set nobackup

" Deleting backups created during a write event
set nowritebackup

" Preventing throwing away of buffers
set hidden

" Shortening the time to update after key triggers are ceased
set updatetime=200

" Setting simpylfold
let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_docstring = 1 
let g:SimpylFold_fold_import = 1

" Setting the colortheme
colorscheme dracula

" Using default mappings for NERDTree
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims=1

" Defining the theme for airline
let g:airline_theme='dracula'

" Setting undotree_SplitWidth
let g:undotree_SplitWidth=30

" Enabling docstring preview in folded code sections for SimpylFold
" let g:SimpylFold_docstring_preview = 1

" Setting rainbow brackets and disabling it for md files for syntax collapsing
let g:rainbow_active=0
autocmd Filetype md let g:rainbow_active=0

" Defing browser to use to open MarkdownPreview
let g:mkdp_browser = 'qutebrowser'

" Activating rainbow parentheses
let g:rainbow_active=0

"Defing tex flavor to be used for vimtex
let g:tex_flavor = 'latex'
let g:vimtex_enabled=1

" Making airline prettier
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" Setting the opened file's directory to the current working directory
autocmd BufEnter * silent! lcd %:p:h

" Defining :CocDiagnostics
nnoremap <leader>d : CocDiagnostics<CR>

" IndentGuidesToggle
nnoremap <leader>` : IndentGuidesToggle<CR>

" NERDCommenterToggle
nmap <leader><space> <plug>NERDCommenterToggle
vmap <leader><space> <plug>NERDCommenterToggle

" Defining the UndotreeToggle mapping
nnoremap  <leader>z : UndotreeToggle<CR>

" NERDTree Toggle
nnoremap <F2> :NERDTreeToggle<CR>

" TagBar Toggle
nnoremap <F3> :TagbarToggle<CR>

" Opening a vertical split and opening the presently opened markdown file in
" it with mdp 
nnoremap MD :vs <CR>:term mdp %<CR>

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 1

" Setting Esc as the terminal leaving command when terminal opened in nvim
tnoremap <Esc> <C-\><C-n>

" Using pandoc to open rendered documents in okular
nmap <Leader>pc :w <bar> :silent !pandoc -o %:r.pdf %<CR>

" Having documents converted by Pandoc opened in okular
nnoremap <Leader>pp :AsyncRun okular %:r.pdf<CR>

let g:vimwiki_global_ext = 0
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
" vim-motion 
" Move to character
map <LocalLeader>f <Plug>(easymotion-bd-f)
nmap <LocalLeader>f <Plug>(easymotion-overwin-f)

" Move to character-character
nmap <LocalLeader>s <Plug>(easymotion-overwin-f2)

" Move to line
map <LocalLeader>L <Plug>(easymotion-bd-jk)
nmap <LocalLeader>l <Plug>(easymotion-overwin-line)

" Move to word
map <LocalLeader>w <Plug>(easymotion-bd-w)
nmap <LocalLeader>w <Plug>(easymotion-overwin-w)

" Isort
nmap <C-i> :Isort <CR>

" Gipgrep for tags for vimwiki
nmap <Leader>t :Rg :

" Making the background transparent
hi Normal guibg=NONE ctermbg=NONE

let g:airline#extensions#tmuxline#enabled = 0

let g:airline#extensions#tabline#enabled = 0

let g:python3_host_prog = expand('/home/workboots/workEnv/bin/python3')

if !exists('g:undotree_SetFocusWhenToggle')
    let g:undotree_SetFocusWhenToggle = 1
endif

" Fixing transparency bug for goyo
function! s:goyo_leave()
         hi Normal guibg=NONE ctermbg=NONE
endfunction
autocmd! User GoyoLeave nested call <SID>goyo_leave()

