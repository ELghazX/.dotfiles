return {
	"saghen/blink.cmp",
	event = "InsertEnter",
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			version = "2.*",
			build = (function()
				if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
					return
				end
				return "make install_jsregexp"
			end)(),
			dependencies = {
				{
					"rafamadriz/friendly-snippets",
					config = function()
						require("luasnip.loaders.from_vscode").lazy_load()
					end,
				},
			},
		},
		"folke/lazydev.nvim",
	},

	version = "1.*",
	opts = {
		keymap = { preset = "default" },

		appearance = {
			nerd_font_variant = "mono",
			use_nvim_cmp_as_default = true,
			kind_icons = {
				Text = "󰉿",
				Method = "󰆧",
				Function = "󰊕",
				Constructor = "",
				Field = "󰜢",
				Variable = "󰀫",
				Class = "󰠱",
				Interface = "",
				Module = "",
				Property = "󰜢",
				Unit = "󰑭",
				Value = "󰎠",
				Enum = "",
				Keyword = "󰌋",
				Snippet = "",
				Color = "󰏘",
				File = "󰈙",
				Reference = "󰈇",
				Folder = "󰉋",
				EnumMember = "",
				Constant = "󰏿",
				Struct = "󰙅",
				Event = "",
				Operator = "󰆕",
				TypeParameter = "",
			},
		},

		completion = {
			documentation = { auto_show = true, auto_show_delay_ms = 200 },
			menu = {
				draw = {
					columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "source_name" } },
					components = {
						source_name = {
							text = function(ctx)
								local source_names = {
									lsp = "[LSP]",
									snippets = "[Snippet]",
									path = "[Path]",
									buffer = "[Buffer]",
									lazydev = "[LazyDev]",
								}
								return source_names[ctx.source_name] or "[" .. ctx.source_name .. "]"
							end,
							highlight = "BlinkCmpSource",
						},
					},
				},
			},
		},

		sources = {
			default = { "lsp", "snippets", "lazydev", "path", "buffer" },
			providers = {
				lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
			},
		},

		snippets = { preset = "luasnip" },

		fuzzy = { implementation = "prefer_rust_with_warning" },

		signature = { enabled = true },
	},
}
-- return { -- Autocompletion
--   'hrsh7th/nvim-cmp',
--   dependencies = {
--     -- Snippet Engine & its associated nvim-cmp source
--     {
--       'L3MON4D3/LuaSnip',
--       build = (function()
--         -- Build Step is needed for regex support in snippets.
--         -- This step is not supported in many windows environments.
--         -- Remove the below condition to re-enable on windows.
--         if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
--           return
--         end
--         return 'make install_jsregexp'
--       end)(),
--       dependencies = {
--         -- `friendly-snippets` contains a variety of premade snippets.
--         --    See the README about individual language/framework/plugin snippets:
--         --    https://github.com/rafamadriz/friendly-snippets
--         {
--           'rafamadriz/friendly-snippets',
--           config = function()
--             require('luasnip.loaders.from_vscode').lazy_load()
--           end,
--         },
--       },
--     },
--     'saadparwaiz1/cmp_luasnip',
--
--     -- Adds other completion capabilities.
--     --  nvim-cmp does not ship with all sources by default. They are split
--     --  into multiple repos for maintenance purposes.
--     'hrsh7th/cmp-nvim-lsp',
--     'hrsh7th/cmp-buffer',
--     'hrsh7th/cmp-path',
--   },
--   config = function()
--     -- See `:help cmp`
--     local cmp = require 'cmp'
--     local luasnip = require 'luasnip'
--     luasnip.config.setup {}
--
--     local kind_icons = {
--       Text = '󰉿',
--       Method = 'm',
--       Function = '󰊕',
--       Constructor = '',
--       Field = '',
--       Variable = '󰆧',
--       Class = '󰌗',
--       Interface = '',
--       Module = '',
--       Property = '',
--       Unit = '',
--       Value = '󰎠',
--       Enum = '',
--       Keyword = '󰌋',
--       Snippet = '',
--       Color = '󰏘',
--       File = '󰈙',
--       Reference = '',
--       Folder = '󰉋',
--       EnumMember = '',
--       Constant = '󰇽',
--       Struct = '',
--       Event = '',
--       Operator = '󰆕',
--       TypeParameter = '󰊄',
--     }
--     cmp.setup {
--       snippet = {
--         expand = function(args)
--           luasnip.lsp_expand(args.body)
--         end,
--       },
--       completion = { completeopt = 'menu,menuone,noinsert' },
--
--       -- For an understanding of why these mappings were
--       -- chosen, you will need to read `:help ins-completion`
--       --
--       -- No, but seriously. Please read `:help ins-completion`, it is really good!
--       mapping = cmp.mapping.preset.insert {
--         -- Select the [n]ext item
--         ['<C-n>'] = cmp.mapping.select_next_item(),
--         -- Select the [p]revious item
--         ['<C-p>'] = cmp.mapping.select_prev_item(),
--
--         -- Scroll the documentation window [b]ack / [f]orward
--         ['<C-b>'] = cmp.mapping.scroll_docs(-4),
--         ['<C-f>'] = cmp.mapping.scroll_docs(4),
--
--         -- Accept ([y]es) the completion.
--         --  This will auto-import if your LSP supports it.
--         --  This will expand snippets if the LSP sent a snippet.
--         ['<C-y>'] = cmp.mapping.confirm { select = true },
--
--         -- If you prefer more traditional completion keymaps,
--         -- you can uncomment the following lines
--         --['<CR>'] = cmp.mapping.confirm { select = true },
--         --['<Tab>'] = cmp.mapping.select_next_item(),
--         --['<S-Tab>'] = cmp.mapping.select_prev_item(),
--
--         -- Manually trigger a completion from nvim-cmp.
--         --  Generally you don't need this, because nvim-cmp will display
--         --  completions whenever it has completion options available.
--         ['<C-Space>'] = cmp.mapping.complete {},
--
--         -- Think of <c-l> as moving to the right of your snippet expansion.
--         --  So if you have a snippet that's like:
--         --  function $name($args)
--         --    $body
--         --  end
--         --
--         -- <c-l> will move you to the right of each of the expansion locations.
--         -- <c-h> is similar, except moving you backwards.
--         ['<C-l>'] = cmp.mapping(function()
--           if luasnip.expand_or_locally_jumpable() then
--             luasnip.expand_or_jump()
--           end
--         end, { 'i', 's' }),
--         ['<C-h>'] = cmp.mapping(function()
--           if luasnip.locally_jumpable(-1) then
--             luasnip.jump(-1)
--           end
--         end, { 'i', 's' }),
--
--         -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
--         --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
--         -- Select next/previous item with Tab / Shift + Tab
--         ['<Tab>'] = cmp.mapping(function(fallback)
--           if cmp.visible() then
--             cmp.select_next_item()
--           elseif luasnip.expand_or_locally_jumpable() then
--             luasnip.expand_or_jump()
--           else
--             fallback()
--           end
--         end, { 'i', 's' }),
--         ['<S-Tab>'] = cmp.mapping(function(fallback)
--           if cmp.visible() then
--             cmp.select_prev_item()
--           elseif luasnip.locally_jumpable(-1) then
--             luasnip.jump(-1)
--           else
--             fallback()
--           end
--         end, { 'i', 's' }),
--       },
--       sources = {
--         {
--           name = 'lazydev',
--           -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
--           group_index = 0,
--         },
--         { name = 'nvim_lsp' },
--         { name = 'luasnip' },
--         { name = 'buffer' },
--         { name = 'path' },
--       },
--       formatting = {
--         fields = { 'kind', 'abbr', 'menu' },
--         format = function(entry, vim_item)
--           vim_item.kind = string.format('%s', kind_icons[vim_item.kind])
--           vim_item.menu = ({
--             nvim_lsp = '[LSP]',
--             luasnip = '[Snippet]',
--             buffer = '[Buffer]',
--             path = '[Path]',
--           })[entry.source.name]
--           return vim_item
--         end,
--       },
--     }
--   end,
-- }
