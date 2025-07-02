return {
  {
    'stevearc/oil.nvim',
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    lazy = false,
    config = function()
      require('oil').setup {
        columns = { 'icon' },
        keymaps = {
          ['<C-h>'] = false,
          ['<C-l>'] = false,
          ['<C-k>'] = false,
          ['<C-j>'] = false,
          ['<M-h>'] = 'actions.select_split',
        },
        view_options = {
          show_hidden = true,
        },
        win_options = {
          signcolumn = 'yes:2',
        },
      }

      -- Open parent directory in floating window (with '-')
      vim.keymap.set('n', '<leader>eo', require('oil').open_float, { desc = 'Open [O]il in floating window' })

      -- Close Oil floating window with <Esc>
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'oil',
        callback = function(args)
          local winid = vim.api.nvim_get_current_win()
          local config = vim.api.nvim_win_get_config(winid)
          if config.relative ~= '' then
            vim.keymap.set('n', '<Esc>', '<CMD>q<CR>', { buffer = args.buf, silent = true })
          end
        end,
      })
    end,
  },
  {
    'refractalize/oil-git-status.nvim',
    dependencies = { 'stevearc/oil.nvim' },
    config = function()
      require('oil-git-status').setup {
        show_ignored = true, -- Display files ignored by Git
        symbols = {
          index = {
            ['A'] = '✚', -- Added
            ['D'] = '✖', -- Deleted
            ['M'] = '', -- Modified
            ['R'] = '➜', -- Renamed
            ['C'] = '', -- Copied
            ['T'] = '', -- Type changed
            ['U'] = '', -- Unmerged
            ['?'] = '?', -- Untracked
            ['!'] = '', -- Ignored
          },
          working_tree = {
            ['A'] = '+', -- Added
            ['D'] = '✖', -- Deleted
            ['M'] = '', -- Modified
            ['R'] = '➜', -- Renamed
            ['C'] = '', -- Copied
            ['T'] = '', -- Type changed
            ['U'] = '', -- Unmerged
          },
        },
      }
    end,
  },
}
