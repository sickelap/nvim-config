-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here
vim.diagnostic.config { virtual_text = false, underline = false }

vim.keymap.set(
  "n",
  "<leader>D",
  function() vim.diagnostic.open_float(nil, { focus = false }) end,
  { desc = "Show Diagnostocs" }
)
