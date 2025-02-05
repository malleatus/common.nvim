# Contributing

## Running Tests

### In the terminal

```bash
./scripts/test
```

### In Neovim

Install [echasnovski/mini.test](https://github.com/echasnovski/mini.test/).

**Running All Tests**

```
:lua require('mini.test').run()
```

**Running Current File**

```
:lua require('mini.test').run_file()
```

**Running Test at Current Location**

```
:lua require('mini.test').run_at_location()
```
