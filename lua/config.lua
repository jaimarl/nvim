-- =============================================================================
-- General Settings
-- =============================================================================
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.mouse = "a"           -- Mouse support
vim.opt.mousefocus = true     -- Window focus on mouse hover 
vim.opt.clipboard = "unnamedplus" -- Use system clipboard
vim.opt.undofile = true       -- Preserve change history between sessions
vim.opt.updatetime = 250      -- Decreased update time
vim.termguicolors = true      -- Support 24-Bit colors


-- =============================================================================
-- Interface
-- =============================================================================
vim.opt.number = true         -- Display line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.cursorline = true     -- Highlight current line
vim.opt.so = 30               -- Center current line
vim.opt.wrap = false          -- Do not wrap long lines 
-- vim.opt.signcolumn = "yes"    -- Always show sign column 
vim.opt.showmode = false      -- Disable mode display 

-- Split Windows
vim.opt.splitright = true     -- Open vertical splits on the right 
vim.opt.splitbelow = true     -- Open horizontal splits on the bottom 


-- =============================================================================
-- Search
-- =============================================================================
vim.opt.ignorecase = true     -- Ignore case when searching
vim.opt.smartcase = true      -- Match case if query contains capital letters
vim.opt.hlsearch = true       -- Highlight matches
vim.opt.incsearch = true      -- Incremental search
vim.opt.inccommand = "split"  -- Preview substitutions in a separate window


-- =============================================================================
-- Indentation
-- =============================================================================
vim.opt.expandtab = true      -- Convert tabs to spaces
vim.opt.shiftwidth = 4        -- Indent symbol size
vim.opt.tabstop = 4           -- Tab width
vim.opt.softtabstop = 4       -- Virtual tab
vim.opt.smarttab = true       -- Smart tab
vim.opt.smartindent = true    -- Smart indent 


-- =============================================================================
-- Keymaps
-- =============================================================================
vim.keymap.set('n', '<C-s>', '<cmd>:w<CR>')     -- Save in Normal mode
vim.keymap.set('i', '<C-s>', '<cmd>:w<CR>')     -- Save in Insert mode
vim.keymap.set('n', '<C-c>', '<cmd>:qa<CR>')    -- Exit Neovim

-- Quickly switch between windows
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

vim.keymap.set('n', '<leader><Tab>', '<C-^>')   -- Switch to last buffer

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>') -- Reset search highlighting

vim.keymap.set("x", "<leader>p", [["_dP]])      -- Pasting in Visual Mode does not replace clipboard.

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")    -- Move selected lines up
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")    -- Move selected lines down

-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
