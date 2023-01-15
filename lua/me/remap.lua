local nnoremap = require("me.keymap").nnoremap
local vnoremap = require("me.keymap").vnoremap
local inoremap = require("me.keymap").inoremap
local tnoremap = require("me.keymap").tnoremap

-- use following help section to know the key codes
-- :help key-notation

nnoremap("<leader>a", "<Esc>")
inoremap("<leader>a", "<Esc>")
vnoremap("<leader>a", "<Esc>")

inoremap("<leader>ss", ";")

nnoremap("<leader>pv", "<cmd>Ex<CR>")

nnoremap("<leader>y", "\"+y") -- not working
vnoremap("<leader>y", "\"+y")
nnoremap("<leader>p", "\"+p")
inoremap("<leader>p", "<Esc>\"+pa")
tnoremap("<leader>y", "\"+y")
tnoremap("<leader>p", "\"+p")
nnoremap("Y", "yg$") -- yank till end of line

nnoremap("<C-d>", "<C-d>zz") -- keep cursor in middle
nnoremap("<C-u>", "<C-u>zz") -- keep cursor in middle
nnoremap("n", "nzzzv") -- during search, next item - keep cursor in the middle
nnoremap("N", "Nzzzv") -- during search, next item - keep cursor in the middle


nnoremap("<leader>w", ":w<cr>")
nnoremap("<leader>q", ":q<CR>")
inoremap("<leader>w", "<Esc>:w<CR>a")

inoremap("<leader>ee", "<Esc>:NvimTreeFocus<CR>")
inoremap("<leader>ew", "<Esc>:NvimTreeClose<CR>")
inoremap("<leader>er", "<Esc>:NvimTreeFindFile<CR>")

-- comment current line
-- corrently vim commentary plugin is used,
-- which by default provides few shortcuts:
-- gc<motion> - (un)comment based on motion
-- gcc - (un)comment single line

nnoremap("<leader>ee", ":NvimTreeFocus<CR>")
nnoremap("<leader>ew", ":NvimTreeClose<CR>")
nnoremap("<leader>er", ":NvimTreeFindFile<CR>")

-- do split
nnoremap("<leader>l", "<C-w>v")
nnoremap("<leader>j", "<C-w>s")

-- split resize
nnoremap("<A-H>", "<C-w><")
nnoremap("<A-L>", "<C-w>>")
nnoremap("<A-J>", "<C-w>-")
nnoremap("<A-K>", "<C-w>+")

-- move between splits
nnoremap("<A-h>", "<C-w>h")
nnoremap("<A-j>", "<C-w>j")
nnoremap("<A-k>", "<C-w>k")
nnoremap("<A-l>", "<C-w>l")

-- move view without moving cursor
-- nnoremap("<C-j>", "<C-e>")
-- nnoremap("<C-k>", "<C-y>")
-- inoremap("<C-j>", "<Esc><C-e>a")
-- inoremap("<C-k>", "<Esc><C-y>a")

-- horizontal scroll
nnoremap("L", "zl")
nnoremap("H", "zh")
-- nnoremap("J", "<C-e>")
-- nnoremap("K", "<C-y>")

-- move selected line up/down
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")
nnoremap("J", "v:m '>+1<CR>gv=gv<Esc>")
nnoremap("K", "v:m '<-2<CR>gv=gv<Esc>")


-- nnoremap("J", "mzJ`z") -- keeps cursor at the begining

-- control enter should add one blank line bellow
nnoremap("<C-Return>", "o<Esc>k")


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


-- source current file
nnoremap("<leader><leader>x", ":source %<CR>")
nnoremap("<leader><leader>X", ":source $XDG_CONFIG_HOME/nvim/init.lua<CR>")

-- DAP
nnoremap("<F5>", ":lua require 'dap'.continue()<CR>")
nnoremap("<F10>", ":lua require 'dap'.step_over()<CR>")
nnoremap("<F11>", ":lua require 'dap'.set_into()<CR>")
nnoremap("<F12>", ":lua require 'dap'.step_out()<CR>")
nnoremap("<leader>b", ":lua require 'dap'.toggle_breakpoint()<CR>")
nnoremap("<leader>B", ":lua require 'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
nnoremap("<leader>lp", ":lua require 'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
nnoremap("<leader>dr", ":lua require 'dap'.repl.open()<CR>")

nnoremap("<leader>du", ":lua require 'dapui'.toggle()<CR>")
nnoremap("<leader>da", ":lua require 'me.dap_helper'.attach()<CR>")


-- format buffer
nnoremap("<A-F>", function()
  vim.lsp.buf.format()
end)


-- nnoremap("<leader>cn", vim.cmd.cnext)
-- nnoremap("<leader>cn", vim.cmd.cnext)
-- nnoremap("<leader>lp", vim.cmd.lprev)
-- nnoremap("<leader>lp", vim.cmd.lprev)
--
nnoremap("<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
nnoremap("<leader>x", "<cmd>!chmod +x %<CR>")
nnoremap("<leader>X", "<cmd>!chmod -x %<CR>")


-- text objects
-- ...





