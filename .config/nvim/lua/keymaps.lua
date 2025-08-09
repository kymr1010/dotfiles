local keymap = vim.keymap
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
keymap.set('n', 'sh', '<C-w>h')
keymap.set('n', 'sk', '<C-w>k')
keymap.set('n', 'sj', '<C-w>j')
keymap.set('n', 'sl', '<C-w>l')

keymap.set('n', '<leader>t', ':terminal<CR>i', { noremap = true, silent = true })
keymap.set({ 'i', 'v', 'x', 's', 't' },'<c-\\>','<C-\\><C-n>',{noremap = true})

keymap.set('n', '<c-f>', ':Oil<CR>', { noremap = true, silent = true })
keymap.set('n', '<c-c>', ':Copilot<CR>', { noremap = true, silent = true })
keymap.set('n', '<c-g>', '<cmd>lua _lazygit_toggle()<CR>', { noremap = true, silent = true })
keymap.set('n', '<c-t>', ':ToggleTerm<CR>', { noremap = true, silent = true })

