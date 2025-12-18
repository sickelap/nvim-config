---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Examples of Overriding Plugins ==

  -- customize dashboard options
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = "",
        },
      },
    },
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },

  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    opts = {
      enabled = true,
      message_template = " • <author> • <date>",
      date_format = "%Y-%m-%d %H:%M:%S",
      virtual_text_column = 1,
    },
  },

  {
    "2kabhishek/co-author.nvim",
    dependencies = {
      "folke/snacks.nvim",
    },
    cmd = { "CoAuthor" },
  },

  { "renerocksai/calendar-vim" },

  { "nvim-telescope/telescope-symbols.nvim" },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
    opts = {},
  },

  { "mzlogin/vim-markdown-toc" },

  {
    "prochri/telescope-all-recent.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "kkharji/sqlite.lua",
      -- optional, if using telescope for vim.ui.select
      "stevearc/dressing.nvim",
    },
    opts = {
      -- your config goes here
    },
  },

  {
    "sindrets/diffview.nvim",
  },

  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    lazy = false,
    opts = {},
    config = function()
      vim.keymap.set("n", "<leader>r", function()
        if next(vim.lsp.get_clients { bufnr = 0 }) ~= nil then
          require("telescope").extensions.refactoring.refactors()
        else
          print "LSP is not attached"
        end
      end, { desc = "Show Refactorings" })
    end,
  },

  {
    "stevearc/oil.nvim",
  },

  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      autocmds = {
        neotree_grep = {
          {
            event = "FileType",
            pattern = "neo-tree",
            desc = "Add <leader>fw to grep inside selected folder in Neo-tree",
            callback = function()
              vim.keymap.set("n", "<leader>fw", function()
                local manager = require "neo-tree.sources.manager"
                local state = manager.get_state "filesystem"
                local node = state.tree:get_node()
                if not node then
                  vim.notify("No node selected in Neo-tree", vim.log.levels.WARN)
                  return
                end

                local path = node:get_id()
                local is_dir = node.type == "directory" or vim.fn.isdirectory(path) == 1
                local dir = is_dir and path or vim.fn.fnamemodify(path, ":h")

                require("telescope.builtin").live_grep {
                  search_dirs = { dir },
                  prompt_title = "Grep in " .. dir,
                }
              end, { buffer = true, desc = "Live grep in selected Neo-tree folder" })
            end,
          },
        },
      },
    },
  },

  {
    "dstein64/nvim-scrollview",
  },

  {
    "rayliwell/tree-sitter-rstml",
  },

  {
    "nvim-telekasten/telekasten.nvim",
    config = function()
      require("telekasten").setup {
        home = vim.fn.expand "~/Documents/zettelkasten",
      }
    end,
  },

  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("telescope").load_extension "harpoon"
      vim.keymap.set(
        "n",
        "<leader>Hh",
        function() require("harpoon.ui").toggle_quick_menu() end,
        { desc = "Quick menu" }
      )
      vim.keymap.set("n", "<leader>Hf", function() require("harpoon.ui").add_file() end, { desc = "Add file" })
    end,
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      temperature = 0.1, -- Lower = focused, higher = creative
      window = {
        layout = "vertical", -- 'vertical', 'horizontal', 'float'
        width = 0.4, -- 40% of screen width
      },
      -- auto_insert_mode = true, -- Enter insert mode when opening
    },
  },
}
