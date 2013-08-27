" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

filetype off " required!

" ========================================================================
" Vundle stuff
" ========================================================================

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle (required)! 
Bundle 'gmarik/vundle'

Bundle 'ack.vim'
Bundle 'ag.vim'
Bundle 'ctrlp.vim'
Bundle 'lukerandall/haskellmode-vim'
Bundle 'jshint.vim'
Bundle 'rename.vim'
Bundle 'scrooloose/syntastic'
Bundle 'godlygeek/tabular'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-haml'
Bundle 'nono/vim-handlebars'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-repeat'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'mattn/zencoding-vim'
Bundle 'bling/vim-airline'
" Bundle 'marijnh/tern_for_vim'
Bundle 't9md/vim-ruby_eval'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'tpope/vim-eunuch'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'thoughtbot/vim-rspec'
 
" Themes
Bundle 'tpope/vividchalk.vim'
Bundle 'chriskempson/base16-vim'
Bundle 'eoin-tomorrow-theme'
" 

" ========================================================================
" vim-airline
" ========================================================================
let g:airline_enable_syntastic=1

" let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'

" let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'

" let g:airline_linecolumn_prefix = '␊ '
let g:airline_linecolumn_prefix = '␤ '
" let g:airline_linecolumn_prefix = '¶ '

let g:airline_fugitive_prefix = '⎇ '

let g:airline_paste_symbol = 'ρ'
" let g:airline_paste_symbol = 'Þ'
" let g:airline_paste_symbol = '∥'

" change the theme (available options: dark, light, simple, badwolf)
let g:airline_theme='dark'

" * enable/disable usage of patched powerline font symbols
" let g:airline_powerline_fonts=1
" ========================================================================
" General stuff
" ========================================================================

filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" Hey Vim, .md files are Markdown not Modula2 mmkay?
au BufRead,BufNewFile *.md set filetype=markdown

set smartindent
set autoindent
set number

" This is sorta nice but slow in terminal vim
set relativenumber
" au FocusLost * :set number
" au FocusGained * :set relativenumber
" autocmd InsertEnter * :set number
" autocmd InsertLeave * :set relativenumber

" Switch syntax highlighting on
syntax on

" turn on 256 colors in terminal on dark background
set t_Co=256

" set background=dark
" colorscheme base16-default
" colorscheme vividchalk

colorscheme Tomorrow-Night-Bright

" Use unix line endings and encode files as UTF-8
set encoding=utf-8
set fileformat=unix

" do smarter searching
set ignorecase
" be case sensitive if the search term has multiple cases
set smartcase

" Set the terminal title
" set title

" Set region to NZ English
set spelllang=en_nz

" set tab and indents 
set shiftwidth=2 
set softtabstop=2 
set tabstop=2 
set shiftround 
set expandtab
" " Show hidden characters 
set list

" Use the same symbols as TextMate for tabstops and EOLs as they are lovely
set listchars=tab:▸\ ,eol:¬

" Set the tag file search order
" set tags=./tags;

" Use _ as a word-separator
" set iskeyword-=_

set hlsearch

set backupdir=~/.tmp
set directory=~/.tmp " Don't clutter my dirs up with swp and tmp files

" Get rid of the delay when hitting esc!
set noesckeys

" Highlight the status line
highlight StatusLine ctermfg=blue ctermbg=yellow

" Ctrlp
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_max_height = 10 

" MacVim
" ======
set guifont=Monaco:h12

" ==========================================================
" Statusline Control
" ==========================================================

" Make status line visible in all buffers
set laststatus=2

set statusline+=%m
set statusline+=%r
set statusline+=%y
set statusline+=[buffer\ 
set statusline+=%n
set statusline+=]
set statusline+=[
set statusline+=%t
set statusline+=]
set statusline+=\ 
set statusline+=[
set statusline+=row\ %l/%L
set statusline+=\ (%p%%)
set statusline+=,\ 
set statusline+=col\ %v\ (%c)
set statusline+=]
" set statusline+=%{fugitive#statusline()}

