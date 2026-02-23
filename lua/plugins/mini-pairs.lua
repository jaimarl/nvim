return {
    'echasnovski/mini.pairs',
    event = "VeryLazy",

    config = function()
        require('mini.pairs').setup({
            modes = { insert = true, command = true, terminal = false },
            skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
            skip_unbalanced = true,
            markdown = true
        })

        local function space_pair()
            local line = vim.api.nvim_get_current_line()
            local col = vim.api.nvim_win_get_cursor(0)[2]

            local char_before = line:sub(col, col)
            local char_after = line:sub(col + 1, col + 1)

            local bracket_pairs = { ['('] = ')', ['['] = ']', ['{'] = '}' }

            if bracket_pairs[char_before] == char_after then
                return "<Space><Space><Left>"
            else
                return "<Space>"
            end
        end

        vim.keymap.set('i', '<Space>', space_pair, { expr = true, replace_keycodes = true })
    end
}
