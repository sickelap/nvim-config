---@type LazySpec
return {
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      -- change colorscheme
      colorscheme = "astrodark",
      folding = {
        enabled = function(bufnr) return require("astrocore.buffer").is_valid(bufnr) end,
        methods = { "lsp", "treesitter", "indent" },
      },
      -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
      highlights = {
        init = { -- this table overrides highlights in all themes
          DiagnosticVirtualTextHint = { fg = "#888888" },
          LspInlayHint = { fg = "#777777", italic = true },
        },
        astrodark = { -- a table of overrides/changes when applying the astrotheme theme
          Comment = { fg = "#6A9955", italic = true },

          -- unused variables
          DiagnosticUnnecessary = { fg = "#898989" }, -- legacy
          DiagnosticUnused = { fg = "#898989" },
          -- visual = { bg = "#563453", fg = "#CCCCCC" },
          visual = { bg = "#242f3c", fg = "#DDDDDD" },
        },
      },
      -- Icons can be configured throughout the interface
      icons = {
        -- configure the loading of the lsp in the status line
        LSPLoading1 = "⠋",
        LSPLoading2 = "⠙",
        LSPLoading3 = "⠹",
        LSPLoading4 = "⠸",
        LSPLoading5 = "⠼",
        LSPLoading6 = "⠴",
        LSPLoading7 = "⠦",
        LSPLoading8 = "⠧",
        LSPLoading9 = "⠇",
        LSPLoading10 = "⠏",
      },
    },
  },

  {
    "dstein64/nvim-scrollview",
  },

  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts.dashboard = opts.dashboard or {}
      opts.dashboard.preset = opts.dashboard.preset or {}
      opts.dashboard.preset.header = ""

      opts.picker = opts.picker or {}

      -- Global picker formatting
      opts.picker.formatters = opts.picker.formatters or {}
      opts.picker.formatters.file = vim.tbl_deep_extend("force", opts.picker.formatters.file or {}, {
        -- filename_first = true,
        filename_only = true,
      })

      -- Make LSP definition picker use basename in list, path in preview title
      opts.picker.sources = opts.picker.sources or {}
      opts.picker.sources.files = {
        preview = function(ctx)
          Snacks.picker.preview.file(ctx)
          local path = Snacks.picker.util.path(ctx.item)
          if path then ctx.preview:set_title(vim.fn.fnamemodify(path, ":p:.")) end
        end,
      }

      opts.picker.sources.git_files = {
        preview = function(ctx)
          Snacks.picker.preview.file(ctx)
          local path = Snacks.picker.util.path(ctx.item)
          if path then ctx.preview:set_title(vim.fn.fnamemodify(path, ":p:.")) end
        end,
      }

      opts.picker.sources.lsp_definitions = vim.tbl_deep_extend("force", opts.picker.sources.lsp_definitions or {}, {
        format = "file",
        preview = function(ctx)
          Snacks.picker.preview.file(ctx)
          local path = Snacks.picker.util.path(ctx.item)
          if path then ctx.preview:set_title(vim.fn.fnamemodify(path, ":p:.")) end
        end,
      })
    end,
  },
}
