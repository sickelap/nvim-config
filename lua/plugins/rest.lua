return {
  {
    "lima1909/resty.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    setup = function()
      vim.keymap.set({ "n", "v" }, "<leader>Rr", ":Resty run<CR>", { desc = "[R]esty [R]un request under the cursor" })
    end,
  },

  -- resty speciffic mappings
  {
    "AstroNvim/astrocore",
    opts = function(_, opts)
      local aug = vim.api.nvim_create_augroup("Resty", { clear = true })

      vim.api.nvim_create_autocmd("FileType", {
        group = aug,
        pattern = { "http" },
        callback = function(ev)
          local map = function(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { buffer = ev.buf, desc = desc, silent = true })
            vim.keymap.set("v", lhs, rhs, { buffer = ev.buf, desc = desc, silent = true })
          end

          map("<leader>rr", "<cmd>Resty run<cr>", "Run HTTP request")
          map("<leader>rl", "<cmd>Resty last<cr>", "Re-run last request")
          map("<leader>rf", "<cmd>Resty favorite<cr>", "Favorite")
          -- etc
        end,
      })

      return opts
    end,
  },
}
