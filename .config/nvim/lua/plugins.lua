vim.pack.add({
  'https://github.com/stevearc/oil.nvim.git',
  'https://github.com/github/copilot.vim.git',
  'https://github.com/nvim-lualine/lualine.nvim.git',
  'https://github.com/MunifTanjim/nui.nvim.git',
  'https://github.com/junegunn/fzf.vim.git',
  'https://github.com/nvim-lualine/lualine.nvim.git',
  'https://github.com/shellRaining/hlchunk.nvim.git',
  'https://github.com/folke/which-key.nvim.git',
  'https://github.com/numToStr/Comment.nvim.git',
  'https://github.com/JoosepAlviste/nvim-ts-context-commentstring.git',
  'https://github.com/lewis6991/gitsigns.nvim.git',
  'https://github.com/sindrets/diffview.nvim.git',
  'https://github.com/akinsho/toggleterm.nvim.git',
})

require('oil').setup({
  default_file_explorer = true,
  columns = {
    "icon",
  },
  view_options = {
    show_hidden = true,
  },
})

require('lualine').setup()
require('hlchunk').setup({
    chunk = {
        enable = true,
        duration = 0,
        delay = 0,
    },
    indent = {
        enable = true
    }
})
require("which-key").setup()
require('Comment').setup()
require('ts_context_commentstring').setup{}
require("toggleterm").setup{
  size = 100,
  open_mapping = [[<c-t>]],
  start_in_insert = true,
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  insert_mappings = true,
  persist_size = true,
  direction = 'float',
  close_on_exit = true,
  shell = vim.o.shell,
}
