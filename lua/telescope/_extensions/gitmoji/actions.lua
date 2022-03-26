local actions_state = require("telescope.actions.state")
local actions = require("telescope.actions")

local gm_actions = {}

gm_actions.commit = function(entry)
    vim.ui.input({ prompt = "Enter commit msg: " .. entry.value .. " " }, function(msg)
        if not msg then
            return
        end

        local git_tool = ":!git"
        if vim.g.loaded_fugitive then
            git_tool = ":G"
        end

        vim.cmd(string.format('%s commit -m "%s %s"', git_tool, entry.value, msg))
    end)
end

return gm_actions
