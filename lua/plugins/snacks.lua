return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      dashboard = {
        ---@class snacks.dashboard.Config
        preset = {
          keys = {
            {
              icon = ' ',
              key = 'f',
              desc = 'Find File',
              action = function()
                require('snacks').picker.files()
              end,
            },
            {
              icon = ' ',
              key = 'n',
              desc = 'New File',
              action = ':ene | startinsert',
            },
            {
              icon = ' ',
              key = 'g',
              desc = 'Find Text',
              action = ":lua Snacks.dashboard.pick('live_grep')",
            },
            {
              icon = ' ',
              key = 'r',
              desc = 'Recent Files',
              action = ":lua Snacks.dashboard.pick('oldfiles')",
            },
            {
              icon = ' ',
              key = 'c',
              desc = 'Config',
              action = function()
                require('snacks').picker.files { cwd = vim.fn.stdpath 'config' }
              end,
            },
            {
              icon = ' ',
              key = 's',
              desc = 'Restore Session',
              section = 'session',
            },
            {
              icon = '󰒲 ',
              key = 'L',
              desc = 'Lazy',
              action = ':Lazy',
              enabled = package.loaded.lazy ~= nil,
            },
            {
              icon = ' ',
              key = 'q',
              desc = 'Quit',
              action = ':qa',
            },
          },
        },
        sections = {
          { section = 'header' },
          { icon = ' ', title = 'Keymaps', section = 'keys', indent = 2, padding = 1 },
          { icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
          { icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 1 },
          { section = 'startup' },
        },
      },
    },
    explorer = {
      layout = {
        cycle = false,
      },
    },
    picker = {
      enabled = true,
      matchers = {
        frecency = true,
        cwd_bonus = false,
      },
      formatters = {
        file = {
          filename_first = false,
          filename_only = false,
          icon_width = 2,
        },
      },
      layout = {
        -- presets options : "default" , "ivy" , "ivy-split" , "telescope" , "vscode", "select" , "sidebar"
        -- override picker layout in keymaps function as a param below
        preset = 'telescope', -- defaults to this layout unless overidden
        cycle = false,
      },
      layouts = {
        select = {
          preview = false,
          layout = {
            backdrop = false,
            width = 0.6,
            min_width = 80,
            height = 0.4,
            min_height = 10,
            box = 'vertical',
            border = 'rounded',
            title = '{title}',
            title_pos = 'center',
            { win = 'input', height = 1, border = 'bottom' },
            { win = 'list', border = 'none' },
            { win = 'preview', title = '{preview}', width = 0.6, height = 0.4, border = 'top' },
          },
        },
        telescope = {
          reverse = true, -- set to false for search bar to be on top
          layout = {
            box = 'horizontal',
            backdrop = false,
            width = 0.8,
            height = 0.9,
            border = 'none',
            {
              box = 'vertical',
              { win = 'list', title = ' Results ', title_pos = 'center', border = 'rounded' },
              { win = 'input', height = 1, border = 'rounded', title = '{title} {live} {flags}', title_pos = 'center' },
            },
            {
              win = 'preview',
              title = '{preview:Preview}',
              width = 0.50,
              border = 'rounded',
              title_pos = 'center',
            },
          },
        },
        ivy = {
          layout = {
            box = 'vertical',
            backdrop = false,
            width = 0,
            height = 0.4,
            position = 'bottom',
            border = 'top',
            title = ' {title} {live} {flags}',
            title_pos = 'left',
            { win = 'input', height = 1, border = 'bottom' },
            {
              box = 'horizontal',
              { win = 'list', border = 'none' },
              { win = 'preview', title = '{preview}', width = 0.5, border = 'left' },
            },
          },
        },
      },
    },
    keys = {
      -- Explorer
      {
        '<leader>ee',
        function()
          require('snacks').explorer()
        end,
        desc = 'Open [Explorer]',
      },

      -- Lazygit
      {
        '<leader>lg',
        function()
          require('snacks').lazygit()
        end,
        desc = '[L]azy[G]it',
      },
      {
        '<leader>ll',
        function()
          require('snacks').lazygit.log()
        end,
        desc = '[L]azygit [L]ogs',
      },

      -- Snacks Picker
      {
        '<leader>sf',
        function()
          require('snacks').picker.files()
        end,
        desc = '[S]earch [F]iles',
      },
      {
        '<leader>sc',
        function()
          require('snacks').picker.files { cwd = vim.fn.stdpath 'config' }
        end,
        desc = '[S]earch [C]onfig',
      },
      {
        '<leader>sw',
        function()
          if vim.fn.executable 'rg' == 1 then
            require('snacks').picker.grep()
          else
            vim.notify('Please install ripgrep (rg) to use this feature', vim.log.levels.WARN)
          end
        end,
        desc = '[S]earch [W]ord',
      },
      -- {
      --   '<leader>pws',
      --   function()
      --     require('snacks').picker.grep_word()
      --   end,
      --   desc = 'Search Visual selection or Word',
      --   mode = { 'n', 'x' },
      -- },
      {
        '<leader>sk',
        function()
          require('snacks').picker.keymaps { layout = 'ivy' }
        end,
        desc = '[S]earch [K]eymaps',
      },

      -- Git Stuff
      {
        '<leader>gbr',
        function()
          require('snacks').picker.git_branches { layout = 'select' }
        end,
        desc = 'Pick and Switch Git Branches',
      },

      -- Other
      {
        '<leader>sh',
        function()
          require('snacks').picker.help()
        end,
        desc = '[S]earch [H]elp Pages',
      },
    },
  },
}
