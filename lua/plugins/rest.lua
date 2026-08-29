return {
  {
    "lima1909/resty.nvim",
    config = function()
      if vim.fn.executable "kulala-ls" == 0 then
        vim.notify("Installing kulala-ls...", vim.log.levels.INFO)
        vim.system({ "npm", "install", "-g", "@mistweaverco/kulala-ls" }, { text = true }, function(obj)
          if obj.code == 0 then
            vim.notify "kulala-ls installed. Restart nvim."
          else
            vim.notify("kulala-ls installation failed:\n" .. obj.stderr, vim.log.levels.ERROR)
          end
        end)
      end
    end,
  },

  {
    "AstroNvim/astrolsp",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers = require("astrocore").list_insert_unique(opts.servers, { "kulala_ls" })
      opts.config = opts.config or {}
      opts.config.kulala_ls = opts.config.kulala_ls or {}
      return opts
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
        end,
      })

      return opts
    end,
  },
}
