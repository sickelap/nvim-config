return {
  {
    "AstroNvim/astrotheme",
    name = "astrotheme",
    config = function()
      require("astrotheme").setup({
        palette = "astrodark", -- or "astrolight"
      })
    end,
  },
  {
    "akinsho/bufferline.nvim",
    optional = true,
    opts = function(_, opts)
      if (vim.g.colors_name or ""):find("astrotheme") then
        opts.highlights = require("astrotheme.special.bufferline").get_theme()
      end
    end,
  },
}
