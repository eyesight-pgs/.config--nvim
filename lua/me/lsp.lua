local capabilities = require("me/completion").capabilities

local function lspShortcuts()
  vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = 0}) -- 0 = current buffer
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = 0})
  vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, {buffer = 0})
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer = 0})
  vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", {buffer = 0})
  vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, {buffer = 0})
  vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, {buffer = 0})
  vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<CR>", {buffer = 0})
  vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer = 0})
  vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", {buffer=0})
end

require('lspconfig').clangd.setup{
  capabilities = capabilities,
  on_attach = function()
    print"conneceted to clangd"
    lspShortcuts()
  end,
}

require('lspconfig').gopls.setup{
  capabilities = capabilities,
  on_attach = function()
    print"conneceted to gopls"
    lspShortcuts()
  end,
}

require('lspconfig').tsserver.setup{
  capabilities = capabilities,
  on_attach= function()
    print("conneceted to tsserver")
    lspShortcuts()
  end,
}

require('lspconfig').html.setup{
  capabilities = capabilities,
  on_attach= function()
    print("conneceted to html")
   lspShortcuts()
  end,
}


require('lspconfig').sumneko_lua.setup{
  capabilities = capabilities,
  on_attach= function()
    print("conneceted to sumneko_lua")
    lspShortcuts()
  end,
}



