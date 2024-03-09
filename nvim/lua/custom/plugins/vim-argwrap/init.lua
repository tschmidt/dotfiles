-- Industrial strength argument wrapping and unwrapping extension
-- for the Vim text editor.
-- https://github.com/FooSoft/vim-argwrap
return {
  'FooSoft/vim-argwrap',
  config = function()
    vim.g.argwrap_tail_comma = true
  end,
  keys = { { '<Leader>a', ':ArgWrap<CR>', noremap = true, silent = true } },
}
