return {
  "lewis6991/hover.nvim",
  setup = function(_, opts)
    opts.providers = {
      "hover.providers.diagnostic",
      "hover.providers.lsp",
      "hover.providers.dap",
      -- Optional
      -- "hover.providers.gh",
      -- "hover.providers.gh_user",
      -- "hover.providers.jira",
      -- "hover.providers.fold_preview",
      -- "hover.providers.highlight",
    }
    opts.preview_opts = {
      border = "single",
    }
    -- Whether the contents of a currently open hover window should be moved
    -- to a :h preview-window when pressing the hover keymap.
    -- preview_window = false,
    -- title = true,
    -- mouse_providers = {
    --   "hover.providers.diagnostic",
    -- },
    opts.mouse_delay = 1000

    -- Setup keymaps
    vim.keymap.set("n", "K", function() require("hover").open() end, { desc = "hover.nvim (open)" })
    vim.keymap.set("n", "gK", function() require("hover").enter() end, { desc = "hover.nvim (enter)" })
    vim.keymap.set(
      "n",
      "<C-p>",
      function() require("hover").switch "previous" end,
      { desc = "hover.nvim (previous source)" }
    )
    vim.keymap.set("n", "<C-n>", function() require("hover").switch "next" end, { desc = "hover.nvim (next source)" })

    -- Mouse support
    vim.keymap.set("n", "<MouseMove>", function() require("hover").mouse() end, { desc = "hover.nvim (mouse)" })
    vim.o.mousemoveevent = true
  end,
}
