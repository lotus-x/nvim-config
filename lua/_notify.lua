local notify = require("notify")

vim.notify = notify

vim.keymap.set("n", "<leader>nn", require("telescope").extensions.notify.notify, {})
vim.keymap.set("n", "<leader>nx", notify.dismiss, {})
