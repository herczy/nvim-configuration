return {
    'ggml-org/llama.vim',
    init = function ()
        vim.g.llama_config = {
          auto_fim = false,
          endpoint_fim = "http://localhost:8080/infill"
        }
    end,
    -- config = function ()
    --   vim.g.llama_config.keymap_fim_trigger     = "<leader>llf"
    --   vim.g.llama_config.keymap_fim_accept_full = "<Tab>"
    --   vim.g.llama_config.keymap_fim_accept_line = "<S-Tab>"
    --   vim.g.llama_config.keymap_fim_accept_word = "<leader>ll]"

    --   vim.g.llama_config.keymap_inst_trigger  = "<leader>lli"
    --   vim.g.llama_config.keymap_inst_retry    = "<leader>llr"
    --   vim.g.llama_config.keymap_inst_continue = "<leader>llc"
    --   vim.g.llama_config.keymap_inst_accept   = "<Tab>"
    --   vim.g.llama_config.keymap_inst_cancel   = "<Esc>"
    -- end
}
