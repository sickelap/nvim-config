return {
  {
    "lima1909/resty.nvim",
  },

  {
    "neovim/nvim-lspconfig",
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

      local lspconfig = require "lspconfig"
      if not lspconfig.configs.kulala_ls then
        lspconfig.configs.kulala_ls = {
          default_config = {
            cmd = { "kulala-ls" },
            filetypes = { "http" },
          },
        }
      end

      lspconfig.kulala_ls.setup {}
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
