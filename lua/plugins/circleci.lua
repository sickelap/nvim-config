---@type LazySpec
return {
  {
    "AstroNvim/astrocore",
    opts = function()
      vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
        pattern = { "*/.circleci/config.yml", "*/.circleci/config.yaml" },
        callback = function(args)
          local path = vim.api.nvim_buf_get_name(args.buf)
          vim.lsp.start {
            name = "circleci-yaml-language-server",
            cmd = {
              "circleci-yaml-language-server",
              "--stdio",
            },
            root_dir = path:match "^(.*)/%.circleci/config%.ya?ml$",
          }
        end,
      })
    end,
  },
}
