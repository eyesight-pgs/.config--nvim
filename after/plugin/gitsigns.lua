local nnoremap =  require("me.keymap").nnoremap

require('gitsigns').setup {
  signs = {
    add          = { text = '│' },
    change       = { text = '│' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },
}

nnoremap("<leader>hpp", "<cmd>Gitsigns preview_hunk<CR>")
nnoremap("<leader>hpi", "<cmd>Gitsigns preview_hunk_inline<CR>")
nnoremap("<leader>hpd", "<cmd>Gitsigns toggle_deleted<CR>")
nnoremap("<leader>hf", "<cmd>Gitsigns refresh<CR>")
nnoremap("<leader>hl", "<cmd>Gitsigns select_hunk<CR>")
nnoremap("<leader>ho", "<cmd>Gitsigns show<CR>")
nnoremap("<leader>hd", "<cmd>Gitsigns diffthis<CR>")
nnoremap("<leader>hw", "<cmd>Gitsigns toggle_word_diff<CR>")
nnoremap("<leader>hr", "<cmd>Gitsigns reset_hunk<CR>")
nnoremap("<leader>hR", "<cmd>Gitsigns reset_buffer<CR>")
nnoremap("<leader>hh", "<cmd>Gitsigns next_hunk<CR>")
nnoremap("<leader>hH", "<cmd>Gitsigns prev_hunk<CR>")
nnoremap("<leader>hb", "<cmd>Gitsigns toggle_current_line_blame<CR>")
nnoremap("<leader>hss", "<cmd>Gitsigns stage_hunk<CR>")
nnoremap("<leader>hsu", "<cmd>Gitsigns undo_stage<CR>")
nnoremap("<leader>hsb", "<cmd>Gitsigns stage_buffer<CR>")


