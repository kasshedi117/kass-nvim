local builtin = require('telescope.builtin')

local M = {}

function M.grep_notes()
  local opts = {}
  opts.search_dirs = {'~/.config/nvim'}
  opts.prompt_title = 'Search in nvim directory'
  opts.shorten_path = true
  builtin.live_grep(opts)
end

return M
