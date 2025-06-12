local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
local keep_unmap = vim.api.nvim_del_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

------------
-- Normal --
------------
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Managed splits
keymap("n", "<leader>vs", ":vsplit<CR>", opts)
keymap("n", "<leader>hs", ":split<CR>", opts)

-- Rezise splits
keymap("n", "<A-h>", ":vertical resize -5<CR>", opts)
keymap("n", "<A-l>", ":vertical resize +5<CR>", opts)
keymap("n", "<A-Down>", ":horizontal resize -5<CR>", opts)
keymap("n", "<A-Up>", ":horizontal resize +5<CR>", opts)

-- Close the current tab
keymap("n", "<leader>w", ":bp|bd#<CR>", opts)

-- Move a line up or down with alt j and k
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)

-- Make Y do what you would expect
keymap("n", "Y", "y$", opts)

-- Keep cursor centered
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Next and previous buffer but faster
keymap("n", "<leader>n", ":bn<CR>", opts)
keymap("n", "<leader>p", ":bp<CR>", opts)

-- toggle highlight search
keymap("n", "<leader>s", ":set hlsearch!<CR>", opts)

-- toggle indent lines
keymap("n", "<leader>it", ":IndentLinesToggle<CR>", opts)

-- open Git console
keymap("n", "<leader>gs", ":Git<CR>", opts)

-- Add relative lines jumps to the jumps List
-- TODO: figure our how to do the exp thing below
-- nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
-- nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

-- Toggle nvim-tree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope mappings
keymap("n", "<leader>b", "<cmd>lua require('telescope.builtin').buffers()<CR>", opts)
keymap("n", "<leader>gg", "<cmd>lua require('telescope.builtin').git_status()<CR>", opts)
keymap("n", "<C-p>", "<cmd>lua require('telescope.builtin').find_files( {path_display = { 'absolute' }})<CR>", opts)
keymap("n", "<leader>gf", "<cmd>lua require('telescope.builtin').git_files()<CR>", opts)
keymap("n", "<C-f>", "<cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
keymap("n", "<A-f>", "<cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
keymap("n", "<leader>to", "<cmd>lua require('telescope.builtin').lsp_document_symbols(require('telescope.themes').get_dropdown())<CR>", opts)
keymap("n", "gr", "<cmd>lua require('telescope.builtin').lsp_references(require('telescope.themes').get_ivy())<CR>", opts)
keymap("n", "<leader>gk", "<cmd> lua require('telescope.builtin').keymaps()<CR>", opts)
keymap("n", "<leader>gw", "<cmd> lua require('telescope.builtin').git_branches()<CR>", opts)

-- Debugger mappings
keymap("n", "<F5>", "<cmd>lua require('dap').continue()<CR>", opts)
keymap("n", "<F10>", "<cmd>lua require('dap').step_over()<CR>", opts)
keymap("n", "<F11>", "<cmd>lua require('dap').step_into()<CR>", opts)
keymap("n", "<F12>", "<cmd>lua require('dap').step_out()<CR>", opts)
keymap("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>", opts)
keymap("n", "<leader>dc", "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
keymap("n", "<leader>dt", "<cmd>lua require('dap').terminate()<CR>", opts)
keymap("n", "<leader>dd", "<cmd>lua require('dap').disconnect()<CR>", opts)
keymap("n", "<leader>dl", "<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", opts)
keymap("n", "<leader>du", "<cmd>lua require('dapui').toggle()<CR>", opts)

-- Toggle git blame line
keymap("n", "gb", ":GitBlameToggle<CR>", opts)

-- http client rest-nvim keymaps
keymap("n", "<leader>r", ":Rest run<CR>", opts)

-- set conceal level to 0
keymap("n", "<leader>co", ":set conceallevel=0<CR>", opts)

-- set conceal level to 3
keymap("n", "<leader>ct", ":set conceallevel=3<CR>", opts)

------------
-- Insert --
------------
-- Move a line up or down with alt j and k
keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

------------
-- Visual --
------------
-- Move a line up or down with alt j and k
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
