-- You can add your own plugins here or in other files in this directory!
--
return {
  -- Detect tabstop and shiftwidth automatically
  'NMAC427/guess-indent.nvim',

  -- Highlight todo, notes, etc in comments
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      signs = false,
    },
  },

  -- Show which LSP is loaded
  {
    'j-hui/fidget.nvim',
    opts = {},
  },
}
