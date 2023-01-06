local actions_state = require("telescope.actions.state")
local actions = require("telescope.actions")

local gm_actions = {}

gm_actions.commit = function(entry)
    local emoji = entry.value.value
    vim.ui.input({ prompt = "Enter commit message: " .. emoji .. " " }, function(msg)
        if not msg then
            return
        end

        local git_tool = ":!git"
        if vim.g.loaded_fugitive then
            git_tool = ":G"
        end

        vim.cmd(string.format('%s commit -m "%s %s"', git_tool, emoji, msg))
    end)
end

return gm_actions
