local luasnip = require('luasnip')

local s = luasnip.snippet
local t = luasnip.text_node
local sn = luasnip.snippet_node
local i = luasnip.insert_node
local isn = luasnip.indent_snippet_node

luasnip.snippets = {
  ruby = {
    s('bb', t('byebug')),
    s('pry', t('binding.pry')),
    s('fro', t({ '# frozen_string_literal: true', ''})),
    s('def', {
      t('def '),
      i(1, 'name'),
      t({ '', '\t' }),
      i(2),
      t({ '', 'end' })
    }),
    s('class', {
      t('class '),
      i(1, 'Name'),
      t({ '', '\t' }),
      i(2),
      t({ '', 'end' })
    }),

    -- RSpec
    s('descl', t('described_class')),
    s('desc', {
      t('describe '),
      i(1, "'method'"),
      t({ 'do', '', '\t' }),
      i(2),
      t({ '', 'end' })
    }),

    luasnip.parser.parse_snippet('spec', [[
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ${1:class}, type: ${2:type} do
  $0
end]]),
    luasnip.parser.parse_snippet('expecs', 'expect(response).to have_http_status :${1:status}'),
    luasnip.parser.parse_snippet('context', [[
context '${1:when something}' do
  $0
end]]),
    s('it', {
      t('it '),
      i(1),
      t(' do'),
      i(2),
      t({ '', 'end' })
    })
  }
}
