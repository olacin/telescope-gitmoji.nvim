local actions = require("telescope.actions")
local actions_state = require("telescope.actions.state")
local finders = require("telescope.finders")
local pickers = require("telescope.pickers")
local conf = require("telescope.config").values

local gm_emojis = require("telescope._extensions.gitmoji.emojis")

local gm_picker = {}

gm_picker.picker = function(opts)
	opts = opts or {}

	pickers.new(opts, {
		prompt_title = "Gitmojis",
		finder = finders.new_table({
			results = gm_emojis,
			entry_maker = function(entry)
				return {
					value = entry.value,
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
			end)
			return true
		end,
	}):find()
end

return gm_picker.picker
