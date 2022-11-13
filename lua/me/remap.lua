local nnoremap = require("me.keymap").nnoremap
local vnoremap = require("me.keymap").vnoremap
local inoremap = require("me.keymap").inoremap
local tnoremap = require("me.keymap").tnoremap

nnoremap("<leader>a", "<Esc>")
inoremap("<leader>a", "<Esc>")
vnoremap("<leader>a", "<Esc>")

inoremap("<leader>s", ";")

nnoremap("<leader>pv", "<cmd>Ex<CR>")

vnoremap("<leader>y", "\"+y")
nnoremap("<leader>p", "\"+p")
inoremap("<leader>p", "<Esc>\"+pa")
tnoremap("<leader>y", "\"+y")
tnoremap("<leader>p", "\"+p")


nnoremap("<leader>w", ":w<cr>")
nnoremap("<leader>q", ":q<CR>")
inoremap("<leader>w", "<Esc>:w<CR>a")

inoremap("<leader>ee", "<Esc>:NvimTreeFocus<CR>")
inoremap("<leader>ew", "<Esc>:NvimTreeClose<CR>")
inoremap("<leader>er", "<Esc>:NvimTreeFindFile<CR>")

-- comment current line
nnoremap("<leader>/", "I// <Esc>")
inoremap("<leader>/", "<C-o>0// ")


nnoremap("<leader>ee", ":NvimTreeFocus<CR>")
nnoremap("<leader>ew", ":NvimTreeClose<CR>")
nnoremap("<leader>er", ":NvimTreeFindFile<CR>")

-- do split
nnoremap("<leader>l", "<C-w>v")
nnoremap("<leader>j", "<C-w>s")

-- split resize
nnoremap("<A-h>", "<C-w><")
nnoremap("<A-l>", "<C-w>>")
nnoremap("<A-j>", "<C-w>-")
nnoremap("<A-k>", "<C-w>+")

-- debug
nnoremap("<F9>", ":lua require('dap').toggle_breakpoint()<CR>")
nnoremap("<F5>", ":lua require('dap').continue()<CR>")
nnoremap("<F10>", ":lua require('dap').set_over()<CR>")
nnoremap("<F11>", ":lua require('dap').set_into()<CR>")
nnoremap("<F12>", ":lua require('dap').set_out()<CR>")

-- markdown preview
nnoremap("<leader>mp", ":MarkdownPreviewToggle<CR>")

-- terminal
nnoremap("<leader>te", ":term<CR>")
inoremap("<leader>te", ":term<CR>")
tnoremap("<leader>a", "<C-\\><C-n>")
tnoremap("<leader>e", "<Esc>")

-- tabs
nnoremap("<Leader>nt", ":tabnew<CR>") -- new tab
nnoremap("<A-1>", ":tabn 1<CR>") -- go to tab 1
nnoremap("<A-2>", ":tabn 2<CR>")
nnoremap("<A-3>", ":tabn 3<CR>")
nnoremap("<A-4>", ":tabn 4<CR>")
nnoremap("<A-5>", ":tabn 5<CR>")
nnoremap("<A-6>", ":tabn 6<CR>")
nnoremap("<A-7>", ":tabn 7<CR>")
nnoremap("<A-8>", ":tabn 8<CR>")
nnoremap("<A-9>", ":tabn 9<CR>")
nnoremap("<leader>tac", ":tabnew<CR>") -- tab create
nnoremap("<leader>tan", ":tabnext<CR>") -- next
nnoremap("<leader>tap", ":tabprev<CR>") -- prev
nnoremap("<leader>taf", ":tabfirst<CR>") -- first

-- maximize current split
nnoremap("<A-m>", "<C-w><C-_><C-w><C-|>")

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})
vim.keymap.set('n', 'fh', builtin.help_tags, {})


-- source current file
nnoremap("<leader><leader>x", ":source %<CR>")


-- move between splits
-- nnoremap("<C-h>", "<C-w>h")
-- nnoremap("<C-j>", "<C-w>j")
-- nnoremap("<C-k>", "<C-w>k")
-- nnoremap("<C-l>", "<C-w>l")

-- move view without moving cursor
-- nnoremap("<C-j>", "<C-e>")
-- nnoremap("<C-k>", "<C-y>")
-- inoremap("<C-j>", "<Esc><C-e>a")
-- inoremap("<C-k>", "<Esc><C-y>a")

-- horizontal scroll
nnoremap("<C-l>", "zl")
nnoremap("<C-h>", "zh")
inoremap("<C-l>", "zl")
inoremap("<C-h>", "zh")

-- control enter should add one blank line bellow
-- nnoremap("<C-<CR>>","o<Esc>k")






