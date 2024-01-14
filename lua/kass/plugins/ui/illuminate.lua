-- highlight cWord and its matches
local M = {
	"RRethy/vim-illuminate",
}

function M.config()
	require("illuminate").configure()
end

return M
