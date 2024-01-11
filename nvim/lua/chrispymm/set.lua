vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.path:append({ "**" })

vim.opt.wildmode = "longest:full,full"
vim.opt.wildmenu = true

vim.opt.wildignore:append({ "**/node_modules/*", "**/.git/*" })

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.list = true
vim.opt.listchars = { tab = "▸ ", trail = "·" }

vim.opt.signcolumn = "yes:2"
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.spell = true
vim.opt.spelllang = "en_gb"
vim.opt.title = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = false
vim.opt.mouse = "a"
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.joinspaces = false
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.clipboard = "unnamedplus"
vim.opt.confirm = true
vim.opt.showmode = true
vim.opt.backup = true
vim.opt.backupdir = "~/.local/share/nvim/backup//"
vim.opt.updatetime = 300
vim.opt.redrawtime = 10000
vim.opt.textwidth = 80
vim.opt.colorcolumn = "+1"
vim.opt.cursorline = true
vim.opt.laststatus = 3
vim.opt.winbar = "%=%m %f"
vim.opt.fo = "cqj"
vim.opt.hlsearch = false

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
