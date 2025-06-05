-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- { 'mason-org/mason.nvim', version = '^1.0.0' },
  -- { 'mason-org/mason-lspconfig.nvim', version = '^1.0.0' },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup {
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      }
    end,
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
  },
  'tpope/vim-fugitive',
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  {
    'lewis6991/hover.nvim',
    config = function()
      require('hover').setup {
        init = function()
          -- Require providers
          require 'hover.providers.lsp'
          -- require('hover.providers.gh')
          -- require('hover.providers.gh_user')
          -- require('hover.providers.jira')
          -- require('hover.providers.dap')
          -- require('hover.providers.fold_preview')
          require 'hover.providers.diagnostic'
          -- require('hover.providers.man')
          -- require('hover.providers.dictionary')
          -- require('hover.providers.highlight')
        end,
        preview_opts = {
          border = 'single',
        },
        -- Whether the contents of a currently open hover window should be moved
        -- to a :h preview-window when pressing the hover keymap.
        preview_window = false,
        title = true,
        mouse_providers = {
          'LSP',
        },
        mouse_delay = 1000,
        -- -- Setup keymaps
        vim.keymap.set('n', 'gh', require('hover').hover, { desc = 'hover.nvim' }),
        vim.keymap.set('n', 'gH', require('hover').hover_select, { desc = 'hover.nvim (select)' }),
        vim.keymap.set('n', '<C-p>', function()
          require('hover').hover_switch 'previous'
        end, { desc = 'hover.nvim (previous source)' }),
        vim.keymap.set('n', '<C-n>', function()
          require('hover').hover_switch 'next'
        end, { desc = 'hover.nvim (next source)' }),
      } -- Optional: Configure hover.nvim settings
    end,
  },

  {},
}
