let mapleader = ","
set nocompatible                                      " So that we can use polyglot plugin



call plug#begin('~/.config/nvim/plugged')

" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Lua functions
" Plug 'nvim-lua/plenary.nvim'

" vim reload
" Plug 'famiu/nvim-reload'

" vim comment lines
Plug 'tpope/vim-commentary'  


" Airline
Plug 'vim-airline/vim-airline'
" Plug 'itchyny/lightline.vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'



" foreign
Plug 'neoclide/coc.nvim', {'branch': 'release'}         " LSP and more
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }     " fzf itself
" Plug 'junegunn/fzf.vim'                                 " fuzzy search integration
Plug 'vim-scripts/auto-pairs-gentle'                                 " fuzzy search integration
" Plug 'honza/vim-snippets'                               " actual snippets
Plug 'Yggdroot/indentLine'                              " show indentation lines
" Plug 'tpope/vim-liquid'                                 " liquid language support
" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}  " better python
" Plug 'mhinz/vim-startify'                               " cool start up screen
" Plug 'tpope/vim-fugitive'                               " git support
Plug 'psliwka/vim-smoothie'                             " some very smooth ass scrolling
" Plug 'christoomey/vim-tmux-navigator'                   " seamless vim and tmux navigation
" Plug 'ryanoasis/vim-devicons'                 " pretty icons everywhere
" Plug 'gregsexton/MatchTag'                    " highlight matching html tags
" Plug 'Jorengarenar/vim-MvVis'                 " move visual selection
Plug 'sheerun/vim-polyglot'                   " for better highlight
Plug 'rhysd/vim-clang-format'                 " for c code formatting
" Themes
" Plug 'ghifarit53/tokyonight-vim'

" Plug 'hzchirs/vim-material'
" Plug 'morhetz/gruvbox'                        " GruvBox colorScheme
" Plug 'cocopon/pgmnt.vim'
" Plug 'joshdick/onedark.vim'
" Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'dracula/vim', { 'name': 'dracula' }



Plug 'luochen1990/rainbow'                    " rainbow parenthesis
let g:rainbow_active = 1

Plug 'lfv89/vim-interestingwords'             " highlight word
nnoremap <silent> <space>k :call InterestingWords('n')<cr>
vnoremap <silent> <space>k :call InterestingWords('v')<cr>
nnoremap <silent><esc><esc> :call UncolorAllWords()<cr>

nnoremap <silent> n :call WordNavigation(1)<cr>
nnoremap <silent> N :call WordNavigation(0)<cr>
let g:interestingWordsGUIColors = ['#FF7272', '#A4E57E','#8CCBEA', '#FFDB72',  '#FFB3FF', '#9999FF']

" Modified bits of code
Plug 'jackguo380/vim-lsp-cxx-highlight'
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

" lint for c++




call plug#end()



" auto format
nmap ff :ClangFormat<cr>
" nmap <C-I> :Prettier<cr>

" let g:prettier#autoformat = 1
" au BufWrite * :Autoformat



" Auto bracket pairs
" inoremap {<CR> {<CR>}<Esc>ko<tab>
" inoremap [<CR> [<CR>]<Esc>ko<tab>
" inoremap (<CR> (<CR>)<Esc>ko<tab>

" Html tag auto indent


" Builtin plugins
let loaded_netrw = 0                                    " diable netew

" Color theme Settings
set termguicolors

" let g:tokyonight_style = 'night' " available: night, storm
" let g:tokyonight_enable_italic = 1
" let g:airline_theme = "tokyonight"
" colorscheme tokyonight

" let g:material_style='oceanic'
" set background=dark
" colorscheme vim-material
" let g:airline_theme='material'


" let g:gruvbox_contrast_dark = 'hard'
" let g:gruvbox_sign_column   = 'bg0'
" colorscheme gruvbox


colorscheme dracula

" indentLine
let g:indentLine_char_list = ['▏', '¦', '┆', '┊']
let g:indentLine_setColors = 0
let g:indentLine_setConceal = 0                         " actually fix the annoying markdown links conversion








" Airline

let g:airline_skip_empty_sections = 1
let g:airline_section_warning = ''
let g:airline_section_x=''
let g:airline_section_z = airline#section#create(['%3p%% ', 'linenr', ':%c'])
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_min_count = 1   " show tabline only if there is more than 1 buffer
let g:airline#extensions#tabline#fnamemod = ':t'        " show only file name on tabs
let airline#extensions#coc#error_symbol = '✘:'
let airline#extensions#coc#warning_symbol = '⚠:'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = ''
let g:airline_symbols.branch = '⎇ '
let g:airline_symbols.dirty= ' >'







"Setting configs============================================ 
nmap <leader>e :Reload<cr>
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>
nmap qq        :bw<cr>
" NERDTree ==================================================






" " switch between splits using ctrl + {h,j,k,l}
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
noremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l




" toggle between buffers
nmap <tab> :bnext<cr>
nmap <S-Tab> :bprevious<cr>




" " tab config
set ts=2 sw=2 sts=2 expandtab
" set autoindent smarttab
" " set smartindent
" " set encoding=UTF-8
" set mouse=a
" set clipboard+=unnamed
set incsearch ignorecase smartcase hlsearch
set termguicolors
set cursorline 
set number
" set relativenumber
syntax enable
" " set list listchars=trail:»,tab:»-                       " use tab to navigate in list mode
" set fillchars+=vert:\▏                                  " requires a patched nerd font (try FiraCode)
" set wrap breakindent                                    " wrap long lines to the width set by tw
" set title                                               " tab title as file name
" set noshowmode                                          " dont show current mode below statusline
" set noshowcmd                                           " to get rid of display of last command
" set conceallevel=2                                      " so that it wont break indentation plugin
" set splitright                                          " open vertical split to the right
" set splitbelow                                          " open horizontal split to the bottom
" set tw=90                                               " auto wrap lines that are longer than that
" set emoji                                               " enable emojis
set history=500                                        " history limit
set backspace=indent,eol,start                          " sensible backspacing
set undofile                                            " enable persistent undo
set undodir=/tmp                                        " undo temp file directory
set foldlevel=0                                         " open all folds by default
set inccommand=nosplit                                  " visual feedback while substituting
set showtabline=2                                       " always show tabline
" " set cursorline


" performance tweaks
" set nocursorline
set nocursorcolumn
set lazyredraw
set redrawtime=10000
set synmaxcol=180
set re=1
set signcolumn=yes








" Highlighting stuff
hi CursorLineNr gui=bold guifg=#b16286
	" make relative number bold
hi Pmenu guibg='#00010a' guifg=white 
	" popup menu colors
hi Comment gui=italic cterm=italic 
	" italic comments
" hi Search guibg=#b16286 guifg=#ebdbb2 gui=NONE 
	" search string highlight color
hi NonText guifg=bg  
	" mask ~ on empty lines
" hi clear CursorLineNr 
	" use the theme color for relative number
hi SpellBad guifg=NONE gui=bold,undercurl
	" misspelled words



" coc multi cursor highlight color

" coc tab for completetion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" use a different register for delete using x
nnoremap x "_x


autocmd CursorHold * silent call CocActionAsync('highlight')   " highlight match on cursor hold


" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif


" disable hl with 2 esc
noremap <silent><esc> <esc>:noh<CR><esc>















