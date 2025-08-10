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
  'https://github.com/johnseth97/codex.nvim.git',
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

require('codex').setup({
  lazy = true,
  opts = {
    keymaps     = {},         -- Disable internal default keymap (<leader>cc -> :CodexToggle)
    border      = 'rounded',  -- Options: 'single', 'double', or 'rounded'
    width       = 0.8,        -- Width of the floating window (0.0 to 1.0)
    height      = 0.8,        -- Height of the floating window (0.0 to 1.0)
    model       = nil,        -- Optional: pass a string to use a specific model (e.g., 'o3-mini')
    autoinstall = true,       -- Automatically install the Codex CLI if not found
  }
})
