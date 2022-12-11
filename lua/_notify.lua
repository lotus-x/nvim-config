vim.notify = require("notify")

vim.keymap.set("n", "<leader>nn", require("telescope").extensions.notify.notify, {})
