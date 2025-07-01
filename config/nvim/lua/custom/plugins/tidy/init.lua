-- Removes trailing whitespace and empty lines at EOF on save
return {
  'mcauley-penney/tidy.nvim',
  opts = {
    enabled_on_save = true,
    provide_undefined_editorconfig_behavior = true
  },
  init = function ()
    vim.keymap.set('n', '<leader>tt', require('tidy').toggle, {})
    vim.keymap.set('n', '<leader>tr', require('tidy').run, {})
  end
}
