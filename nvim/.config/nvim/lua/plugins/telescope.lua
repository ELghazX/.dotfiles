return {
	"nvim-telescope/telescope.nvim",
	keys = {
		{
			"<leader>sf",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>sg",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "Grep",
		},
		{
			"<leader><leader>",
			function()
				require("telescope.builtin").buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>sr",
			function()
				require("telescope.builtin").resume()
			end,
			desc = "Resume Last Search",
		},
		{
			"<leader>/",
			function()
				require("telescope.builtin").current_buffer_fuzzy_find(
					require("telescope.themes").get_dropdown({ previewer = false })
				)
			end,
			desc = "Fuzzily search in buffer",
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local actions = require("telescope.actions")

		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<C-n>"] = actions.move_selection_next,
						["<C-p>"] = actions.move_selection_previous,
						["<C-y>"] = actions.select_default,
						["<C-u>"] = actions.preview_scrolling_up,
						["<C-d>"] = actions.preview_scrolling_down,
						["<C-c>"] = actions.close,
					},
				},
				layout_strategy = "horizontal",
				layout_config = { preview_width = 0.55 },
			},
			pickers = {
				find_files = {
					file_ignore_patterns = { "node_modules", "%.git/", "%.venv", "target/", "%.DS_Store", "dist/" },
					hidden = true,
				},
			},
		})
		pcall(require("telescope").load_extension, "fzf")
	end,
}
