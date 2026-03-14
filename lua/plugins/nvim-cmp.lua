return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			local ls = require("luasnip")

			vim.keymap.set("i", "<C-l>", function()
				ls.jump(1)
			end, { silent = true })
			vim.keymap.set("i", "<C-h>", function()
				ls.jump(-1)
			end, { silent = true })
		end,
	},
	{
		"hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
    },
		config = function()
			local cmp = require("cmp")
			local vs = require("luasnip.loaders.from_vscode")

      -- most snippets are annoying and get in the way
      -- vs.lazy_load()
			vs.lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets/" } })

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				window = {
          completion = {
            border = "rounded", -- Options: "single", "double", "rounded", "none"
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
            scrollbar = false,
            side_padding = 1,
          },
          documentation = {
            border = "rounded",
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
          },
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-x>"] = cmp.mapping.abort(),
					-- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<TAB>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
					["<S-TAB>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp", group_index = 1 },
					{ name = "luasnip", group_index = 2 },
					{ name = "buffer", group_index = 3 },
				}),
				completion = {
					keyword_length = 3,
				},
			})
		end,
	},
}
