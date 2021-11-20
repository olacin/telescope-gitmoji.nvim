# telescope-gitmoji.nvim

A Telescope integration of [gitmoji](https://gitmoji.dev/).

## Installation

```
Plug 'olacin/telescope-gitmoji.nvim'
```

## Usage

```
:Telescope gitmoji search
```

## 🚧 Configuration

You can customize action on selection within `setup()` function.

```lua
-- Default action (here with tpope vim-fugitive)
function(emoji)
    vim.api.nvim_input(':G commit -m "' .. emoji.value .. ' "<Left>')
end
```
