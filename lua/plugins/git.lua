local gs_buf_nr = nil

return {
  {
    "lewis6991/gitsigns.nvim",
    on_attach = function(buffer) gs_buf_nr = buffer end,
  },

  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    config = function()
      require("gitblame").setup {
        enabled = true,
        message_template = " • <author> • <date>",
        date_format = "%Y-%m-%d %H:%M:%S",
        virtual_text_column = 1,
        highlight_group = "GitBlameHighlight",
      }
      vim.api.nvim_set_hl(0, "GitBlameHighlight", { fg = "#888888", italic = true })
    end,
  },

  {
    "2kabhishek/co-author.nvim",
    dependencies = {
      "folke/snacks.nvim",
    },
    cmd = { "CoAuthor" },
  },

  -- git speciffic mappings
  {
    "AstroNvim/astrocore",
    opts = function(_, opts)
      local maps = opts.mappings or {}
      local gs = require "gitsigns"

      -- opts.mappings.n["<leader>gt"] = { desc = "Toggle" }

      local function gs_map(mode, lhs, rhs, desc) opts.mappings[mode][lhs] = { rhs, desc = desc, buffer = gs_buf_nr } end

      gs_map("n", "<Leader>gn", function() gs.nav_hunk "next" end, "Next hunk")
      gs_map("n", "<Leader>gp", function() gs.nav_hunk "prev" end, "Prev hunk")

      gs_map("n", "<Leader>gs", gs.stage_hunk, "Stage hunk")
      gs_map("v", "<Leader>gs", function() gs.stage_hunk { vim.fn.line ".", vim.fn.line "v" } end, "Stage selection")
      gs_map("n", "<Leader>gS", gs.stage_hunk, "Stage buffer")

      gs_map("n", "<leader>gr", gs.reset_hunk, "Reset Hunk")
      gs_map("v", "<leader>gr", function() gs.reset_hunk { vim.fn.line ".", vim.fn.line "v" } end, "Reset Selection")
      gs_map("n", "<leader>gR", gs.reset_buffer, "Reset Buffer")

      -- gs_map("n", "<leader>gP", gs.preview_hunk, "Preview")
      -- gs_map("n", "<leader>gi", gs.preview_hunk_inline, "Preview inline")

      -- gs_map("n", "<leader>gb", function() gs.blame_line { full = true } end)

      -- gs_map("n", "<leader>gd", gs.diffthis)
      --
      -- gs_map("n", "<leader>gD", function() gs.diffthis "~" end)
      --
      -- gs_map("n", "<leader>gQ", function() gs.setqflist "all" end)
      -- gs_map("n", "<leader>gq", gs.setqflist)

      -- Toggles
      -- gs_map("n", "<leader>gtb", gs.toggle_current_line_blame)
      -- gs_map("n", "<leader>gtw", gs.toggle_word_diff)

      -- -- Text object
      -- gs_map({ "o", "x" }, "ih", gs.select_hunk)

      vim.keymap.set("n", "<leader>ga", "<cmd>CoAuthor<cr>", { desc = "Add Co-Autohor" })

      opts.mappings = maps
    end,
  },
}
