-- following options are the default
local nvim_tree = require("nvim-tree")

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<CR>', api.node.open.replace_tree_buffer, opts('Open: In Place'))
end

nvim_tree.setup({
  hijack_netrw = true,
  diagnostics = {
    enable = true,
  },
  renderer = {
    highlight_git = true,
    group_empty = true,
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          deleted = "",
          untracked = "U",
          ignored = "◌",
        },
        folder = {
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
        },
      },
    },
  },
  view = {
    number = true,
    relativenumber = true,
  },
  on_attach = my_on_attach,
  actions = {
    change_dir = {
      -- NOTE: netrw-style, do not change the cwd when navigating
      enable = false,
    },
    open_file = {
      -- NOTE: prevent nvim-tree from re-appearing after opening a new window
      -- (changes the way autocommands are registered)
      quit_on_open = true,
    },
  },
})
-- NOTE: disable fixed nvim-tree width and height
-- to allow creating splits naturally
local winopts = require("nvim-tree.view").View.winopts
winopts.winfixwidth = false
winopts.winfixheight = false

local function toggle_replace()
  local api = require("nvim-tree.api")
  if api.tree.is_visible() then
    api.tree.close()
  else
    api.node.open.replace_tree_buffer()
  end
end

vim.keymap.set("n", "-", toggle_replace)

require("which-key").register({
  ["-"] = {
    require("nvim-tree").open_replacing_current_buffer,
    "NvimTree in place",
  },
})
