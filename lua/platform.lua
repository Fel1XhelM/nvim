local uv = vim.uv or vim.loop

local function detect_platform()
  local home = vim.env.HOME or ""
  if home:match("^/data/data/com%.termux/files/home") then
    return "termux"
  end

  if uv.os_uname().sysname == "Android" then
    return "termux"
  end

  return "arch"
end

local platform = {
  name = detect_platform(),
  file_browser_root = vim.env.HOME or "~",
}

local ok, override = pcall(require, "platforms." .. platform.name)
if ok and type(override) == "table" then
  platform = vim.tbl_deep_extend("force", platform, override)
end

return platform
