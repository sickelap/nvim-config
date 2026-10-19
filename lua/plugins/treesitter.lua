---@type LazySpec
return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      treesitter = {
        auto_install = true,
        highlight = true,
        indent = true,
        ensure_installed = {
          "bash",
          "c",
          "crystal",
          "dockerfile",
          "http",
          "jinja",
          "json",
          "json5",
          "lua",
          "luap",
          "make",
          "markdown",
          "markdown_inline",
          "php",
          "python",
          "query",
          "vim",
          "vimdoc",
          "yaml",
        },
      },
    },
  },
  {
    "andrius/crystal.nvim",
    dependencies = { "AstroNvim/astrocore" },
    ft = { "crystal", "ecr" },
    lazy = false,
    build = ":TSInstall! crystal",
    opts = {},
  },
}
