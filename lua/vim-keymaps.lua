vim.g.mapleader = " "

vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

vim.keymap.set('n', '<S-l>', ':BufferNext<CR>')
vim.keymap.set('n', '<S-h>', ':BufferPrevious<CR>')
vim.keymap.set('n', '<leader>bc', ':BufferClose<CR>')
vim.keymap.set('n', '<leader>bC', ':BufferCloseAllButCurrent<CR>')


