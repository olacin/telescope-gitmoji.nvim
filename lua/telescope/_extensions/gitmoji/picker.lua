local actions = require("telescope.actions")
local finders = require("telescope.finders")
local pickers = require("telescope.pickers")
local conf = require("telescope.config").values

local gm_emojis = require("telescope._extensions.gitmoji.emojis")
local gm_actions = require("telescope._extensions.gitmoji.actions")

local gm_picker = {}

gm_picker.picker = function(opts)
  opts = opts or {}

  pickers.new(opts, {
    prompt_title = "Gitmojis",
    finder = finders.new_table {
      results = gm_emojis,
      entry_maker = function(entry)
        return {
          value = entry,
          display = entry.value .. " " .. entry.description,
          ordinal = entry.description,
        }
      end
    },
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr, map)
      -- default action: gm_actions.commit
      actions.select_default:replace(gm_actions.commit)
      return true
    end
  }):find()
end

return gm_picker.picker
