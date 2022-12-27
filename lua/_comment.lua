require("Comment").setup({
	pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
})

require("todo-comments").setup({})

local keymap = vim.api.nvim_set_keymap

-- centered adapted box with centered text
keymap("n", "<Leader>cc", "<Cmd>lua require('comment-box').ccbox(3)<CR>", {})
keymap("v", "<Leader>cc", "<Cmd>lua require('comment-box').ccbox(3)<CR>", {})

-- centered line
keymap("n", "<Leader>cl", "<Cmd>lua require('comment-box').cline(2)<CR>", {})
