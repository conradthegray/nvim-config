return {
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup {
        options = {
          theme = 'catppuccin', -- Use the Catppuccin theme for lualine
          section_separators = '', -- Optional: adjust separators as needed
          component_separators = '',
          icons_enabled = true,
        },
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        -- You can further customise sections here:
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { { 'filename', path = 1 } },
          lualine_x = { 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
      }
    end,
  },
}
