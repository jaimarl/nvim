return {
    'monaqa/dial.nvim',

    keys = {
        { "<C-a>", function() require("dial.map").manipulate("increment", "normal") end, mode = "n" },
        { "<C-x>", function() require("dial.map").manipulate("decrement", "normal") end, mode = "n" },
        { "g<C-a>", function() require("dial.map").manipulate("increment", "gnormal") end, mode = "n" },
        { "g<C-x>", function() require("dial.map").manipulate("decrement", "gnormal") end, mode = "n" },
        { "<C-a>", function() require("dial.map").manipulate("increment", "visual") end, mode = "v" },
        { "<C-x>", function() require("dial.map").manipulate("decrement", "visual") end, mode = "v" },
        { "g<C-a>", function() require("dial.map").manipulate("increment", "gvisual") end, mode = "v" },
        { "g<C-x>", function() require("dial.map").manipulate("decrement", "gvisual") end, mode = "v" },
    },

    config = function ()
        local augend = require("dial.augend")

        require("dial.config").augends:register_group{
            default = {
                -- Numbers
                augend.integer.new({ radix = 10, natural = false }),
                augend.decimal_fraction.new({ point_char = '.', signed = true }),
                augend.integer.alias.hex,

                -- Dates
                augend.date.alias["%Y/%m/%d"],
                augend.date.alias["%d/%m/%Y"],
                augend.constant.alias.bool,

                -- Operators
                augend.constant.new({ elements = { '&&', '||' }, word = false }),
                augend.constant.new({ elements = { 'and', 'or' }, preserve_case = true }),
                augend.constant.new({ elements = { '=', '!=' }, word = false, preserve_case = true }),

                -- Markdown
                augend.constant.new({ elements = { '- [ ]', '- [x]' }, word = false }),

                -- Months
                augend.constant.new({
                    elements = { 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December' },
                    preserve_case = true
                }),
                augend.constant.new({
                    elements = { 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec' },
                    preserve_case = true
                }),
                augend.constant.new({
                    elements = { 'Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь', 'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь' },
                    preserve_case = true
                }),
                augend.constant.new({
                    elements = { 'Янв', 'Фев', 'Мар', 'Апр', 'Май', 'Июн', 'Июл', 'Авг', 'Сен', 'Окт', 'Ноя', 'Дек' },
                    preserve_case = true
                }),

                -- Days of the week
                augend.constant.new({
                    elements = { 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday' },
                    preserve_case = true
                }),
                augend.constant.new({
                    elements = { 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun' },
                    preserve_case = true
                }),
                augend.constant.new({
                    elements = { 'Понедельник', 'Вторник', 'Среда', 'Четверг', 'Пятница', 'Суббота', 'Воскресенье' },
                    preserve_case = true
                }),
                augend.constant.new({
                    elements = { 'Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс' },
                    preserve_case = true
                }),
            }
        }
    end
}
