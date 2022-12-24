local mark = require'harpoon.mark'
local ui = require'harpoon.ui'
local nnoremap = require'me.keymap'.nnoremap


nnoremap('<C-a>', mark.add_file)
nnoremap('<C-q>', ui.toggle_quick_menu)
nnoremap('<C-H>', function () ui.nav_file(1) end)
nnoremap('<C-J>', function () ui.nav_file(2) end)
nnoremap('<C-K>', function () ui.nav_file(3) end)
nnoremap('<C-L>', function () ui.nav_file(4) end)






