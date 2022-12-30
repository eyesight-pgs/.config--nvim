local result = vim.api.nvim_exec(
[[
set nocompatible
]],
true
)

-- vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.swapfile = false
vim.opt.backup = false

local home_env_name = "HOME"
if vim.loop.os_uname().sysname == 'Windows_NT' then
  home_env_name = "USERPROFILE"
end
vim.opt.undodir = os.getenv(home_env_name) .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.colorcolumn = "80"

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.showmode = false

vim.g.mapleader = ";"

