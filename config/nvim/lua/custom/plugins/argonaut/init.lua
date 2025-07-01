-- Argonaut is a Neovim extension for manipulating function arguments, lists,
-- and dictionaries
return {
  "https://git.sr.ht/~foosoft/argonaut.nvim",
  opts = { comma_last = true },
  keys = {
    {
      '<leader>a',
      ':<c-u>ArgonautToggle<cr>',
      desc = 'Call ArgonautToggle',
    }
  }
}
