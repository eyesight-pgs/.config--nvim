vim.api.nvim_exec(
[[
set nospell

" word wrap more excellently
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

" search options
set incsearch
set hlsearch
set ignorecase
set smartcase
set gdefault " replace option


" clone current tag to new split/tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" open panes same location as tmux
set splitbelow
set splitright


" my-grep
command! -nargs=+ -complete=dir -bar Grep lua require'me.my-grep'.asyncGrep(<q-args>)


]],
false
)
