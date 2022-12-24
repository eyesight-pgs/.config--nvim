 require('telescope').setup{
   defaults = {
     -- Default configuration for telescope goes here:
     -- config_key = value,
     mappings = {
       i = {
         -- map actions.which_key to <C-h> (default: <C-/>)
         -- actions.which_key shows the mappings for your picker,
         -- e.g. git_{create, delete, ...}_branch for the git_branches picker
         ["<C-h>"] = "which_key"
       }
     }
   },
   pickers = {
     -- Default configuration for builtin pickers goes here:
     -- picker_name = {
     --   picker_config_key = value,
     --   ...
     -- }
     -- Now the picker_config_key will be applied every time you call this
     -- builtin picker
   },
   extensions = {
     -- Your extension configuration goes here:
     -- extension_name = {
     --   extension_config_key = value,
     -- }
     -- please take a look at the readme of the extension you want to configure
   }
 }

local builtin = require('telescope.builtin')
local nnoremap = require('me.keymap').nnoremap;

nnoremap("<leader>ff", builtin.find_files)
nnoremap('<leader>fg', builtin.live_grep, {})
nnoremap("<leader>gf", builtin.git_files)
nnoremap("<leader>pf", function()
  builtin.grep_string({search = vim.fn.input("Grep > ")})
end)
nnoremap('<leader>fb', builtin.buffers, {})
nnoremap('<leader>fh', builtin.help_tags, {})

