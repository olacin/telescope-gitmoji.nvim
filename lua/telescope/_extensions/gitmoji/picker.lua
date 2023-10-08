local actions = require("telescope.actions")
local actions_state = require("telescope.actions.state")
local finders = require("telescope.finders")
local pickers = require("telescope.pickers")
local conf = require("telescope.config").values

local frecency = require("telescope._extensions.gitmoji.frecency")

local picker = function(opts)
    opts = opts or {}

    pickers
        .new(opts, {
            prompt_title = "Gitmojis",
            finder = finders.new_dynamic({
                fn = function()
                    return frecency:get_sorted_emojis()
                end,
                entry_maker = function(entry)
                    return {
                        value = entry,
                        display = entry.value .. " " .. entry.description,
                        ordinal = entry.description,
                    }
                end,
            }),
            sorter = conf.generic_sorter(opts),
            attach_mappings = function(prompt_bufnr, map)
                actions.select_default:replace(function()
                    local entry = actions_state.get_selected_entry()
                    actions.close(prompt_bufnr)
                    opts.action(entry)
                    frecency:record(entry.value.value)
                end)
                return true
            end,
        })
        :find()
end

return picker
