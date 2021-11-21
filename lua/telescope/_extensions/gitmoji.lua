local has_telescope, telescope = pcall(require, "telescope")
if not has_telescope then
  error "telescope-gitmoji.nvim requires telescope.nvim - https://github.com/nvim-telescope/telescope.nvim"
end

local gm_actions = require("telescope._extensions.gitmoji.actions")
local gm_picker = require("telescope._extensions.gitmoji.picker")
local gm_emojis = require("telescope._extensions.gitmoji.emojis")

local search = function(opts)
  opts = opts or {}

  defaults = {
    action = gm_actions.commit
  }

  gm_picker(vim.tbl_extend("force", defaults, opts))
end

return telescope.register_extension {
  exports = { search = search }
}
