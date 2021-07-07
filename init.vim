let mapleader = ","

call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Lua functions
Plug 'nvim-lua/plenary.nvim'

" vim reload
Plug 'famiu/nvim-reload'

" vim comment lines
Plug 'tpope/vim-commentary'  

" Color theme
Plug 'hzchirs/vim-material'

" Airline
Plug 'vim-airline/vim-airline'

" foreign
Plug 'neoclide/coc.nvim', {'branch': 'release'}         " LSP and more
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }     " fzf itself
Plug 'junegunn/fzf.vim'                                 " fuzzy search integration
Plug 'honza/vim-snippets'                               " actual snippets
Plug 'Yggdroot/indentLine'                              " show indentation lines
Plug 'tpope/vim-liquid'                                 " liquid language support
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}  " better python
Plug 'mhinz/vim-startify'                               " cool start up screen
Plug 'tpope/vim-fugitive'                               " git support
Plug 'psliwka/vim-smoothie'                             " some very smooth ass scrolling
Plug 'christoomey/vim-tmux-navigator'                   " seamless vim and tmux navigation
Plug 'ryanoasis/vim-devicons'                 " pretty icons everywhere
Plug 'luochen1990/rainbow'                    " rainbow parenthesis
Plug 'gregsexton/MatchTag'                    " highlight matching html tags
Plug 'Jorengarenar/vim-MvVis'                 " move visual selection
Plug 'morhetz/gruvbox'                        " GruvBox colorScheme
" Plug 'prettier/vim-prettier', { 'do': 'yarn install' }


Plug 'lfv89/vim-interestingwords'             " highlight word
nnoremap <silent> <space>k :call InterestingWords('n')<cr>
vnoremap <silent> <space>k :call InterestingWords('v')<cr>
nnoremap <silent><esc><esc> :call UncolorAllWords()<cr>

nnoremap <silent> n :call WordNavigation(1)<cr>
nnoremap <silent> N :call WordNavigation(0)<cr>
let g:interestingWordsGUIColors = ['#FF7272', '#A4E57E','#8CCBEA', '#FFDB72',  '#FFB3FF', '#9999FF']





call plug#end()



" auto format
nmap ff :CocCommand prettier.formatFile<cr>
" nmap <C-I> :Prettier<cr>

" let g:prettier#autoformat = 1
" au BufWrite * :Autoformat



" Auto bracket pairs
" inoremap {<CR> {<CR>}<Esc>ko<tab>
" inoremap [<CR> [<CR>]<Esc>ko<tab>
" inoremap (<CR> (<CR>)<Esc>ko<tab>

" Html tag auto indent
inoremap <expr> <cr> 
   \   getline(".")[col(".")-2:col(".")-1]=="><" ? "<cr><esc>ko<tab>"
	 \ : getline(".")[col(".")-2:col(".")-1]=="{}" ? "<cr><esc>ko<tab>"
	 \ : getline(".")[col(".")-2:col(".")-1]=="()" ? "<cr><esc>ko<tab>"
	 \ : getline(".")[col(".")-2:col(".")-1]=="[]" ? "<cr><esc>ko"
   \ :                                             "<cr>"


" Builtin plugins
let loaded_netrw = 0                                    " diable netew

" Color theme Settings
" let g:material_style='oceanic'
" set background=dark

" colorscheme vim-material
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_sign_column   = 'bg0'


" Fuzzy
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }
let g:fzf_tags_command = 'ctags -R'

let $FZF_DEFAULT_OPTS = '--layout=reverse --inline-info'
let $FZF_DEFAULT_COMMAND = "rg --files --hidden --glob '!.git/**' --glob '!build/**' --glob '!.dart_tool/**' --glob '!.idea' --glob '!node_modules'"



" indentLine
let g:indentLine_char_list = ['▏', '¦', '┆', '┊']
let g:indentLine_setColors = 0
let g:indentLine_setConceal = 0                         " actually fix the annoying markdown links conversion
let g:indentLine_fileTypeExclude = ['startify']




" rainbow brackets
let g:rainbow_active = 1

" tmux navigator
let g:tmux_navigator_no_mappings = 1

" semshi settings
let g:semshi#error_sign	= v:false                       " let ms python lsp handle this




" Airline
let g:airline_theme='material'
let g:airline_skip_empty_sections = 1
let g:airline_section_warning = ''
let g:airline_section_x=''
let g:airline_section_z = airline#section#create(['%3p%% ', 'linenr', ':%c'])
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_min_count = 2   " show tabline only if there is more than 1 buffer
let g:airline#extensions#tabline#fnamemod = ':t'        " show only file name on tabs
let airline#extensions#coc#error_symbol = '✘:'
let airline#extensions#coc#warning_symbol = '⚠:'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = ''
let g:airline_symbols.branch = '⎇ '
let g:airline_symbols.dirty= ''






"" startify





" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]







let g:startify_padding_left = 10
let g:startify_session_persistence = 1
let g:startify_enable_special = 0
let g:startify_change_to_vcs_root = 1
let g:startify_lists = [
    \ { 'type': 'dir'       },
    \ { 'type': 'files'     },
    \ { 'type': 'sessions'  },
    \ { 'type': 'bookmarks' },
    \ { 'type': 'commands' },
    \ ]

" bookmark examples
let  g:startify_bookmarks =  [
    \ {'v': '~/.config/nvim'},
    \ {'d': '~/.dotfiles' }
    \ ]


