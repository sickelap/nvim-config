---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function() require("lsp_signature").setup() end,
  -- },

  -- == Examples of Overriding Plugins ==

  -- You can disable default plugins as follows:
  -- { "max397574/better-escape.nvim", enabled = false },

  -- {
  --   "windwp/nvim-autopairs",
  --   config = function(plugin, opts)
  --     require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom autopairs configuration such as custom rules
  --     local npairs = require "nvim-autopairs"
  --     local Rule = require "nvim-autopairs.rule"
  --     local cond = require "nvim-autopairs.conds"
  --     npairs.add_rules(
  --       {
  --         Rule("$", "$", { "tex", "latex" })
  --           -- don't add a pair if the next character is %
  --           :with_pair(cond.not_after_regex "%%")
  --           -- don't add a pair if  the previous character is xxx
  --           :with_pair(
  --             cond.not_before_regex("xxx", 3)
  --           )
  --           -- don't move right when repeat character
  --           :with_move(cond.none())
  --           -- don't delete if the next character is xx
  --           :with_del(cond.not_after_regex "xx")
  --           -- disable adding a newline when you press <cr>
  --           :with_cr(cond.none()),
  --       },
  --       -- disable for .vim files, but it work for another filetypes
  --       Rule("a", "a", "-vim")
  --     )
  --   end,
  -- },

  { "renerocksai/calendar-vim" },

  { "nvim-telescope/telescope-symbols.nvim" },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
    opts = {},
  },

  { "mzlogin/vim-markdown-toc" },

  -- {
  --   "prochri/telescope-all-recent.nvim",
  --   dependencies = {
  --     "nvim-telescope/telescope.nvim",
  --     "kkharji/sqlite.lua",
  --     -- optional, if using telescope for vim.ui.select
  --     "stevearc/dressing.nvim",
  --   },
  --   opts = {
  --     -- your config goes here
  --   },
  -- },

  {
    "sindrets/diffview.nvim",
  },

  {
    "stevearc/oil.nvim",
  },

  -- {
  --   "AstroNvim/astrocore",
  --   ---@type AstroCoreOpts
  --   opts = {
  --     autocmds = {
  --       neotree_grep = {
  --         {
  --           event = "FileType",
  --           pattern = "neo-tree",
  --           desc = "Add <leader>fw to grep inside selected folder in Neo-tree",
  --           callback = function()
  --             vim.keymap.set("n", "<leader>fw", function()
  --               local manager = require "neo-tree.sources.manager"
  --               local state = manager.get_state "filesystem"
  --               local node = state.tree:get_node()
  --               if not node then
  --                 vim.notify("No node selected in Neo-tree", vim.log.levels.WARN)
  --                 return
  --               end
  --
  --               local path = node:get_id()
  --               local is_dir = node.type == "directory" or vim.fn.isdirectory(path) == 1
  --               local dir = is_dir and path or vim.fn.fnamemodify(path, ":h")
  --
  --               require("telescope.builtin").live_grep {
  --                 search_dirs = { dir },
  --                 prompt_title = "Grep in " .. dir,
  --               }
  --             end, { buffer = true, desc = "Live grep in selected Neo-tree folder" })
  --           end,
  --         },
  --       },
  --     },
  --   },
  -- },

  {
    "dstein64/nvim-scrollview",
  },

  -- {
  --   "rayliwell/tree-sitter-rstml",
  -- },
}
