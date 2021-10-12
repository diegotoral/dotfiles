local cmd = vim.cmd
local map = vim.api.nvim_set_keymap

-- Make life easier regards to typos
cmd(':command! W w')
cmd(':command! Q q')
cmd(':command! Qa qa')
cmd(':command! Wq wq')
cmd(':command! Bd bd')

-- Quicky window movements
map('n', '<C-J>', '<C-W><C-J>', {})
map('n', '<C-K>', '<C-W><C-K>', {})
map('n', '<C-L>', '<C-W><C-L>', {})
map('n', '<C-H>', '<C-W><C-H>', {})

map('n', '<C-n>', '<cmd>NvimTreeToggle<cr>', {})

-- Telescope keybinds
map('n', '<C-P>', '<cmd>Telescope find_files<cr>', {})
map('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>", {})
map('n', '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>", {})
map('n', '<leader>ft', "<cmd>lua require('telescope.builtin').treesitter()<cr>", {})