" try auto formatting paragraphs
" set formatoptions+=a
" try auto hiding buffers
set hidden

" I prefer if help opens in a new tab
cabbrev help tab help

set showtabline=2  " Always show the tabline

set tabline=%!MyTabLine()  " custom tab pages line

if exists(":Tabularize")
  " clashes with my test runner shortcut
  " nmap <Leader>a= :Tabularize /=<CR>
  " vmap <Leader>a= :Tabularize /=<CR>
  " nmap <Leader>a: :Tabularize /:<CR>
  " vmap <Leader>a: :Tabularize /:<CR>
  " same thing but it only aligns the stuff on the RHS of the :
  " nmap <Leader>a: :Tabularize /:\zs<CR>
  " vmap <Leader>a: :Tabularize /:\zs<CR>
endif

" Command-T
let g:CommandTMaxHeight=15

set wildignore+=node_modules/** " for node projects
set wildignore+=tmp/** " for rails projects
set wildignore+=.git " ignore git repo
set wildignore+=*.jpg,*.png,*.o,*.pdf,*.gif,Thumbs.db,*.sqlite3 " ignore common binary files

" Abolish Plugin
" **************

if exists(":Abolish")
  :Abolish teh the " corrects teh|Teh|TEH
  :Abolish lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum
end

" Abolish afterword{,s}                         afterward{}
" Abolish anomol{y,ies}                         anomal{}
" Abolish austrail{a,an,ia,ian}                 austral{ia,ian}
" Abolish cal{a,e}nder{,s}                      cal{e}ndar{}
" Abolish {c,m}arraige{,s}                      {}arriage{}
" Abolish {,in}consistan{cy,cies,t,tly}         {}consisten{}
" Abolish delimeter{,s}                         delimiter{}
" Abolish {,non}existan{ce,t}                   {}existen{}
" Abolish despara{te,tely,tion}                 despera{}
" Abolish d{e,i}screp{e,a}nc{y,ies}             d{i}screp{a}nc{}
" Abolish euphamis{m,ms,tic,tically}            euphemis{}
" Abolish hense                                 hence
" Abolish {,re}impliment{,s,ing,ed,ation}       {}implement{}
" Abolish improvment{,s}                        improvement{}
" Abolish inherant{,ly}                         inherent{}
" Abolish lastest                               latest
" Abolish {les,compar,compari}sion{,s}          {les,compari,compari}son{}
" Abolish {,un}nec{ce,ces,e}sar{y,ily}          {}nec{es}sar{}
" Abolish {,un}orgin{,al}                       {}origin{}
" Abolish persistan{ce,t,tly}                   persisten{}
" Abolish referesh{,es}                         refresh{}
" Abolish {,ir}releven{ce,cy,t,tly}             {}relevan{}
" Abolish rec{co,com,o}mend{,s,ed,ing,ation}    rec{om}mend{}
" Abolish reproducable                          reproducible
" Abolish resouce{,s}                           resource{}
" Abolish restraunt{,s}                         restaurant{}
" Abolish seperat{e,es,ed,ing,ely,ion,ions,or}  separat{}
" Abolish segument{,s,ed,ation}                 segment{}
" Abolish scflead     supercalifragilisticexpialidocious
" Abolish Tqbf        The quick, brown fox jumps over the lazy dog

" ==========================================================
" Experimental Stuff
" ==========================================================
" experimental thing which is supposed to speed up vim with ruby files
" let g:ruby_path = system('rvm current')

" Automatically reread files that have been changed externally
set autoread

" don't move the cursor after pasting
" " (by jumping to back start of previously changed text)
noremap p p`[
noremap P P`[
"
" " Reselect visual block after indent/outdent
" this seems to break .. for indenting
" vnoremap < <gv
" vnoremap > >gv

set winwidth=80
" Use silver-searcher for ctrl-p
let g:ctrlp_user_command = 'ag --nogroup --nobreak --noheading --nocolor -g "" %s '

source ~/.vim/functions.vim
source ~/.vim/aliases.vim 
