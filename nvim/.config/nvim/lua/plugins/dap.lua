return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			-- Installs the Go Delve DAP adapter
			{ "williamboman/mason.nvim", opts = { ensure_installed = { "delve" } } },
			{ "leoluz/nvim-dap-go" },
		},
		config = function()
			local dap = require("dap")
			local dapgo = require("dap-go")

			-- Setup dap-go
			dapgo.setup()

			-- Keymaps for debugging
			local map = vim.keymap.set
			local opts = { noremap = true, silent = true }

			map("n", "<F5>", dap.continue, opts)
			map("n", "<F6>", dap.terminate, opts)
			map("n", "<F9>", dap.toggle_breakpoint, opts)
			map("n", "<F10>", dap.step_over, opts)
			map("n", "<F11>", dap.step_into, opts)
			map("n", "<F12>", dap.step_out, opts)
			map("n", "<leader>db", dap.run_to_cursor, { desc = "DAP: Run to Cursor" })
			map("n", "<leader>dr", dap.repl.open, { desc = "DAP: Open REPL" })

			-- Add signs for breakpoints
			vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "Error", linehl = "", numhl = "" })
		end,
	},
}
