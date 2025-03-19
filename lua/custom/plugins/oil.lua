return {
  'stevearc/oil.nvim',

  dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  config = function()
    require('oil').setup {

      view_options = {
        show_hidden = true,
      },
      default_file_explorer = true,
    }

    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

    vim.keymap.set('n', '<space>-', require('oil').toggle_float)
    vim.api.nvim_set_keymap('n', 'yp', '', {
      noremap = true,
      silent = true,
      callback = function()
        local entry = require('oil').get_cursor_entry()
        local dir = require('oil').get_current_dir()

        local relpath = vim.fn.fnamemodify(dir, ':p')
        vim.fn.setreg('+', relpath .. '/' .. entry.name)
      end,
    })
  end,
}
