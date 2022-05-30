# Contributing

## Running Tests

### In the terminal

```bash
# (make sure to use GNU Make)
make test
```

### In Neovim

Install plugins:
* [vim-test](https://github.com/vim-test/vim-test)
* [plenary](https://github.com/nvim-lua/plenary.nvim)

It is recommended to have the following in `.vim/ftplugin/lua.lua` with `.vim` added to `runtimepath`.
```lua
-- .vim/ftplugin/lua.lua

local filename = vim.fn['expand']('%:t')

if filename:find('_spec.lua$') then
  -- vim-test doesn't support Plenary
  vim.keymap.set('n', '<leader>rt', '<Plug>PlenaryTestFile', { buffer = true })
end
```

Then `<leader>rt` will run tests in the current test buffer.

