function setupKeymaps(ev)
	-- Enable completion triggered by <c-x><c-o>
	vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

	local which_key = require("which-key")

	which_key.register({
		D = { vim.lsp.buf.declaration, "Declaration" },
		d = { vim.lsp.buf.definition, "Definition" },
		i = { vim.lsp.buf.implementation, "Implementation" },
		r = { vim.lsp.buf.references, "References" },
	}, { prefix = "g", buffer = ev.buf })

	which_key.register({
		D = { vim.lsp.buf.type_definition, "Type definitions" },
		r = { vim.lsp.buf.rename, "Rename" },
		f = { m = { vim.lsp.buf.format, "Format code" } },
	}, { prefix = "<leader>", buffer = ev.buf })

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
			local config = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			config.pyright.setup({ capabilities = capabilities })

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
			require("lspconfig").lua_ls.setup({
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
