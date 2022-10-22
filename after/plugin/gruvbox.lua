local status, gruvbox = pcall(require, 'lualine')
if (not status) then 
  print("Gruvbox is not installed")
return end
