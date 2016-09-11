" Sources:
" * https://github.com/garybernhardt/dotfiles/blob/master/.vimrc

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

filetype off " required!

" ========================================================================
" Vundle stuff
" ========================================================================

" To setup vundle on a new computer you need to follow https://github.com/VundleVim/Vundle.vim#quick-start

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" General
" =======
Plugin 'gmarik/Vundle.vim' " let Vundle manage Vundle (required)!
" Plugin 'terryma/vim-multiple-cursors'
Plugin 'osyo-manga/vim-over'
Plugin 'vim-scripts/renumber.vim'

Plugin 'elzr/vim-json'
Plugin 'vim-latex/vim-latex'
Plugin 'cakebaker/scss-syntax.vim'
" Plugin 'derekwyatt/vim-scala'
Plugin 'ack.vim'
Plugin 'othree/eregex.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'scrooloose/nerdtree'
Plugin 'ag.vim'
Plugin 'ctrlp.vim'
Plugin 'ElmCast/elm-vim'
Plugin 'scrooloose/syntastic'
Plugin 'junegunn/vim-easy-align'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-eunuch'
Plugin 'mattn/emmet-vim'
Plugin 'bling/vim-airline'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'michaeljsmith/vim-indent-object'
" Plugin 'rainerborene/vim-reek'

" Apiary blueprint files
Plugin 'kylef/apiblueprint.vim'

Plugin 'docker/docker' , {'rtp': '/contrib/syntax/vim/'}

" elixir
Plugin 'elixir-lang/vim-elixir'
Plugin 'slashmili/alchemist.vim'


" Postgres
Plugin 'exu/pgsql.vim'

" Idris
Plugin 'idris-hackers/idris-vim'

" ragel
" Plugin 'jneen/ragel.vim'

" haskell
Plugin 'lukerandall/haskellmode-vim'

" go
Plugin 'fatih/vim-go'

" clojure
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'guns/vim-clojure-static'

" javascript
" Plugin 'jshint.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx' " jsx, depends: vim-javascript
Plugin 'mustache/vim-mustache-handlebars'

" ruby
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'vim-ruby/vim-ruby'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-bundler'
Plugin 'kchmck/vim-coffee-script'

" rust
Plugin 'wting/rust.vim'
Plugin 'phildawes/racer'
Plugin 'cespare/vim-toml'

" cobol
Plugin 'fsouza/cobol.vim'

" swift
Plugin 'keith/swift.vim'

" Themes
Plugin 'chriskempson/base16-vim'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'tomasr/molokai'
Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'} " this theme has 24 bit color support

" Snippets
Plugin 'SirVer/ultisnips'        " snippet engine
Plugin 'honza/vim-snippets'      " the snippets

call vundle#end() " required
filetype plugin indent on

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ

" ========================================================================
" vim-airline
" ========================================================================
let g:airline#extensions#syntastic= 1
let g:airline#extensions#tabline#enabled = 1 " show buffers on tab line when there is only one tab
let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
let g:airline#extensions#quickfix#location_text = 'Location'

" Reference of what vim-airline has by default
" let g:airline_section_a       (mode, paste, iminsert)
" let g:airline_section_b       (hunks, branch)
" let g:airline_section_c       (bufferline or filename)
" let g:airline_section_gutter  (readonly, csv)
" let g:airline_section_x       (tagbar, filetype, virtualenv)
" let g:airline_section_y = (fileencoding, fileformat)
" let g:airline_section_z       (percentage, line number, column number)
" let g:airline_section_warning (syntastic, whitespace)

function! AirlineInit()
  let g:airline_section_z = airline#section#create_right(['l:%l c:%c (%p%%)'])
endfunction

autocmd User AirlineAfterInit call AirlineInit()
let g:airline_theme='dark' " dark, light, simple, badwolf

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '(paste)'
" let g:airline_symbols.paste = '∥'
" let g:airline_symbols.whitespace = 'Ξ'

set laststatus=2

" ========================================================================
" General stuff
" ========================================================================

filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" Markdown setup
" ==============
" Hey Vim, .md files are Markdown not Modula2 mmkay?
au BufRead,BufNewFile *.md,*.mdown,*.markdown set filetype=markdown
au BufRead,BufNewFile *.hdl set filetype=verilog
au BufRead,BufNewFile *.deface set filetype=eruby.html
au BufRead,BufNewFile *.hbs.erb set filetype=html.handlebars.eruby


au BufRead,BufNewFile *.m set filetype=objc

" au BufRead,BufNewFile *.md,*.mdown,*.markdown set textwidth=80
" autocmd FileType ghmarkdown setlocal shiftwidth=4 tabstop=4 softtabstop=4 " markdown likes 4-space tabs
autocmd FileType markdown setlocal shiftwidth=4 tabstop=4 softtabstop=4 " markdown likes 4-space tabs

