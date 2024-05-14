local g = vim.g

require('nvim-rspec').setup()

require('gitsigns').setup()

require('nvim-tree').setup {
  view = {
    width = 30
  }
}

require('nvim_comment').setup{
  line_mapping = '<leader>cc'
}

require('nvim-treesitter.configs').setup {
  ensure_installed = { 'javascript', 'vue', 'ruby', 'lua' },
  highlight = { enable = true },
  matchup = { enable = true },
  playground = { enable = true }
}

local cmp = require('cmp')
local luasnip = require('luasnip')

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require'lspconfig'.ruby_lsp.setup{}

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup {
  snippet = {
    expand = function(args)
      require'luasnip'.lsp_expand(args.body)
    end
  },

  sources = {
    { name = 'luasnip' },
    { name = 'treesitter' },
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  },

  window = {
    ompletion = cmp.config.window.bordered()
  },

  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = false }),

    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' })
  }
}

require('lualine').setup {
  options = { theme = 'rose-pine' },
  extensions = { 'nvim-tree' }
}

require('auto-session').setup {
  pre_save_cmds = { 'NvimTreeClose' }
}

