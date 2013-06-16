let mapleader=','

map <Leader>val :sp ~/.dotfiles/vim/aliases.vim<cr>
map <Leader>zal :sp ~/.dotfiles/zsh/aliases<cr>

map <Leader>ts :sp ~/tool-sharpening.md<cr>
map <Leader>in :sp ~/dropbox/ALLIB/Clients/Notes/TODO/inbox.md<cr>

" Run this file
map <leader>s :call RunTestFile()<cr>
" Run only the example under the cursor
map <leader>S :call RunNearestTest()<cr>
" Run all test files
map <leader>a :call RunTests('spec')<cr>

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

