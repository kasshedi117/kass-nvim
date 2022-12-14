local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    require("notify")("Nvim-tree is not installed!")
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
    require("notify")("Nvim-tree.config is not installed!")
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  renderer = {
    root_folder_modifier = ":t",
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  live_filter = {
    prefix = "[FILTER]: ",
    always_show_folders = false, -- live_filter do not display empty folders 
  },
  view = {
    width = 40,
    side = "left",
    mappings = {
      list = {
        { key = "go", action = "edit" },
        { key = "o", action = "preview" },
        { key = "v", action = "vsplit" },
        { key = "V", action = "split" },
      },
    },
  },
}
