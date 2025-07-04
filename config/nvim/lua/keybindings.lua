local cmd = vim.cmd
local map = vim.api.nvim_set_keymap

local function has_executable(name)
  return vim.fn.executable(name) == 1
end

-- Tab movements
cmd(':nnoremap tnn :tabnew<cr>')
cmd(':nnoremap tn :tabNext<cr>')
cmd(':nnoremap tp :tabprevious<cr>')

-- Make life easier regards to typos
cmd(':command! W w')
cmd(':command! Q q')
cmd(':command! Qa qa')
cmd(':command! Wq wq')
cmd(':command! Bd bd')

-- Quicky window movements
-- map('n', '<C-J>', '<C-W><C-J>', {})
-- map('n', '<C-K>', '<C-W><C-K>', {})
-- map('n', '<C-L>', '<C-W><C-L>', {})
-- map('n', '<C-H>', '<C-W><C-H>', {})

vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<LocalLeader>a", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

vim.cmd([[cab cc CodeCompanion]])

-- Format JSON file with jq
if has_executable("jq") then
  map("n", "<Leader>fj", "<Cmd>:%! jq<CR>", { desc = "Format JSON (jq)" })
  map("v", "<Leader>fj", "<Cmd>:'<,'>! jq<CR>", { desc = "Format JSON (jq)" })
else
  vim.notify("jq not installed", vim.log.levels.WARN, { title = "jq" })
end

-- Format SQL file with sleek
if has_executable("jq") then
  map("n", "<Leader>fq", "<Cmd>:%! sleek<CR>", { desc = "Format SQL (sleek)" })
  map("v", "<Leader>fq", "<Cmd>:'<,'>! sleek<CR>", { desc = "Format SQL (sleek)" })
else
  vim.notify("sleek not installed", vim.log.levels.WARN, { title = "sleek" })
end

map('n', '<C-n>', '<cmd>NvimTreeToggle<cr>', {})

-- Telescope keybinds
map('n', '<C-P>', '<cmd>Telescope find_files<cr>', {})
map('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>", {})
map('n', '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>", {})
map('n', '<leader>ft', "<cmd>lua require('telescope.builtin').treesitter()<cr>", {})
map('n', '<leader>fs', '<cmd>Telescope nvim-rspec rspec<cr>', {})

local opts = { noremap=true, silent=true }

-- LSP keybinds
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }

  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    return ''
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local lspconfig = require('lspconfig')
-- local lspcontainers = require('lspcontainers')

lspconfig.ruby_lsp.setup{
  cmd = { 'dip',  'ruby-lsp' },
  capabilities = capabilities
}

lspconfig.solargraph.setup({
  cmd = { 'dip',  'bundle', 'exec', 'solargraph', 'stdio' },
  -- on_attach = on_attach,
  capabilities = capabilities
})
