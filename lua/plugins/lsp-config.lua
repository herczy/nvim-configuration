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
		w = {
			"Workspace",
			a = { vim.lsp.buf.add_workspace_folder, "Add workspace folder" },
			r = { vim.lsp.buf.remove_workspace_folder, "Remove workspace folder" },
			l = {
				function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end,
				"List workspace folders",
			},
		},
		D = { vim.lsp.buf.type_definition, "Type definitions" },
		r = {
			n = { vim.lsp.buf.rename, "Rename" },
		},
		c = { a = { vim.lsp.buf.code_action, "Code actions" } },
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
				ensure_installed = { "lua_ls", "pyright", "zls" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local config = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			config.lua_ls.setup({ capabilities = capabilities })
			config.pyright.setup({ capabilities = capabilities })
			config.zls.setup({ capabilities = capabilities })

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
			require("lspconfig").lua_ls.setup({
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
