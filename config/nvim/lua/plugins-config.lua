local g = vim.g

require('nvim-tree').setup {
  view = {
    width = 30
  }
}

require('nvim_comment').setup{
  line_mapping = '<leader>cc'
}

local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.norg = {
  install_info = {
    url = 'https://github.com/nvim-neorg/tree-sitter-norg',
    files = { 'src/parser.c', 'src/scanner.cc' },
    branch = 'main'
  }
}

require('nvim-treesitter.configs').setup {
  ensure_installed = 'maintained',
  highlight = { enable = true },
  matchup = { enable = true }
}

local cmp = require('cmp')
local luasnip = require('luasnip')

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
    { name = 'buffer' },
    { name = 'treesitter' },
    { name = 'luasnip' },
    { name = 'neorg' }
  },

  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = false }),

    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
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
  options = {theme = 'rose-pine'}
}

require('auto-session').setup {
  pre_save_cmds = {'NvimTreeClose'}
}

require('neorg').setup {
  load = {
    ['core.defaults'] = {},
    ['core.norg.concealer'] = {},
    ['core.norg.dirman'] = {
      config =  {
        workspaces = {
          my_workspace = '~/neorg'
        }
      }
    },
    ['core.norg.completion'] = {
      config = {
        engine = 'nvim-cmp'
      }
    }
  }
}
