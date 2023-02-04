
vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("myGrp", {clear = true}),
  pattern = ".bashrc",
  callback = function()
    print("working..");
  end
})

