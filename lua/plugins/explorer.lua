return {
  {
    "stevearc/oil.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- Oil will take over directory buffers (e.g. `nvim .` or `:e src/`)
      default_file_explorer = true,
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      opts = opts or {}
      opts.filesystem = opts.filesystem or {}

      -- IMPORTANT: don’t hijack opening directories; let oil handle `nvim .`
      opts.filesystem.hijack_netrw_behavior = "disabled"

      return opts
    end,
  },
}
