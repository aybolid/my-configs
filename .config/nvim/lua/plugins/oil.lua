return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    skip_confirm_for_simple_edits = true,
    prompt_save_on_select_new_entry = true,
    default_file_explorer = true,
    columns = {
      'icon',
      'permissions',
      'size',
    },
    view_options = {
      show_hidden = true,
      natural_order = true,
    },
  },
  keys = {
    {
      '<leader>e',
      function()
        local oil = require 'oil'
        if oil.get_current_dir() ~= nil then
          oil.close()
        else
          oil.open()
        end
      end,
      mode = '',
      desc = 'Toggle File [E]xplorer',
    },
  },
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}
