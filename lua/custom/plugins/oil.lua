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
  end,
}
