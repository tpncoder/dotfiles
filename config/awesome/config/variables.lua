local M = {}

function M.terminal()
   return "wezterm";
end

function M.editor()
   return os.getenv("EDITOR") or "nano"
end

return M