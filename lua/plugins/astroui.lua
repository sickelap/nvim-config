---@type LazySpec
return {
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      -- change colorscheme
      colorscheme = "astrodark",
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
}
