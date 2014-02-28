" Use <TAB> as the mapping leader
  let mapleader='	'

set autoindent " Use indent from previous line
set number     " Enable line numbers
set hlsearch   " Highlight search results
set ignorecase " Ignore case for searches
set incsearch  " Incremental search
set smartcase  " Force case-sensitive matching when using upper-case in the pattern.

" Mark the textwidth
set colorcolumn=+1

" Clear our autogroup.
augroup vimrc
  autocmd!
augroup END

" CD to the file's directory upon opening.
augroup vimrc
  autocmd BufWinEnter * silent! lcd %:p:h
augroup END
nnoremap <Leader>cd :silent! lcd %:p:h<CR>:pwd<CR>

" Shortcuts to common options.
nnoremap <Leader>ft  :set filetype=
nnoremap <Leader>hls :nohlsearch<CR>
nnoremap <Leader>ic  :set ignorecase! ignorecase?<CR>

" Reload the current buffer.
nnoremap <F5> :edit!<CR>

" Edit/source .vimrc.
nnoremap <Leader>ev :edit $MYVIMRC<CR>
nnoremap <Leader>sv :split $MYVIMRC<CR>
nnoremap <Leader>.v :source $MYVIMRC<CR>

" Edit the syntax file for the current file.
function! OpenSyntaxFile(cmd)
  let l:syn_file_name = &filetype . '.vim'
  let l:syn_path = globpath(&runtimepath, l:syn_file_name, 1)
  if l:syn_path != ''
    execute a:cmd l:syn_path
  endif
endfunction
nnoremap <Leader>esyn :call OpenSyntaxFile('edit')<CR>
nnoremap <Leader>ssyn :call OpenSyntaxFile('edit')<CR>

" Open the selected link/document/etc.
function! s:InvokeItem(item)
  execute '!xdg-open' shellescape(a:item)
  redraw!
  echo a:item
endfunction
nnoremap <Leader>ii :call <SID>InvokeItem('<C-R>=expand('<cWORD>')<CR>')<CR>
vnoremap <Leader>ii :call <SID>InvokeItem('<C-R>*')<CR>

filetype indent plugin on
