local actions = require("telescope.actions")
local finders = require("telescope.finders")
local pickers = require("telescope.pickers")
local conf = require("telescope.config").values
local entry_display = require("telescope.pickers.entry_display")
local action_state = require("telescope.actions.state")

local emojis = {
  {
      value = "🎨",
      description = "Improve structure / format of the code.",
  },
    {
      value = "⚡️",
      description = "Improve performance."
    },
    {
      value = "🔥",
      description = "Remove code or files."
    },
    {
      value = "🐛",
      description = "Fix a bug."
    },
    {
      value = "🚑️",
      description = "Critical hotfix."
    },
    {
      value = "✨",
      description = "Introduce new features."
    },
    {
      value = "📝",
      description = "Add or update documentation."
    },
    {
      value = "🚀",
      description = "Deploy stuff."
    },
    {
      value = "💄",
      description = "Add or update the UI and style files."
    },
    {
      value = "🎉",
      description = "Begin a project."
    },
    {
      value = "✅",
      description = "Add, update, or pass tests."
    },
    {
      value = "🔒️",
      description = "Fix security issues."
    },
    {
      value = "🔖",
      description = "Release / Version tags."
    },
    {
      value = "🚨",
      description = "Fix compiler / linter warnings."
    },
    {
      value = "🚧",
      description = "Work in progress."
    },
    {
      value = "💚",
      description = "Fix CI Build."
    },
    {
      value = "⬇️",
      description = "Downgrade dependencies."
    },
    {
      value = "⬆️",
      description = "Upgrade dependencies."
    },
    {
      value = "📌",
      description = "Pin dependencies to specific versions."
    },
    {
      value = "👷",
      description = "Add or update CI build system."
    },
    {
      value = "📈",
      description = "Add or update analytics or track code."
    },
    {
      value = "♻️",
      description = "Refactor code."
    },
    {
      value = "➕",
      description = "Add a dependency."
    },
    {
      value = "➖",
      description = "Remove a dependency."
    },
    {
      value = "🔧",
      description = "Add or update configuration files."
    },
    {
      value = "🔨",
      description = "Add or update development scripts."
    },
    {
      value = "🌐",
      description = "Internationalization and localization."
    },
    {
      value = "✏️",
      description = "Fix typos."
    },
    {
      value = "💩",
      description = "Write bad code that needs to be improved."
    },
    {
      value = "⏪️",
      description = "Revert changes."
    },
    {
      value = "🔀",
      description = "Merge branches."
    },
    {
      value = "📦️",
      description = "Add or update compiled files or packages."
    },
    {
      value = "👽️",
      description = "Update code due to external API changes."
    },
    {
      value = "🚚",
      description = "Move or rename resources (e.g. = files, paths, routes)."
    },
    {
      value = "📄",
      description = "Add or update license."
    },
    {
      value = "💥",
      description = "Introduce breaking changes."
    },
    {
      value = "🍱",
      description = "Add or update assets."
    },
    {
      value = "♿️",
      description = "Improve accessibility."
    },
    {
      value = "💡",
      description = "Add or update comments in source code."
    },
    {
      value = "🍻",
      description = "Write code drunkenly."
    },
    {
      value = "💬",
      description = "Add or update text and literals."
    },
    {
      value = "🗃️" ,
      description = "Perform database related changes."
    },
    {
      value = "🔊",
      description = "Add or update logs."
    },
    {
      value = "🔇",
      description = "Remove logs."
    },
    {
      value = "👥",
      description = "Add or update contributor(s)."
    },
    {
      value = "🚸",
      description = "Improve user experience / usability."
    },
    {
      value = "🏗️" ,
      description = "Make architectural changes."
    },
    {
      value = "📱",
      description = "Work on responsive design."
    },
    {
      value = "🤡",
      description = "Mock things."
    },
    {
      value = "🥚",
      description = "Add or update an easter egg."
    },
    {
      value = "🙈",
      description = "Add or update a .gitignore file."
    },
    {
      value = "📸",
      description = "Add or update snapshots."
    },
    {
      value = "⚗️",
      description = "Perform experiments."
    },
    {
      value = "🔍️",
      description = "Improve SEO."
    },
    {
      value = "🏷️" ,
      description = "Add or update types."
    },
    {
      value = "🌱",
      description = "Add or update seed files."
    },
    {
      value = "🚩",
      description = "Add, update, or remove feature flags."
    },
    {
      value = "🥅",
      description = "Catch errors."
    },
    {
      value = "💫",
      description = "Add or update animations and transitions."
    },
    {
      value = "🗑️" ,
      description = "Deprecate code that needs to be cleaned up."
    },
    {
      value = "🛂",
      description = "Work on code related to authorization, roles and permissions."
    },
    {
      value = "🩹",
      description = "Simple fix for a non-critical issue."
    },
    {
      value = "🧐",
      description = "Data exploration/inspection."
    },
    {
      value = "⚰️",
      description = "Remove dead code."
    },
    {
      value = "🧪",
      description = "Add a failing test."
    },
    {
      value = "👔",
      description = "Add or update business logic"
    },
    {
      value = "🩺",
      description = "Add or update healthcheck."
    }
}

local config = {
  action = function(emoji)
    -- TODO: let user configure this function
    vim.api.nvim_input(':G commit -m "' .. emoji.value .. ' "<Left>')
  end,
}

local setup = function (opts)
  if opts then
    config = vim.tbl_extend("force", config, opts)
  end
end

local function search(opts)
  local displayer = entry_display.create({
    separator = " ",
    items = {
      { width = 40 },
      { width = 18 },
      { remaining = true },
    },
  })
  local make_display = function(entry)
    return displayer({
      entry.value .. " " .. entry.description,
    })
  end

  pickers.new(opts, {
    prompt_title = "Gitmojis",
    sorter = conf.generic_sorter(opts),
    finder = finders.new_table({
      results = emojis,
      entry_maker = function(emoji)
        return {
          ordinal = emoji.description,
          display = make_display,

          value = emoji.value,
          description = emoji.description,
        }
      end,
    }),
    attach_mappings = function(prompt_bufnr)
      actions.select_default:replace(function()
        local emoji = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        config.action(emoji)
      end)
      return true
    end,
  }):find()
end

return require("telescope").register_extension {
  exports = {
    search = search,
    setup = setup
  }
}