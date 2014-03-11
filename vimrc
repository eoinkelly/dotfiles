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

Bundle 'kchmck/vim-coffee-script'
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
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-fugitive'
Bundle 'mattn/zencoding-vim'
Bundle 'bling/vim-airline'
" Bundle 'marijnh/tern_for_vim'
" Bundle 't9md/vim-ruby_eval'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'tpope/vim-eunuch'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'thoughtbot/vim-rspec'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
" Bundle 'https://github.com/hwartig/vim-seeing-is-believing'
Bundle 'bryanjswift/vim-rust'
 
" Themes
Bundle 'tpope/vividchalk.vim'
Bundle 'chriskempson/base16-vim'
Bundle 'eoin-tomorrow-theme'

"  Snippets
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'

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
au BufRead,BufNewFile *.md set textwidth=80

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
" ===================
set shiftwidth=2 " how many spaces autoindent should use when shifting in/out e.g. with << or >>
set softtabstop=2 " how many spaces to insert when you type 'Tab' character while editing
set tabstop=2 " how many spaces to insert when you type 'Tab'
set shiftround " round shifts to the nearest shiftwidth. Used by < and > commands
set expandtab " when the user types 'Tab' we really insert spaces
set list " Show hidden characters 

autocmd FileType markdown setlocal shiftwidth=4 tabstop=4 softtabstop=4 " markdown likes 4-space tabs

" Use the same symbols as TextMate for tabstops and EOLs as they are lovely
set listchars=tab:▸\ ,eol:¬

" Set the tag file search order
" set tags=./tags;

" Use _ as a word-separator
" set iskeyword-=_

set hlsearch

" set backupdir=~/.tmp
" set directory=~/.tmp " Don't clutter my dirs up with swp and tmp files

" Get rid of the delay when hitting esc!
set noesckeys

" Highlight the status line
highlight StatusLine ctermfg=blue ctermbg=yellow

" Ctrlp
" =====
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_max_height = 10 
" Use silver-searcher for ctrl-p
let g:ctrlp_user_command = 'ag --nogroup --path-to-agignore ~/.dotfiles/agignore --nobreak --noheading --nocolor -g "" %s '
let g:ctrlp_working_path_mode = 'c'


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
set wildignore+=bower_components/** " for front-end projects
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

" Setup tab bar colors
" this is the color of the whole tab bar
" ctermfg = background color of the whole tab bar
" ctermbg = the color of the "close" text on the RHS of tab bar
:hi TabLineFill ctermfg=59 ctermbg=White

" this is the currently selected tag name
:hi TabLine ctermfg=Blue ctermbg=Yellow

" this is the background behind all tab names
" and the foreground is the text color of non-selected tab names
" :hi TabLineSel ctermfg=Red ctermbg=Yellow
:hi TabLineSel ctermbg=254 ctermfg=Black


" https://github.com/hwartig/vim-seeing-is-believing
" nmap <buffer> <F5> <Plug>(seeing-is-believing-run)
" xmap <buffer> <F5> <Plug>(seeing-is-believing-run)
" imap <buffer> <F5> <Plug>(seeing-is-believing-run)
" 
" nmap <buffer> <F4> <Plug>(seeing-is-believing-mark)
" xmap <buffer> <F4> <Plug>(seeing-is-believing-mark)
" imap <buffer> <F4> <Plug>(seeing-is-believing-mark)


" set colorcolumn 80
" 
set mouse=a
" map <ScrollWheelUp> <C-Y>
" map <ScrollWheelDown> <C-E>

" Different cursor shapes in different modes (only works in iTerm2)
" * block cursor in normal mode, slim line cursor in insert mode
" * http://blog.roseman.org.uk/2012/02/04/improving-vim-terminal-development-environment/
" * added 2013-11-20
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" ==========================================================
" ==========================================================

runtime macros/matchit.vim " enable the matchit plugin

source ~/.vim/functions.vim
source ~/.vim/aliases.vim 
