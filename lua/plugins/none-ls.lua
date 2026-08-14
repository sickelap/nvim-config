---@type LazySpec
return {
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      opts.handlers = opts.handlers or {}

      opts.handlers.vacuum = function(source_name, methods)
        local null_ls = require "null-ls"

        local function is_openapi_buffer(params)
          local filename = params.bufname or ""
          if filename:match "[Oo]pen[Aa][Pp][Ii]" or filename:match "[Ss]wagger" then return true end

          local bufnr = params.bufnr or vim.api.nvim_get_current_buf()
          local lines = vim.api.nvim_buf_get_lines(bufnr, 0, 80, false)
          local header = table.concat(lines, "\n")

          return header:match "\n?openapi:%s*[%d%.]+" ~= nil or header:match "\n?swagger:%s*['\"]?[%d%.]+" ~= nil
        end

        for _, method in ipairs(methods) do
          local builtin = null_ls.builtins[method] and null_ls.builtins[method][source_name]
          if builtin then null_ls.register(builtin.with { runtime_condition = is_openapi_buffer }) end
        end
      end
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      -- opts variable is the default configuration table for the setup function call
      -- local null_ls = require "null-ls"

      -- Check supported formatters and linters
      -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics

      -- Only insert new sources, do not replace the existing ones
      -- (If you wish to replace, use `opts.sources = {}` instead of the `list_insert_unique` function)
      opts.sources = require("astrocore").list_insert_unique(opts.sources, {
        -- Set a formatter
        -- null_ls.builtins.formatting.stylua,
        -- null_ls.builtins.formatting.prettier,
      })
    end,
  },
}
