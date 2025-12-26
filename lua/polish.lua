vim.keymap.set("n", "<leader>ga", "<cmd>CoAuthor<cr>", { desc = "Add Co-Autohor" })

local function CamelToKebab()
  local mode = vim.fn.mode()
  if mode == "v" or mode == "V" or mode == "\22" then
    vim.cmd [['<,'>s/\v([a-z0-9])([A-Z])/\1-\l\2/g]]
  else
    vim.cmd [[%s/\v([a-z0-9])([A-Z])/\1-\l\2/g]]
  end
end

vim.api.nvim_create_user_command(
  "CamelToKebab",
  CamelToKebab,
  { range = true, desc = "Convert camelCase → kebab-case" }
)

vim.lsp.config("rust_analyzer", {
  settings = {
    ["rust-analyzer"] = {
      cargp = {
        features = "all",
      },
      procMacro = {
        ignored = {
          leptos_macro = {
            "component",
            "server",
          },
        },
      },
    },
  },
})

vim.diagnostic.config { virtual_text = false }
vim.keymap.set(
  "n",
  "<leader>D",
  function() vim.diagnostic.open_float(nil, { focus = false }) end,
  { desc = "Show Diagnostocs" }
)
vim.keymap.set("n", "<leader>gn", "<cmd>Gitsigns next_hunk<cr>", { desc = "Next hunk" })
vim.keymap.set("n", "<leader>gp", "<cmd>Gitsigns prev_hunk<cr>", { desc = "Prev hunk" })

vim.keymap.set("v", "<C-Up>", "<cmd>m -2<cr>")
vim.keymap.set("v", "<C-Down>", "<cmd>m +1<cr>")
