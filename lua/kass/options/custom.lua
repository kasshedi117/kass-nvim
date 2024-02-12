function switch_file_extension(direction)
	local current_file = vim.fn.expand("%") -- Get the current file name
	local current_dir = vim.fn.expand("%:h") -- Get the directory of the current file

	if current_file:match("%.component.ts$") then -- Check if it's a .ts file
		new_file = current_file:gsub("%.ts$", ".html") -- Change extension to .html
	elseif current_file:match("%.component.html$") then -- Check if it's a .html file
		new_file = current_file:gsub("%.html$", ".ts") -- Change extension to .ts
	elseif direction == "next" or direction == "prev" then
		local files_str = vim.fn.glob(current_dir .. "/*")
		local files = vim.fn.split(files_str, "\n") -- Split the string into a table
		table.sort(files)
		local current_index = vim.fn.index(files, current_file) + 1
		local next_index

		if direction == "next" then
			print(current_index)
			next_index = current_index + 1
			if next_index > #files then
				next_index = 1
			end
		elseif direction == "prev" then
			print(current_index)
			next_index = current_index - 1
			if next_index < 1 then
				next_index = #files
			end
		end

		new_file = files[next_index]
	else
		return -- Do nothing if the file doesn't match .ts or .html and direction is not "next" or "prev"
	end

	if vim.fn.filereadable(new_file) == 1 then -- Check if the new file exists
		vim.cmd("edit " .. new_file) -- Open the new file
	else
		print("File not found: " .. new_file) -- Show a message if the file doesn't exist
	end
end

vim.keymap.set("n", "<c-n>", ":lua switch_file_extension('next')<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<c-p>", ":lua switch_file_extension('prev')<CR>", { noremap = true, silent = true })
