if true then return {} end

return {
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
          name = "Ollama",
          end_point = "http://localhost:11434/v1/completions",
          model = "qwen2.5-coder:7b",
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
}
