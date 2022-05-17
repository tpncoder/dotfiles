local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end
-- NvimTree
local present, nvimtree = pcall(require, "nvim-tree")

if not present then
   return
end

-- globals must be set prior to requiring nvim-tree to function
local g = vim.g

g.nvim_tree_add_trailing = 0 -- append a trailing slash to folder names
g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 0
g.nvim_tree_root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" }

g.nvim_tree_show_icons = {
   folders = 1,
   files = 1,
   git = 1,
}

g.nvim_tree_icons = {
   default = "",
   symlink = "",
   git = {
      deleted = "",
      ignored = "◌",
      renamed = "➜",
      staged = "✓",
      unmerged = "",
      unstaged = "✗",
      untracked = "★",
   },
   folder = {
      default = "",
      empty = "",
      empty_open = "",
      open = "",
      symlink = "",
      symlink_open = "",
   },
}

local options = {
   filters = {
      dotfiles = false,
   },
   disable_netrw = true,
   hijack_netrw = true,
   ignore_ft_on_setup = { "dashboard" },
   open_on_tab = false,
   hijack_cursor = true,
   hijack_unnamed_buffer_when_opening = false,
   update_cwd = true,
   update_focused_file = {
      enable = true,
      update_cwd = false,
   },
   view = {
      side = "left",
      width = 25,
      hide_root_folder = true,
   },
   git = {
      enable = false,
      ignore = false,
   },
   actions = {
      open_file = {
         resize_window = true,
      },
   },
   renderer = {
      indent_markers = {
         enable = true,
      },
   },
}

-- check for any override
nvimtree.setup(options)



local options = {
   options = {
      offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
      buffer_close_icon = "",
      modified_icon = "",
      close_icon = "",
      show_close_icon = true,
      left_trunc_marker = "",
      right_trunc_marker = "",
      max_name_length = 14,
      max_prefix_length = 13,
      tab_size = 20,
      show_tab_indicators = true,
      enforce_regular_tabs = false,
      view = "multiwindow",
      show_buffer_close_icons = true,
      separator_style = "thin",
      always_show_bufferline = true,
      diagnostics = false,
      custom_filter = function(buf_number)
         -- Func to filter out our managed/persistent split terms
         local present_type, type = pcall(function()
            return vim.api.nvim_buf_get_var(buf_number, "term_type")
         end)

         if present_type then
            if type == "vert" then
               return false
            elseif type == "hori" then
               return false
            end
            return true
         end

         return true
      end,
   },

}


