return {
  {
    'preservim/nerdtree',
    dependencies = { 'Xuyuanp/nerdtree-git-plugin' },
    keys = {
      { '<leader>t', ':NERDTreeToggle<cr>', desc = 'Toggle NERDTree' },
      { '<leader>f', ':NERDTreeFind<cr>', desc = 'Find in NERDTree' }
    }
  }
}
