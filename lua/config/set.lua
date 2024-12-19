vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'number'
vim.opt.undofile = true

if vim.g.neovide then
  -- Allow copy paste
  vim.g.neovide_input_use_logo = 1
  vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true})
  vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true})
  vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true})
  vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true})
end
