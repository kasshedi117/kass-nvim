-- Define a function to switch between .ts and .html files
function switch_file_extension()
	local current_file = vim.fn.expand("%") -- Get the current file name
	if current_file:match("%.ts$") then -- Check if it's a .ts file
		new_file = current_file:gsub("%.ts$", ".html") -- Change extension to .html
	elseif current_file:match("%.html$") then -- Check if it's a .html file
		new_file = current_file:gsub("%.html$", ".ts") -- Change extension to .ts
	else
		return -- Do nothing if the file doesn't match .ts or .html
	end

	if vim.fn.filereadable(new_file) == 1 then -- Check if the new file exists
		vim.cmd("edit " .. new_file) -- Open the new file
	else
		print("File not found: " .. new_file) -- Show a message if the file doesn't exist
	end
end

vim.keymap.set("n", "<tab>", ":lua switch_file_extension()<CR>", { noremap = true, silent = true })
