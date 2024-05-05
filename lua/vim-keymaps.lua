vim.g.mapleader = " "

vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to the left window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to the down window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to the up window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to the right window' })

vim.keymap.set('n', '<S-l>', ':BufferNext<CR>', { desc = 'Move to the next buffer' })
vim.keymap.set('n', '<S-h>', ':BufferPrevious<CR>', { desc = 'Move to the previous buffer' })
vim.keymap.set('n', '<leader>bc', ':BufferClose<CR>', { desc = 'Close the current buffer' })
vim.keymap.set('n', '<leader>bC', ':BufferCloseAllButCurrent<CR>', { desc = 'Close all buffers except the current one' })


