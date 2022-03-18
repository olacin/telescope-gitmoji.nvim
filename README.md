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
                --     display = "🎨 Improve structure / format of the code.",
                --     index = 1,
                --     ordinal = "Improve structure / format of the code.",
                --     value = "🎨"
                -- }
                vim.ui.input({ prompt = "Enter commit msg: " .. entry.value .. " "}, function(msg)
                    if not msg then
                        return
                    end
                    vim.cmd(':G commit -m "' .. entry.value .. ' ' .. msg .. '"')
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
function(emoji)
    vim.api.nvim_input(':G commit -m "' .. emoji.value .. ' "<Left>')
end
```
