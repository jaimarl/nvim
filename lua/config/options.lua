-- General Settings -----------------------------------------------------------
vim.opt.mouse = "a"           -- Mouse support
vim.opt.mousefocus = true     -- Window focus on mouse hover 
vim.opt.clipboard = "unnamedplus" -- Use system clipboard
vim.opt.undofile = true       -- Preserve change history between sessions
vim.opt.updatetime = 250      -- Decreased update time
vim.termguicolors = true      -- Support 24-Bit colors


-- Interface ------------------------------------------------------------------
vim.opt.number = true         -- Display line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.cursorline = true     -- Highlight current line
vim.opt.wrap = false          -- Do not wrap long lines
vim.opt.signcolumn = 'yes'
vim.opt.showmode = false      -- Disable mode display 
vim.opt.laststatus = 3        -- Single statusline for all windows

-- Split Windows
vim.opt.splitright = true     -- Open vertical splits on the right 
vim.opt.splitbelow = true     -- Open horizontal splits on the bottom 


-- Search ---------------------------------------------------------------------
vim.opt.ignorecase = true     -- Ignore case when searching
vim.opt.smartcase = true      -- Match case if query contains capital letters
vim.opt.hlsearch = true       -- Highlight matches
vim.opt.incsearch = true      -- Incremental search
vim.opt.inccommand = "split"  -- Preview substitutions in a separate window


-- Indentation ----------------------------------------------------------------
vim.opt.expandtab = true      -- Convert tabs to spaces
vim.opt.shiftwidth = 4        -- Indent symbol size
vim.opt.tabstop = 4           -- Tab width
vim.opt.softtabstop = 4       -- Virtual tab
vim.opt.smarttab = true       -- Smart tab
vim.opt.smartindent = true    -- Smart indent 
