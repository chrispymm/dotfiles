require("chrispymm.set")
require("chrispymm.remap")
require("chrispymm.commands")
require("chrispymm.lazy")

require("lazy").setup("chrispymm.plugins")

vim.api.nvim_command("packadd! matchit")
