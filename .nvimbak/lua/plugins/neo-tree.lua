-- ~/.config/nvim/lua/plugins/neo-tree.lua

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- Recommended for icons
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Uncomment if you want optional image support
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          visible = true, -- Show files that match the filter
          hide_dotfiles = false, -- Show dotfiles
        },
      },
    })

    -- Keymap to toggle neo-tree with <C-f>
    vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>', { noremap = true, silent = true })
    --vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', { noremap = true, silent = true })
  end,
}

