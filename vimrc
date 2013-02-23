source $VIMRUNTIME/vimrc_example.vim
set nocompatible
set number
set nobackup       
set nowritebackup  
set nohlsearch
set term=xterm
set tabstop=4
set shiftwidth=4
set expandtab
set showcmd
set ruler
set incsearch
set rnu
set textwidth=80
filetype plugin indent on
syntax enable

" Underline the current line
set cursorline

" Swap visual mode and visual line commands
nnoremap v V
nnoremap V v
vnoremap v V
vnoremap V v

" Activate backspace
set backspace=indent,eol,start

if exists('+autochdir')
  set autochdir
else
  autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
endif

colorscheme desert

highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10


au BufNewFile,BufRead *.module set filetype=php
au BufNewFile,BufRead *.install set filetype=php
au BufNewFile,BufRead *.inc set filetype=php
au BufNewFile,BufRead *.md set filetype=txt

filetype plugin on 

" Highlight lines longer than 80 with F5. Have to enable highlight
map <F5> /\%>80v.\+<Enter>

" Yank the last blogimg call on the current line. Useful for article writing
map <F4> mlG?blogimg<Enter>yy'lP/\d<Enter>

" Insert timestamp
nmap <F3> a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

" use Ctrl+L to toggle the line number counting method
function! g:ToggleNuMode()
  if &nu == 1
     set rnu
  else
     set nu
  endif
endfunction
nnoremap <silent><C-L> :call g:ToggleNuMode()<cr>

"Use TAB to complete when typing words, else inserts TABs as usual.
"Uses dictionary and source files to find matching words to complete.

"See help completion for source,
"Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
"Use the Linux dictionary when spelling is in doubt.
"Window users can copy the file to their machine.
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

" Make CtrlP open files in new tabs
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }


" No visual bell!!!
set visualbell
set t_vb=

" Move Backup Files to ~/.vim/sessions
set backupdir=~/.vim/sessions
set dir=~/.vim/sessions

" Easymotion shortcuts
map <C-O> <Leader><Leader>w
map <C-E> <Leader><Leader>W
map f <Leader><Leader>f
