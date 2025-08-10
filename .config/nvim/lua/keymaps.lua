local keymap = vim.keymap
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
keymap.set('n', 'sh', '<C-w>h')
keymap.set('n', 'sk', '<C-w>k')
keymap.set('n', 'sj', '<C-w>j')
keymap.set('n', 'sl', '<C-w>l')

keymap.set('n', '<c-t>', ':tabnew<CR>', { noremap = true, silent = true })
keymap.set('n', '<c-w>', ':tabclose<CR>', { noremap = true, silent = true })
keymap.set('n', '<c-tab>', ':tabnext<CR>', { noremap = true, silent = true })
keymap.set('n', '<c-s-tab>', ':tabprevious<CR>', { noremap = true, silent = true })

keymap.set('n', '<leader>t', ':terminal<CR>i', { noremap = true, silent = true })
keymap.set({ 'i', 'v', 'x', 's', 't' },'<c-\\>','<C-\\><C-n>',{noremap = true})

keymap.set('n', '<leader>f', ':Oil<CR>', { noremap = true, silent = true })
keymap.set('n', '<leader>c', ':CodexToggle<CR>', { noremap = true, silent = true })

local wk = require("which-key")
wk.add({
  { "<leader>g", group = "Git" },
  { "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", desc = "Blame line" },
  { "<leader>gc", _git_checkout_branch, desc = "Checkout branch" },
  { "<leader>gd", "<cmd>Gitsigns diffthis<CR>", desc = "Diff this file" },
  { "<leader>gf", _lazygit_toggle_file_history, desc = "File history (lazygit -f)" },
  { "<leader>gg", _lazygit_toggle_repo, desc = "Lazygit (repo)" },
  { "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", desc = "Reset hunk" },
  { "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", desc = "Stage hunk" },
  { "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<CR>", desc = "Undo stage hunk" }
})
