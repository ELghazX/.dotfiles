local opt = vim.opt

-- UI
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.termguicolors = true
opt.showmode = false
opt.cmdheight = 0

-- Editing
opt.clipboard = "unnamedplus"
opt.mouse = "a"
opt.wrap = false
opt.linebreak = true
opt.breakindent = true
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Indentation (keep 4 spaces)
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.smartindent = true
opt.autoindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- Splits
opt.splitbelow = true
opt.splitright = true

-- Performance
opt.updatetime = 50
opt.timeoutlen = 300
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.undofile = true

-- Completion
opt.completeopt = "menuone,noselect"
opt.pumheight = 10

-- Misc
opt.whichwrap = "bs<>[]hl"
opt.conceallevel = 0
opt.fileencoding = "utf-8"
opt.shortmess:append("c")
opt.iskeyword:append("-")
opt.formatoptions:remove({ "c", "r", "o" })
