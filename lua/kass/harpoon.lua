local status_ok, harpoon = pcall(require, "harpoon")
if not status_ok then
  require("notify")("harpoon is not installed!")
  return
end

harpoon.setup({ ... })

