local neo_tree_status_ok, neo_tree = pcall(require, 'neo-tree')
if not neo_tree_status_ok then
  return
end

neo_tree.setup({
  close_if_last_window = false,
  enable_diagnostics = false,
  source_selector = {
    winbar = true,
    content_layout = "center",
  },
  window = {
    width = 50,
    mappings = {
      ["<space>"] = false,
    o = "open",
    T = "open_tabnew",
    p = { "toggle_preview", config = { use_float = false } },
    H = "prev_source",
    L = "next_source",
      o = "open",
      H = "prev_source",
      L = "next_source",

      ['<tab>'] = function (state)
          local node = state.tree:get_node()
          if require("neo-tree.utils").is_expandable(node) then
            state.commands["toggle_node"](state)
          else
            state.commands['open'](state)
            vim.cmd('Neotree reveal')                  
          end
        end,

    },
  },
  filesystem = {
    follow_current_file = true,
    hijack_netrw_behavior = "open_current",
    use_libuv_file_watcher = true,
    window = {
      mappings = {
        O = "system_open",
        h = "toggle_hidden",
      },
    },
  },

})
