let mapleader=','

map <Leader>val :sp ~/.dotfiles/vim/aliases.vim<cr>
map <Leader>zal :sp ~/.dotfiles/zsh/aliases<cr>

" Rspec.vim mappings
map <Leader>s :call RunCurrentSpecFile()<CR>
map <Leader>S :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Map C-s to save because I sometimes use it by accident
map <C-s> :w<cr>
imap <C-s> <ESC>:w<cr>

nmap <Leader>t :CtrlP<CR>
nmap <Leader>b :CtrlPBuffer<CR>
nmap <Leader>m :CtrlPMRU<CR>

nnoremap <cr> :nohlsearch<cr> 

" Enable the learnin' stick!
" noremap h <NOP>
" noremap j <NOP>
" noremap k <NOP>
" noremap l <NOP

" Map C-j to run JSHint (FIXME: should run in .js files only)
map <C-j> :JSHint<CR>

