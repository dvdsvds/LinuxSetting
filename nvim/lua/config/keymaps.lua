local mapKey = require("utils.keyMapper").mapKey

mapKey('<leader>e', ':Neotree toggle<cr>')

mapKey('<C-h>', '<C-w>h')
mapKey('<C-j>', '<C-w>j')
mapKey('<C-k>', '<C-w>k')
mapKey('<C-l>', '<C-w>l')

mapKey('<leader>h', ':nohlsearch<CR>')

mapKey('<', '<gv', 'v')
mapKey('>', '>gv', 'v')

mapKey('<leader>q', '<C-w>s')
mapKey('<leader>w', '<C-w>v')
mapKey('<leader>a', '<C-w>c')
mapKey('<leader>d', '<C-w>o')
