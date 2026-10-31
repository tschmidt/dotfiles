-- Argonaut is a Neovim extension for manipulating function arguments, lists,
-- and dictionaries
return {
  "https://git.sr.ht/~foosoft/argonaut.nvim",
  opts = {
    brace_pad = false,
    by_filetype = {
      lua = { comma_last = true },
      json = { comma_last = false },
      ruby = { comma_last = true },
    },
  },
  keys = {
    {
      "<leader>pa",
      ":<c-u>ArgonautToggle<cr>",
      desc = "Call ArgonautToggle",
    },
  },
}
