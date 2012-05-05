set nocompatible
source $VIMRUNTIME/vimrc_example.vim
set number
set nobackup       
set nowritebackup  
set noswapfile     
set smartindent
set nohlsearch
set term=xterm
set copyindent
set tabstop=2
set shiftwidth=2
set expandtab



if exists('+autochdir')
  set autochdir
else
  autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
endif

"set spell spelllang=en_us spellfile=~/.vim/dict.add
set pdev=main
inoremap <S-Tab> <Esc>
colorscheme elflord
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

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

:filetype plugin on 

" Highlight lines longer than 80 with F5. Have to enable highlight
map <F5> /\%>80v.\+<Enter>
