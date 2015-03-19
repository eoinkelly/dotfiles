" D = command key (macvim only, does not work in terminal vim)
" M = option/alt key
" C = control key
"
let mapleader=','

map <Leader>val :sp ~/.dotfiles/vim/aliases.vim<cr>
map <Leader>zal :sp ~/.dotfiles/zsh/aliases<cr>

" Rspec.vim mappings
map <Leader>S :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
map <Leader>o :OverCommandLine<CR>

" Map C-s to save because I sometimes use it by accident
map <C-s> :w<cr>
imap <C-s> <ESC>:w<cr>

nmap <Leader>t :CtrlP<CR>
nmap <Leader>b :CtrlPBuffer<CR>
nmap <Leader>m :CtrlPMRU<CR>

nmap <Leader>r :NERDTreeToggle<CR>
nnoremap <cr> :nohlsearch<cr>

" Practical Vim tip #80
" Make C-l clear search highlighting as well as clear screen
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>


" Enable the learnin' stick!
" noremap h <NOP>
" noremap j <NOP>
" noremap k <NOP>
" noremap l <NOP

" Map C-j to run JSHint (FIXME: should run in .js files only)
map <C-j> :JSHint<CR>

imap Q: QUESTION:
imap T: TODO:
