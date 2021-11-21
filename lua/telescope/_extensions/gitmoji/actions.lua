local actions_state = require("telescope.actions.state")
local actions = require("telescope.actions")

local gm_actions = {}

gm_actions.commit = function(prompt_bufnr)
  local entry = actions_state.get_selected_entry().value
  local emoji = entry.value or ""
  actions.close(prompt_bufnr)
  vim.api.nvim_input(':G commit -m "' .. emoji .. '"<Left>')
end

return gm_actions
