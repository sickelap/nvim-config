vim.diagnostic.config { virtual_text = false }
vim.keymap.set(
  "n",
  "<leader>D",
  function() vim.diagnostic.open_float(nil, { focus = false }) end,
  { desc = "Show Diagnostocs" }
)

-- vim.keymap.set("v", "<C-Up>", "<cmd>m -2<cr>")
-- vim.keymap.set("v", "<C-Down>", "<cmd>m +1<cr>")