" turn on spellchecking for markdown files by default
" autocmd FileType markdown setlocal spell

" NERDTree
" ========
let NERDTreeShowHidden = 1
" let NERDTreeRespectWildIgnore = 1
let NERDTreeIgnore=['\.swp$', '\.swo$', '\.DS_Store$', '\.sass-cache$']



set smartindent
set autoindent
set number

" show partially typed commands in command mode
set showcmd

" This is sorta nice but slow in terminal vim
" set relativenumber
" au FocusLost * :set number
" au FocusGained * :set relativenumber
" autocmd InsertEnter * :set number
" autocmd InsertLeave * :set relativenumber

" Switch syntax highlighting on
syntax on

" make backspace sane in insert me
set backspace=indent,eol,start


" Terminal Colorscheme
" ====================
set t_Co=256 " turn on 256 colors in terminal
set background=dark
" colorscheme Tomorrow-Night-Bright
" colorscheme dracula
" let macvim_skip_colorscheme=1

colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1


" Tweak the color scheme on terminal only
" highlight LineNr term=reverse cterm=reverse ctermfg=8 ctermbg=0
" highlight ColorColumn term=reverse cterm=reverse ctermfg=8 ctermbg=0
" highlight CursorLine ctermbg=1
" to fix:
" search highlighting,
" current line number
" tab bar
" :hi CursorLine ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html





" Use unix line endings and encode files as UTF-8
set encoding=utf-8
set fileformat=unix

" do smarter searching
set ignorecase
" be case sensitive if the search term has multiple cases
set smartcase
set incsearch

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
" set list " Show hidden characters


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

" Ctrlp
" =====
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_max_height = 10
" Use silver-searcher for ctrl-p
let g:ctrlp_user_command = 'ag --nogroup --path-to-agignore ~/.dotfiles/agignore --nobreak --noheading --nocolor -g "" %s '
let g:ctrlp_working_path_mode = 'ra'


" MacVim
" ======
" * replace spaces in font name with _
" * hXX is size in points
set guifont=Source_Code_Pro_Light:h14


" try auto formatting paragraphs
" set formatoptions+=a
" try auto hiding buffers
set hidden

" Rust racer
let g:racer_cmd = "/Users/eoinkelly/.vim/bundle/racer/target/release/racer"
let $RUST_SRC_PATH="/Users/eoinkelly/Code/rust/src/"

" Syntastic
" =========
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_scss_scss_lint_exec = "/Users/eoinkelly/.rbenv/versions/2.3.0/bin/scss-lint"

let g:syntastic_eruby_checkers = ['erb']

let g:syntastic_ruby_checkers = ['rubocop']
" hard-code path to rubocop for faster checking
" let g:syntastic_ruby_rubocop_exec = "/Users/eoinkelly/.rbenv/versions/2.3.1/bin/rubocop"

" let g:syntastic_ruby_checkers = ['mri'] " default

" let g:syntastic_elixir_checkers = ['elixir']
" let g:syntastic_enable_elixir_checker = 1

let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_checkers = ['jshint']
" let g:syntastic_javascript_checkers = ['eslint', 'jshint']

" Python has the following checkers, among others: flake8, pyflakes, pylint
" and a native python checker.
let g:syntastic_python_python_exec = '/usr/local/bin/python3'
let g:syntastic_python_checkers = ['pylint', 'python']

" Syntastic plugin for vim-airline is enabled. Changes to the status line go
" through that

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1

" Don't run syntastic when we open a file
let g:syntastic_check_on_open = 0

" Don't run syntastic when we :wq
let g:syntastic_check_on_wq = 0

let g:syntastic_enable_signs = 1
let g:syntastic_style_error_symbol = "✗"
let g:syntastic_style_warning_symbol = "⚠"
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

