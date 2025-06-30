return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',   -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
      { '3rd/image.nvim', opts = {} }, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    lazy = false,                      -- neo-tree will lazily load itself
    ---@module "neo-tree"
    ---@type neotree.Config?
    opts = {
      filesystem = {
        filtered_items = {
          visible = true
        }
      }
    },
    config = function(_, opts)
      require('neo-tree').setup(opts)
      -- Set <leader>t to toggle Neo-tree
      vim.keymap.set('n', '<leader>tt', '<cmd>Neotree toggle<CR>',
        { noremap = true, silent = true, desc = 'Toggle Neo-[t]ree' })
    end,
  },
}
