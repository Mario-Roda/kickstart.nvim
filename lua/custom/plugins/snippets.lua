-- lua/plugins/snippets.lua

-- 1. Register the snippet engine and the LaTeX snippet collection
vim.pack.add({
  { src = "https://github.com/L3MON4D3/LuaSnip", version = "v2.*" },
  { src = "https://github.com/iurimateus/luasnip-latex-snippets.nvim" },
})

-- 2. Configure LuaSnip
local ls = require("luasnip")

-- Enable autosnippets, which are essential for the Castel workflow
ls.config.setup({
  enable_autosnippets = true,
})

-- 3. Setup the LaTeX snippets collection
-- This uses VimTeX by default to detect if the cursor is in a math zone.
require("luasnip-latex-snippets").setup()

-- 4. (Optional) Load any custom snippets you define yourself
-- This tells LuaSnip to look for Lua snippet files in your config directory.
require("luasnip.loaders.from_lua").load({
  paths = { vim.fn.stdpath("config") .. "/lua/snippets" },
})

-- ==========================================
-- 5. KEYMAPS FOR JUMPING (Fixes the Tab issue)
-- ==========================================
vim.keymap.set({ "i", "s" }, "<Tab>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  else
    return "<Tab>"
  end
end, { expr = true, silent = true })

vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  else
    return "<S-Tab>"
  end
end, { expr = true, silent = true })
