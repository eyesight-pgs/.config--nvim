local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local extras = require("luasnip.extras")
local m = extras.m
local l = extras.l
local rep = extras.rep
local postfix = require("luasnip.extras.postfix").postfix



-- require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/snippets/"})


ls.config.set_config({
  history = true,
  enable_autosnippets = true,
  ext_options = {
    [c] = {
      active = {
        virt_text = {{"<--"}}
      }
    }
  }
})


-- keymap
vim.keymap.set({"i","s"}, "<c-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, {silent=true})
vim.keymap.set({"i","s"}, "<c-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, {silent=true})
vim.keymap.set({"i","s"}, "<c-l>", function()
  if ls.choice_active() then
    ls.change_active(1)
  end
end, {silent=true})

-- resource snippet file
vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/after/plugin/snippet.lua<CR>")



-- old syntax
-- ls.snippets = {
--     all = {
--     },
-- }

-- new syntax
-- ls.add_snippets("all", {
--   s("expand", {t("-- this is the expanded text")})
-- })


-- for all files
ls.add_snippets("all", {
  s("expand", {t("-- this is the expanded text")})
})

-- for lua
ls.add_snippets("lua", {
  s("lf2", {
    t("local function "),
    i(1),
    t("()"),
    t('\n'),
    i(0),
    t(" end")
  }),
})

-- for typescript
ls.add_snippets("typescript", {
  s("ln", {
    t("console.log(`-------------------- "),
    i(0),
    t(" --------------------`);")

  })
})


