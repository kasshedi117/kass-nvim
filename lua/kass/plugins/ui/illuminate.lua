-- highlight cWord and its matches
local M = {
	"RRethy/vim-illuminate",
	commit = "3bd2ab64b5d63b29e05691e624927e5ebbf0fb86",
}

function M.config()
	require("illuminate").configure()
end

return M
