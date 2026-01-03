return {
	"catppuccin/nvim",
	lazy = false,
	name = "catppuccin",
	priority = 1000,
	config = function()
		local transparent_enabled = true
		require("catppuccin").setup({
			flavour = "mocha",
			transparent_background = transparent_enabled,
			show_end_of_buffer = false,
			float = {
				transparent = false, -- enable transparent floating windows
				solid = false, -- use solid styling for floating windows, see |winborder|
			},
		})
		local function toggle_background()
			transparent_enabled = not transparent_enabled
			require("catppuccin").setup({
				transparent_background = transparent_enabled,
			})
			vim.cmd.colorscheme("catppuccin")
		end
		vim.keymap.set("n", "<leader>utb", toggle_background, { desc = "Toggle Background Transparency" })
		vim.cmd.colorscheme("catppuccin")
	end,
}