" let g:syntastic_java_javac_classpath = "/<path-to-your-app>/bin/classes\n/<path-to-your-android-sdk>/platforms/android-19/*.jar"
let g:syntastic_java_javac_classpath = "/Users/eoinkelly/Library/Android/sdk/platforms/android-19/*.jar"



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
  :Abolish taht that
  :Abolish th e the
  :Abolish jion join
  :Abolish waht what
  :Abolish somethign something
  :Abolish cna can
  :Abolish thign thing
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

" Setup tab bar colors
" this is the color of the whole tab bar
" ctermfg = background color of the whole tab bar
" ctermbg = the color of the "close" text on the RHS of tab bar
" :hi TabLineFill ctermfg=59 ctermbg=White

" this is the currently selected tag name
" :hi TabLine ctermfg=Blue ctermbg=Yellow

" this is the background behind all tab names
" and the foreground is the text color of non-selected tab names
" :hi TabLineSel ctermfg=Red ctermbg=Yellow
" :hi TabLineSel ctermbg=254 ctermfg=Black

" set cursorline

" https://github.com/hwartig/vim-seeing-is-believing
" nmap <buffer> <F5> <Plug>(seeing-is-believing-run)
" xmap <buffer> <F5> <Plug>(seeing-is-believing-run)
" imap <buffer> <F5> <Plug>(seeing-is-believing-run)
"
" nmap <buffer> <F4> <Plug>(seeing-is-believing-mark)
" xmap <buffer> <F4> <Plug>(seeing-is-believing-mark)
" imap <buffer> <F4> <Plug>(seeing-is-believing-mark)

" Configure browser for haskell_doc.vim
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"

" set colorcolumn=+1
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

" thoughtbot/vim-rspec
let g:rspec_command = "!bundle exec rspec {spec}"

if has("nvim")
  let g:rspec_command = "split | term bundle exec rspec {spec}"
endif

" ==========================================================
" ==========================================================

" Coffeescript
" ============
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable


" JSON
" ====
let g:vim_json_syntax_conceal = 0
autocmd BufNewFile,BufReadPost *.json setl foldmethod=syntax nofoldenable


" Objective C
" ============
autocmd FileType objc setlocal shiftwidth=4 tabstop=4 softtabstop=4 " markdown likes 4-space tabs

" Folding
" =======

set foldmethod=indent
" TODO: ideally I would set this to some "fold level max" value
set foldlevel=40




runtime macros/matchit.vim " enable the matchit plugin

source ~/.vim/functions.vim
source ~/.vim/aliases.vim

" Strip tailing whitespace
" nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>

" Autoformat the whole file (preserving cursor position)
" nmap _= :call Preserve("normal gg=G")<CR>

" Automatically strip trailing whitespace on save on all files
autocmd BufWritePre *.* :call Preserve("%s/\\s\\+$//e")


" use ,p as a "delete {thing} to blackhole register and the paste contents of
" default register"
" vnoremap <Leader>p "_dP

" wean myself off :b#
nnoremap <leader><leader> <c-^>

" Make %% expand (on the command line) into the containing path of the currently open buffer
" cnoremap %% <C-R>=expand('%:h').'/'<cr>

" %% becomes current filename with extension
cnoremap %% <C-R>=expand('%:t')<cr>


" over.vim
let g:over_enable_cmd_window = 1
let g:over_enable_auto_nohlsearch = 1
let g:over#command_line#search#enable_incsearch = 1

" https://github.com/junegunn/vim-easy-align
" ==========================================

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Ultisnip configuration
" ======================
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsListSnippets="<C-s>"

" configure handlebars plugin
let g:mustache_abbreviations = 0



" tComment stuff
" ==============
call tcomment#DefineType('handlebars', '{{!-- %s --}}')
call tcomment#DefineType('html.handlebars', '{{!-- %s --}}')

" Clojure stuff
" =============

" let g:alchemist_tag_disable = 1
" let g:alchemist_tag_map = '<C-]>'
" let g:alchemist_tag_stack_map = '<C-T>'
let g:alchemist#elixir_erlang_src = "~/Code/github.com/elixir-lang/elixir"


" Clojure stuff
" =============

" highlights nested parens in different colors
" Not sure I'm into this
" au VimEnter *.clj RainbowParenthesesToggle
" au Syntax *.clj RainbowParenthesesLoadRound
" au Syntax *.clj RainbowParenthesesLoadSquare
" au Syntax *.clj RainbowParenthesesLoadBraces

" ReactJS
" =======
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" Experimental stuff
" ==================

" magical resizing windows
" set winwidth=84
" set winheight=5
" set winminheight=5
" set winheight=999

" nvim stuff
" ==========

if has('nvim')
    tnoremap <Esc> <C-\><C-n>
    " tnoremap <A-h> <C-\><C-n><C-w>h
    " tnoremap <A-j> <C-\><C-n><C-w>j
    " tnoremap <A-k> <C-\><C-n><C-w>k
    " tnoremap <A-l> <C-\><C-n><C-w>l
    " nnoremap <A-h> <C-w>h
    " nnoremap <A-j> <C-w>j
    " nnoremap <A-k> <C-w>k
    " nnoremap <A-l> <C-w>l
endif

let g:terminal_scrollback_buffer_size = 10000 " Terminal scrollback buffer size

" go stuff
" =======
"
" let g:go_highlight_functions = 1
" let g:go_highlight_methods = 1
" let g:go_highlight_structs = 1
" let g:go_highlight_interfaces = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_build_constraints = 1

" let g:go_bin_path = expand("~/.vim-go-tools")

" let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
" let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" ruby reek
" =========
" let g:reek_always_show = 0
" let g:reek_on_loading = 0 " only check files on demand with :RunReek
