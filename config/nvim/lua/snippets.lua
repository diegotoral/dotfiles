require('snippets/rspec')

local luasnip = require('luasnip')

local s = luasnip.snippet
local t = luasnip.text_node
local c = luasnip.choice_node
local sn = luasnip.snippet_node
local i = luasnip.insert_node
local isn = luasnip.indent_snippet_node

-- To test snippets choices
vim.api.nvim_set_keymap("i", "<C-n>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("i", "<C-p>", "<Plug>luasnip-prev-choice", {})

luasnip.add_snippets('ruby', {
    -- Debugging
    ---------------------------------------------------------------
    s('bb', t('byebug')),
    s('pry', t('binding.pry')),

    -- Comments
    ---------------------------------------------------------------
    s('fro', t({ '# frozen_string_literal: true', ''})),

    -- Methods
    ---------------------------------------------------------------
    s('def', {
      t('def '),
      i(1, ''),
      t({ '', '\t' }),
      i(2),
      t({ '', 'end' }),
      i(0)
    }),

    s('defi', {
      t('def initialize'),
      i(1, ''),
      t({ '', 'end' }),
      i(0)
    }),

    -- Classes
    ---------------------------------------------------------------
    s('class', {
      t('class '),
      i(1),
      t({ '', '\t' }),
      i(0),
      t({ '', 'end' })
    }),

    -- Rails
    ---------------------------------------------------------------
    s('model', {
      t('class '),
      i(1, 'Model'),
      i(2, ' < ApplicationRecord'),
      t({ '', '\t' }),
      t({ '', 'end' })
    })
  }
)
