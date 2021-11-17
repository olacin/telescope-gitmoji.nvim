# telescope-gitmoji.nvim

A Telescope integration of [gitmoji](https://gitmoji.dev/).

## Installation

```
Plug 'olacin/telescope-gitmoji.nvim'
```

## Setup

```lua
require("telescope").load_extension("gitmoji")
```

## Usage

```
:Telescope gitmoji search
```

## Configuration (WIP)

You can customize action on selection within `setup()` function.

```lua
-- Default action (here with tpope vim-fugitive)
function(emoji)
    vim.api.nvim_input(':G commit -m "' .. emoji.value .. ' "<Left>')
end
```