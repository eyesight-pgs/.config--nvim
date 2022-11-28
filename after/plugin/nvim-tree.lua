
require("nvim-tree").setup({
  auto_reload_on_write = true,
  reload_on_bufenter = true,
  open_on_setup = false,
  open_on_setup_file = false,
  view = {
    side = "right",
  },
  filters = {
    dotfiles = false,
  },
  renderer = {
    indent_markers = {
      enable = false,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        none = " ",
      },
    },
  }
})

