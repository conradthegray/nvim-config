return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'marilari88/neotest-vitest',
      'nvim-neotest/neotest-jest',
    },
    keys = {
      { '<leader>tr', '<cmd>[R]un [T]est<cr>' },
      { '<leader>ti', '<cmd>[T]est Output<cr>' },
      { '<leader>ts', '<cmd>[T]est [S]ummary<cr>' },
      { '<leader>ta', "<cmd>lua require('neotest').run.run({ suite = true })<cr>" },
    },
    config = function()
      require('neotest').setup {
        settings = {
          watch = true,
        },
        adapters = {
          require 'neotest-vitest',
          require 'neotest-jest',
          require 'neotest-vim-test' {
            ignore_file_types = { 'python', 'vim', 'lua' },
          },
        },
      }
    end,
  },
}
