-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
vim.g.nvim_tree_icons = {
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
}

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_group_empty = 1

nvim_tree.setup({
  hijack_netrw = true,
  diagnostics = {
    enable = true,
  },
  view = {
    number = true,
    relativenumber = true,
    mappings = {
      list = {
        -- NOTE: default to editing the file in place, netrw-style
        {
          key = { "<C-e>", "o", "<CR>" },
          action = "edit_in_place",
        },
        -- NOTE: override the "split" to avoid treating nvim-tree
        -- window as special. Splits will appear as if nvim-tree was a
        -- regular window
        {
          key = "<C-v>",
          action = "split_right",
          action_cb = function(node)
            vim.cmd("vsplit " .. vim.fn.fnameescape(node.absolute_path))
          end,
        },
        {
          key = "<C-x>",
          action = "split_bottom",
          action_cb = function(node)
            vim.cmd("split " .. vim.fn.fnameescape(node.absolute_path))
          end,
        },
        -- NOTE: override the "open in new tab" mapping to fix the error
        -- that occurs there
        {
          key = "<C-t>",
          action = "new_tab",
          action_cb = function(node)
            vim.cmd("tabnew " .. vim.fn.fnameescape(node.absolute_path))
          end,
        },
      },
    },
  },
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

require("which-key").register({
  ["-"] = {
    require("nvim-tree").open_replacing_current_buffer,
    "NvimTree in place",
  },
})
