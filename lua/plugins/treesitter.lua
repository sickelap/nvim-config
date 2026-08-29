---@type LazySpec
return {
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
}
