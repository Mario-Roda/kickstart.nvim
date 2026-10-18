vim.keymap.set('n', '<leader>n', '<cmd>tabnew<cr>' , {desc = 'Open [N]ew tab'})
vim.keymap.set('n', '<leader>c', '<cmd>tabclose<cr>' , {desc = '[C]lose tab'})

-- ==========================================
-- Snipets
-- ==========================================

-- Keymaps for expanding and jumping through snippets
vim.keymap.set({ "i", "s" }, "<C-j>", function()
  local luasnip = require("luasnip")
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  else
    -- If not expandable, fall back to the default behavior of the key
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-j>", true, false, true), "m", false)
  end
end, { silent = true, desc = "Expand or jump forward in snippet" })

vim.keymap.set({ "i", "s" }, "<C-k>", function()
  local luasnip = require("luasnip")
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-k>", true, false, true), "m", false)
  end
end, { silent = true, desc = "Jump backward in snippet" })
