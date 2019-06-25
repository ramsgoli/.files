" Plugins
	call plug#begin('~/.local/share/nvim/plugged')
	Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
	Plug 'sheerun/vim-polyglot'
	Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
	Plug 'vimlab/split-term.vim'
	Plug 'wincent/command-t'
	call plug#end()

" NerdTree
	let NERDTreeShowHidden=1

	" open NerdTree with <C-n>
	nnoremap <C-n> :NERDTreeToggle<CR>

	" Enter NerdTree automatically
	autocmd VimEnter * NERDTree

	" Automaticaly close nvim if NERDTree is only thing left open
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" General Editor Config
	" Remap leader key to ;
	let g:mapleader=';'

	syntax on
	set splitright
	set nu
	set shell=/bin/zsh
	set nowrap

	noremap <leader>w :w<CR>
	noremap <leader>q :q<CR>

	" Make window navigation easier
	noremap <C-l> <C-w>l
	noremap <C-h> <C-w>h
	noremap <C-j> <C-w>j
	noremap <C-k> <C-w>k

	" Re-read file if it changes outside of vim
	set autoread

	" Don't search inside node_modules
	set wildignore+=*/node_modules/*

	" hit space to visually select a word
	nnoremap <space> viw

	" hit - to move the current line down by one
	nnoremap - ddp

	" edit init.vim in a vertical split
	noremap <leader>ev :vsplit $MYVIMRC<cr>

	" source vimrc with sv
	noremap <leader>sv :source ~/.config/nvim/init.vim<CR>

	" surround word in quotes (normal mode only)
	nnoremap " i"<esc>ea"<esc>

" Theme
	set termguicolors
	colorscheme onedark

" Command-t
	let g:CommandTCancelMap = ['<ESC>', '<C-c>']

" Filetype
	autocmd FileType html setlocal ts=2 sts=2 sw=2
	autocmd FileType css setlocal ts=2 sts=2 sw=2
	autocmd FileType javascript setlocal ts=2 sts=2 sw=2 smarttab expandtab

" COC
	nmap <silent> gd <Plug>(coc-definition)
