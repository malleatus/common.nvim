local malleatus = require('malleatus')

-- see <https://github.com/nvim-lua/plenary.nvim/blob/master/TESTS_README.md>
-- see <http://olivinelabs.com/busted/#asserts>

describe('malleatus', function()
  describe('.setup', function()
    it('runs without configuration', function()
      assert.equals(true, pcall(malleatus.setup))
    end)

    it('sets reasonable options', function()
      malleatus.setup()

      assert.equals(true, vim.o.hlsearch)
      assert.equals(true, vim.o.smartcase)
    end)

    it('opts in to ftdetect.lua', function()
      malleatus.setup()
      assert.equals(1, vim.g.do_filetype_lua)
      assert.equals(0, vim.g.did_load_filetypes)
    end)
  end)
end)
