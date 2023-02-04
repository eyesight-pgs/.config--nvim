local nnoremap = require("me.keymap").nnoremap;
local vnoremap = require("me.keymap").vnoremap;
local xnoremap = require("me.keymap").xnoremap;

nnoremap("ga", "<Plug>(EasyAlign)");
vnoremap("ga", "<Plug>(EasyAlign)");
xnoremap("ga", "<Plug>(EasyAlign)");

-- markdown table align
nnoremap("<leader>mta", "vip:EasyAlign*|<CR>")

