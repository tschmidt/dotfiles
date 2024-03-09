-- A blazing fast and easy to configure neovim statusline plugin written in pure
-- lua.
-- https://github.com/nvim-lualine/lualine.nvim
return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  -- See `:help lualine.txt` for more options
  opts = {
    options = {
      icons_enabled = true,
      -- theme = 'tokyonight',
      -- component_separators = { left = '', right = '' },
      -- section_separators = { left = '', right = '' },
    },
    sections = {
      lualine_c = { { 'filename', path = 1 } },
    },
  },
}
