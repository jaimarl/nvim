-- Leader ---------------------------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Window Management ----------------------------------------------------------
-- Exit Neovim
vim.keymap.set('n', '<C-c>', '<cmd>:qa<CR>')

-- Quickly switch between windows
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')


-- Search ---------------------------------------------------------------------
-- Reset search highlighting
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')


-- Text Editing ---------------------------------------------------------------
-- Save file
vim.keymap.set('n', '<C-s>', '<cmd>:w<CR>')
vim.keymap.set('i', '<C-s>', '<cmd>:w<CR>')

-- Paste in visual mode without replacing the clipboard
vim.keymap.set("v", "p", [["_dP]])

-- Move selected lines up/down
vim.keymap.set("v", "<M-k>", "<cmd>m '<-2<CR>gv=gv")
vim.keymap.set("v", "<M-j>", "<cmd>m '>+1<CR>gv=gv")


-- Pickers --------------------------------------------------------------------
vim.keymap.set('n', '<leader>i', function () require('snacks').picker.icons() end, { desc = 'Icons' })
vim.keymap.set('n', '<leader>c', function () require('snacks').picker.colorschemes() end, { desc = 'Colorschemes' })
vim.keymap.set('n', '<leader>:', function () require('snacks').picker.command_history() end, { desc = 'Command history' })
vim.keymap.set('n', '<leader>n', function () require('snacks').picker.notifications() end, { desc = 'Notifications' })
vim.keymap.set('n', '<leader>d', function () require('snacks').picker.diagnostics_buffer() end, { desc = 'Diagnostics (Buffer)' })
vim.keymap.set('n', '<leader>D', function () require('snacks').picker.diagnostics() end, { desc = 'Diagnostics (All buffers)' })
vim.keymap.set('n', '<leader>t', function () require('snacks').picker.todo_comments() end, { desc = 'TODO' })

vim.keymap.set('n', '<leader>gb', function () require('snacks').picker.git_branches() end, { desc = 'Git Branches' })
vim.keymap.set('n', '<leader>gs', function () require('snacks').picker.git_status() end, { desc = 'Git Status' })

vim.keymap.set('n', '<leader>e', function () require('neo-tree.command').execute({}) end, { desc = 'Explorer' })
vim.keymap.set('n', '<leader>r', function () require('snacks').picker.recent() end, { desc = 'Recent files' })


-- Buffers --------------------------------------------------------------------
-- Switch to last buffer
vim.keymap.set('n', '`', '<C-^>')

-- Open buffer selector
vim.keymap.set('n', '<leader>`', function ()
    if vim.bo.filetype == 'snacks_dashboard' then return end

    require('snacks').picker.buffers()
end, { desc = 'Buffers' })

-- Close current buffers
vim.keymap.set('n', '<C-q>', function ()
    if vim.bo.filetype == 'snacks_dashboard' then return end

    local bufs = vim.fn.getbufinfo({ buflisted = 1 })

    if #bufs <= 1 then
        vim.cmd('confirm q')
    else
        require('snacks').bufdelete.delete()
    end
end)

-- Close other buffers
vim.keymap.set('n', '<C-o>', function ()
    require('snacks').bufdelete.other()
end)
