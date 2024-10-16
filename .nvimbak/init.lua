vim.cmd("set relativenumber")
vim.cmd("set number")
vim.opt.mouse = "a"
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true
vim.opt.ignorecase = true
vim.opt.virtualedit = "block"
vim.opt.scrolloff = 999




-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup mapleader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim with individual plugin files
require("lazy").setup({
  require("plugins.catppuccin"),
  require("plugins.telescope"),
  require("plugins.treesitter"),
  require("plugins.neo-tree"),
  require("plugins.lualine"),
  require("plugins.vimbegood"),
  require("plugins.lsp"),
  -- Add more plugins here as needed
  install = { colorscheme = { "catppuccin" } },
  checker = { enabled = true },
})

-- Apply the colorscheme
vim.cmd([[colorscheme catppuccin]])

-- Setup Telescope key bindings
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyDone",
  callback = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
  end,
})



