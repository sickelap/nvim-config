-- if true then return {} end

return {
  {
    "milanglacier/minuet-ai.nvim",
    config = function()
      require("minuet").setup {
        virtualtext = {
          auto_trigger_ft = { "*" },
          keymap = {
            -- accept whole completion
            accept = "<C-S-y>",
            -- accept one line
            accept_line = "<C-y>",
            -- Cycle to prev completion item, or manually invoke completion
            dismiss = "<C-c>",
          },
        },
        provider = "openai_fim_compatible",
        n_completions = 1, -- recommend for local model for resource saving
        -- I recommend beginning with a small context window size and incrementally
        -- expanding it, depending on your local computing power. A context window
        -- of 512, serves as an good starting point to estimate your computing
        -- power. Once you have a reliable estimate of your local computing power,
        -- you should adjust the context window to a larger value.
        context_window = 512,
        provider_options = {
          openai_fim_compatible = {
            api_key = "TERM",
            name = "LMStudio",
            end_point = "http://localhost:1234/v1/completions",
            model = "qwen2.5-coder-14b",
            optional = {
              max_tokens = 56,
              top_p = 0.9,
            },
          },
        },
        lsp = {
          enabled_ft = { "*" },
          warn_on_blink_or_cmp = false,
        },
      }
    end,
  },
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },

    opts = {
      adapters = {
        http = {
          lmstudio = function()
            return require("codecompanion.adapters").extend("openai_compatible", {
              name = "lmstudio",
              env = {
                url = "http://127.0.0.1:1234",
                chat_url = "/v1/chat/completions",
                api_key = "lm-studio", -- harmless if auth is disabled
              },
              schema = {
                model = {
                  -- replace with the exact model id shown by GET /v1/models
                  default = "qwen/qwen2.5-coder-14b",
                },
              },
              headers = {
                ["Content-Type"] = "application/json",
                ["Authorization"] = "Bearer ${api_key}",
              },
              parameters = {
                temperature = 0.2,
                top_p = 0.95,
              },
            })
          end,
        },
      },

      strategies = {
        chat = {
          adapter = "lmstudio",
        },
        inline = {
          adapter = "lmstudio",
        },
      },

      display = {
        diff = {
          enabled = true,
        },
      },

      opts = {
        log_level = "INFO", -- or TRACE or DEBUG
      },
    },
  },
}

-- return {
--   {
--     "olimorris/codecompanion.nvim",
--     dependencies = {
--       "nvim-lua/plenary.nvim",
--       "nvim-treesitter/nvim-treesitter",
--     },
--     opts = {
--       adapters = {
--         http = {
--           lmstudio = function()
--             return require("codecompanion.adapters").extend("openai_compatible", {
--               name = "lmstudio",
--               env = {
--                 url = "http://127.0.0.1:1234",
--                 chat_url = "/v1/completions",
--                 api_key = "lm-studio", -- harmless if auth is disabled
--               },
--               schema = {
--                 model = {
--                   -- replace with the exact model id shown by GET /v1/models
--                   default = "qwen/qwen2.5-coder-14b",
--                 },
--               },
--               headers = {
--                 ["Content-Type"] = "application/json",
--                 ["Authorization"] = "Bearer ${api_key}",
--               },
--               parameters = {
--                 temperature = 0.2,
--                 top_p = 0.95,
--               },
--             })
--           end,
--         },
--       },
--
--       strategies = {
--         chat = {
--           adapter = "lmstudio",
--         },
--         inline = {
--           adapter = "lmstudio",
--         },
--       },
--
--       display = {
--         diff = {
--           enabled = true,
--         },
--       },
--
--       opts = {
--         log_level = "INFO",
--       },
--     },
--     keys = {
--       { "<leader>ac", "<cmd>CodeCompanionChat<cr>", desc = "CodeCompanion Chat" },
--       { "<leader>aa", "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanion Actions" },
--       { "<leader>ai", ":CodeCompanion ", mode = { "n", "v" }, desc = "CodeCompanion Inline" },
--     },
--   },
-- }
