local M = {}

local function check_or_install_paq()
  local paq_install_path = vim.fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'
  if vim.fn.empty(vim.fn.glob(paq_install_path)) > 0 then
    print('cloning paq-nvim')
    print(vim.fn.system({
      'git', 'clone', '--depth=1', 'https://github.com/savq/paq-nvim.git', paq_install_path
    }))

    if vim.fn.empty(vim.fn.glob(paq_install_path)) > 0 then
      error('Failed to install paq to "' .. paq_install_path .. '"')
    end

    vim.cmd('packadd paq-nvim')
  end
end

--- Installs missing plugins and updates existing plugins
function M.update_plugins()
  check_or_install_paq()

  local paq = require('paq')

  -- c.f https://github.com/tweekmonster/startuptime.vim
  paq {
    'savq/paq-nvim', -- let paq manage itself

    'nvim-lua/plenary.nvim', -- lots of lua utilities
  }

  paq.install() -- :he paq.install
end

return M
