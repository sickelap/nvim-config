return {
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
}
