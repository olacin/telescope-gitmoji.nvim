local actions_state = require("telescope.actions.state")
local actions = require("telescope.actions")

local gm_actions = {}

gm_actions.commit = function(entry)
  local emoji = entry.value or ""
  local content = ' commit -m "' .. emoji .. ' "<Left>'

  local fug_exists = vim.api.nvim_eval('exists("g:loaded_fugitive")')

  if fug_exists ~= 0 then
    vim.api.nvim_input(":G" .. content)
  else
    vim.api.nvim_input(":!git" .. content)
  end
end

return gm_actions
