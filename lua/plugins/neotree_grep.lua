---@type LazySpec
return {
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
}
