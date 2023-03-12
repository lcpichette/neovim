local builtin = require('telescope.builtin')
-- "Find All"
vim.keymap.set('n', '<leader>fa', builtin.find_files, {})
-- "Find Git"
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
-- "Find Project"
vim.keymap.set('n', '<leader>fp', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
