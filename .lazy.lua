return {
  {
    -- The CI test harness uses a somewhat customized version of
    -- `mini.test` with a customized test file pattern (matches `busted`
    -- format AFAICT)
    --
    -- References:
    --
    -- - https://github.com/folke/lazy.nvim/blob/v11.16.2/lua/lazy/minit.lua#L148-L158
    -- - https://github.com/folke/lazy.nvim/blob/v11.16.2/lua/lazy/minit.lua#L112-L140
    "echasnovski/mini.test",

    -- This is optional so we don't force you to install it if you just run
    -- this file inside neovim + LazyVim.
    optional = true,
    opts = {
      collect = {
        find_files = function()
          return vim.fn.globpath("tests", "**/*_spec.lua", true, true)
        end,
      },
    },
  },
}
