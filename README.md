# telescope-gitmoji.nvim

A Telescope integration of [gitmoji](https://gitmoji.dev/).

## Installation

```
# vim-plug
Plug 'olacin/telescope-gitmoji.nvim'

# packer
use 'olacin/telescope-gitmoji.nvim'
```

## Usage

```
# As a command
:Telescope gitmoji

# As a lua function
require('telescope').extensions.gitmoji.gitmoji()
```

## Configuration

You can customize action on selection within Telescope `setup()` function.

```lua
telescope.setup({
    ...
    extensions = {
        gitmoji = {
            action = function(entry)
                -- entry = {
                --   display = "🐛 Fix a bug.",
                --   index = 4,
                --   ordinal = "Fix a bug.",
                --   value = {
                --     description = "Fix a bug.",
                --     text = ":bug:",
                --     value = "🐛"
                --   }
                -- }
                local emoji = entry.value.value
                vim.ui.input({ prompt = "Enter commit message: " .. emoji .. " "}, function(msg)
                    if not msg then
                        return
                    end
                    -- Insert text instead of emoji in message
                    local emoji_text = entry.value.text
                    vim.cmd(':G commit -m "' .. emoji_text .. ' ' .. msg .. '"')
                end)
            end,
        },
    },
})

telescope.load_extension("gitmoji")
```

### Default action

```lua
-- Default action (here with tpope vim-fugitive)
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
```

test