" custom banner
" let g:startify_custom_header = [
"  \ '',
"  \ '                                                    ▟▙            ',
"  \ '                                                    ▝▘            ',
"  \ '            ██▃▅▇█▆▖  ▗▟████▙▖   ▄████▄   ██▄  ▄██  ██  ▗▟█▆▄▄▆█▙▖',
"  \ '            ██▛▔ ▝██  ██▄▄▄▄██  ██▛▔▔▜██  ▝██  ██▘  ██  ██▛▜██▛▜██',
"  \ '            ██    ██  ██▀▀▀▀▀▘  ██▖  ▗██   ▜█▙▟█▛   ██  ██  ██  ██',
"  \ '            ██    ██  ▜█▙▄▄▄▟▊  ▀██▙▟██▀   ▝████▘   ██  ██  ██  ██',
"  \ '            ▀▀    ▀▀   ▝▀▀▀▀▀     ▀▀▀▀       ▀▀     ▀▀  ▀▀  ▀▀  ▀▀',
"  \ '',
"  \ '',
"  \ '',
"  \]



" startify if no passed argument or all buffers are closed
augroup noargs
    " " startify when there is no open buffer left
    " autocmd BufDelete * if empty(filter(tabpagebuflist(), '!buflisted(v:val)')) | Startify | endif

    " open startify on start if no argument was passed
    autocmd VimEnter * if argc() == 0 | Startify | endif
augroup END

" fzf if passed argument is a folder
augroup folderarg
    " change working directory to passed directory
    autocmd VimEnter * if argc() != 0 && isdirectory(argv()[0]) | execute 'cd' fnameescape(argv()[0])  | endif

    " start startify (fallback if fzf is closed)
    autocmd VimEnter * if argc() != 0 && isdirectory(argv()[0]) | Startify  | endif

    " start fzf on passed directory
    autocmd VimEnter * if argc() != 0 && isdirectory(argv()[0]) | execute 'Files ' fnameescape(argv()[0]) | endif
augroup END




"Setting configs============================================ 
nmap <leader>e :Reload<cr>
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>
nmap qq        :bw<cr>
" NERDTree ==================================================
nmap <space>s  :NERDTreeToggle<cr>
nmap ml        :vertical sb<cr>

" Startify
nmap <F6>      :Startify<cr>


" NERDTree configs
let g:NERDTreeIgnore = ['^node_modules$']           " Ignore node_modules folder



" Exit Vim if NERDTree is the only window left.
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
"     \ quit | endif









" switch between splits using ctrl + {h,j,k,l}
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
noremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" disable hl with esc
noremap <silent><esc> :noh<CR><esc>


" fugitive mappings
nmap <leader>gd :Gvdiffsplit<CR>
nmap <leader>gb :Git blame<CR>


" fzf
nmap <space>f :Files<cr>

" toggle between buffers
nmap <tab> :bnext<cr>
nmap <S-Tab> :bprevious<cr>

" coc mapings

" GoTo code navigation.
nmap <silent> gd :call CocAction('jumpDefinition', 'split')<CR> 
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)





" tab config
set ts=2 sw=2 sts=2 expandtab
" set autoindent smarttab
" set smartindent
set mouse=a
set clipboard+=unnamed
set incsearch ignorecase smartcase hlsearch
set termguicolors
set number
set relativenumber
syntax enable
set list listchars=trail:»,tab:»-                       " use tab to navigate in list mode
set fillchars+=vert:\▏                                  " requires a patched nerd font (try FiraCode)
set wrap breakindent                                    " wrap long lines to the width set by tw
set number                                              " enable numbers on the left
set relativenumber                                      " current line is 0
set title                                               " tab title as file name
set noshowmode                                          " dont show current mode below statusline
set noshowcmd                                           " to get rid of display of last command
set conceallevel=2                                      " so that it wont break indentation plugin
set splitright                                          " open vertical split to the right
set splitbelow                                          " open horizontal split to the bottom
set tw=90                                               " auto wrap lines that are longer than that
set emoji                                               " enable emojis
set history=1000                                        " history limit
set backspace=indent,eol,start                          " sensible backspacing
set undofile                                            " enable persistent undo
set undodir=/tmp                                        " undo temp file directory
set foldlevel=0                                         " open all folds by default
set inccommand=nosplit                                  " visual feedback while substituting
set showtabline=2                                       " always show tabline
set cursorline


" performance tweaks
" set nocursorline
set nocursorcolumn
set lazyredraw
set redrawtime=10000
set synmaxcol=180
set re=1






"coc


" vscode style code completion with tab
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'


" required by coc
set hidden
set nobackup
set nowritebackup
set cmdheight=1
set updatetime=300
set shortmess+=c
set signcolumn=yes







" Highlighting stuff
hi CursorLineNr gui=bold         
	" make relative number bold
hi Pmenu guibg='#00010a' guifg=white 
	" popup menu colors
hi Comment gui=italic cterm=italic 
	" italic comments
hi Search guibg=#b16286 guifg=#ebdbb2 gui=NONE 
	" search string highlight color
hi NonText guifg=bg  
	" mask ~ on empty lines
" hi clear CursorLineNr 
	" use the theme color for relative number
hi SpellBad guifg=NONE gui=bold,undercurl
	" misspelled words


" colors for git (especially the gutter)
hi DiffAdd  guibg=#0f111a guifg=#43a047
hi DiffChange guibg=#0f111a guifg=#fdd835
hi DiffRemoved guibg=#0f111a guifg=#e53935


" coc multi cursor highlight color
hi CocCursorRange guibg=#b16286 guifg=#ebdbb2




" use a different register for delete using x
nnoremap x "_x


" autocmd CursorHold * silent call CocActionAsync('highlight')
" au CursorHold * silent call CocActionAsync('highlight') " highlight match on cursor hold


" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif


" disable hl with 2 esc
noremap <silent><esc> <esc>:noh<CR><esc>















