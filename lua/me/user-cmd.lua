
vim.api.nvim_create_user_command("PrintHello", function ()
  print("hello")
end, {})

