local status_ok, impatient = pcall(require, "impatient")
if not status_ok then
  require("notify")("impatient is not installed!")
  return
end

impatient.enable_profile()
