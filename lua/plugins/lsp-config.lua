function setupKeymaps(ev)
  -- Enable completion triggered by <c-x><c-o>
  vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

  local which_key = require("which-key")

  which_key.add({
    { "gD",         vim.lsp.buf.declaration,     desc = "Declaration" },
    { "gd",         vim.lsp.buf.definition,      desc = "Definition" },
    { "gi",         vim.lsp.buf.implementation,  desc = "Implementation" },
    { "gr",         vim.lsp.buf.references,      desc = "References" },
    { "<leader>D",  vim.lsp.buf.type_definition, desc = "Type definitions" },
    { "<leader>r",  vim.lsp.buf.rename,          desc = "Rename" },
    { "<leader>fm", vim.lsp.buf.format,          desc = "Format code" },
  }, { buffer = ev.buf })

  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buffer, desc = "show hover" })
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = ev.buffer, desc = "signature help" })
end

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pyright" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.lsp.config("pyright", { capabilities = capabilities })
      vim.lsp.config("clangd", {})

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = setupKeymaps,
      })
    end,
    dependencies = { "folke/which-key.nvim" },
  },
  {
    "folke/neodev.nvim",
    config = function()
      require("neodev").setup({})
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      })
    end,
  },
}
