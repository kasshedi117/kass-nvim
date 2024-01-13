return {
	"ThePrimeagen/git-worktree.nvim",
	name = "git-worktree",
	config = function()
		local gitWorktree = require("git-worktree")
		gitWorktree.setup({
			change_directory_command = "cd", -- default: "cd",
			update_on_change = true, -- default: true,
			update_on_change_command = "e .", -- default: "e .",
			clearjumps_on_change = true, -- default: true,
			autopush = false, -- default: false,
		})
		gitWorktree.on_tree_change(function(op, metadata)
			if op == gitWorktree.Operations.Switch then
				os.execute("~/.local/bin/worktree-switch-npm.sh " .. metadata.path)
			end
		end)
	end,
}
