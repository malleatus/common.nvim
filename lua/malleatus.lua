local function setup_config()

  ---use comma as <leader> (default \)
  vim.g.mapleader      = ','
  vim.g.maplocalleader = ','

  vim.o.compatible  = false -- compatible with what? vi? come on
  vim.o.hidden      = true -- allow buffer switching without saving
  vim.o.history     = 10000 -- we can afford a larger history (default 20)
  vim.o.updatetime  = 100 -- ensure GitGutter and other plugins
  vim.o.timeout     = true
  vim.o.timeoutlen  = 1000
  vim.o.ttimeoutlen = 50
  vim.o.swapfile    = false -- don't write swap files
  vim.o.mouse       = 'a' -- allow resizing windows via the mouse
  vim.o.undofile    = true -- preserve undo history across sessions
  vim.o.lazyredraw  = true -- don't redraw during macros
  vim.o.shm         = 'filnxtToOFsAIc' -- disable some vim messages

  ---whitespace
  vim.o.wrap          = true -- wrap lines
  vim.o.sidescrolloff = 8 -- left-right context when wrap=false
  -- no effect when wrap=true
  vim.o.tabstop       = 2 -- tab at two spaces
  vim.o.shiftwidth    = 2 -- autoindent at 2, i.e. match the tabstop
  vim.o.smartindent   = true -- insert indents automatically
  vim.o.expandtab     = true -- always use spaces not tabs
  vim.o.autoindent    = true -- indent in insert mode
  vim.o.joinspaces    = false -- don't add two spaces after . on join
  vim.o.shiftround    = true -- always indent to a multiple of shiftwidth

  ---gutters
  vim.o.signcolumn     = 'yes' -- always show the sign column
  vim.o.number         = true -- show line numbers
  vim.o.relativenumber = true -- line numbers relative to cursor
  vim.o.numberwidth    = 3
  vim.o.ruler          = true -- show line and column number

  ---windows
  vim.o.splitbelow = true -- always split below current window
  vim.o.splitright = false -- always split to the right

  -- completion
  vim.o.wildmode = 'list:longest,full' -- first tab show longest matching substring
  -- second tab, complete
  vim.o.completeopt = 'menu,noinsert,noselect' -- completion options

  -- backspace through everything in insert mode
  vim.opt.backspace = { 'indent', 'eol', 'start' }

  ---scrolling
  vim.o.cursorline = true -- highlight the line the cursor is on
  vim.o.scrolloff = 3 -- minimum lines to keep above and below cursor

  ---character rendering
  vim.o.list = true -- show invisible characters
  vim.opt.listchars = {
    tab = '▸ ', -- a tab should display as '▸ ', trailing whitespace as '.'
    trail = '•', -- show trailing spaces as dots
    eol = '¬', -- show eol as '¬'
    extends = '>', -- The character to show in the last column when wrap is
    -- off and the line continues beyond the right of the screen
    precedes = '<', -- The character to show in the last column when wrap is
    nbsp = '.' -- non-breaking space
  }
  vim.o.conceallevel = 2 -- conceal some text when on a different line, based on synta highlighting

  ---searching
  vim.o.hlsearch = true -- highlight matches
  vim.o.incsearch = true -- incremental searching
  vim.o.ignorecase = true -- searches are case insensitive...
  vim.o.smartcase = true -- ... unless they contain an upper-case character
  vim.keymap.set('n', '/', '/\\v') -- make searches very magic by default.  Not Perl regex, but better than regular vim regex

  -- when to open folds
  vim.opt.foldopen = {
    'block', -- block movement
    'hor', -- horizontal movement
    'insert', -- anything in insert mode
    'jump', -- far jumps (G, gg, &c.)
    'mark', -- jumping to mark
    'percent', -- % (i.e. jump to matching brace)
    'quickfix', -- :cn, :crew, :make &c.
    'tag', -- jumping to a tag (but really who uses tags when you have LSPs)
    'undo' -- open folds when undoing
  }

  -- TODO: check rg is in path
  vim.o.grepprg = 'rg --vimgrep' -- always use rg when you can
end

local function setup_ftdetect()
  -- use filetype.lua instead of filetype.vim
  vim.g.do_filetype_lua = 1
  vim.g.did_load_filetypes = 0

  vim.filetype.add({
    extension = {
      pdsc = 'json',
      src = 'xml',
    },
  })
end

local function setup(config)
  setup_config()
  setup_ftdetect()
end

return {
  setup = setup,
}
