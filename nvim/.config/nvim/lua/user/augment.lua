vim.g.augment_workspace_folders = {
    '/Users/rhoulihan/work/kernel',
    '/Users/rhoulihan/work/fusion',
    '/Users/rhoulihan/work/purity',
    '/Users/rhoulihan/work/iridium',
    '/Users/rhoulihan/work/photon',
    '/Users/rhoulihan/work/swagger',
    '/Users/rhoulihan/work/cybertron',
    '/Users/rhoulihan/work/pure_tools',
    '/Users/rhoulihan/work/fusion-shared',
    '/Users/rhoulihan/work/smart-signals',
    '/Users/rhoulihan/nvim-config'
}

vim.g.augment_chat_history_per_project = true
vim.g.augment_chat_history_per_directory = true

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>gn", ":Augment chat-new<CR>", opts)
keymap("n", "<leader>ga", ":Augment chat<CR>", opts)
keymap("n", "<leader>gt", ":Augment chat-toggle<CR>", opts)
keymap("i", "<C-y>", "<cmd>call augment#Accept()<CR>", opts)
