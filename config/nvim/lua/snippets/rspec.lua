local luasnip = require('luasnip')

local s = luasnip.snippet
local t = luasnip.text_node
local c = luasnip.choice_node
local sn = luasnip.snippet_node
local i = luasnip.insert_node
local isn = luasnip.indent_snippet_node

luasnip.add_snippets('ruby', {
  s('cont', {
    t('context '),
    t({ '\'' }),
    i(1),
    t({ '\'' }),
    t({ ' do', '\t' }),
    t({ '', 'end' })
  }),

  s('it', {
    t('it '),
    t({ '\'' }),
    i(1),
    t({ '\'' }),
    t(' do'),
    t({ '', '\t' }),
    i(2),
    t({ '', 'end' }),
    i(0)
  }),

  s('dcl', t('described_class')),

  s('desc', {
    t('describe '),
    t({ '\'' }),
    i(1),
    t({ '\'' }),
    t({ ' do', '\t' }),
    i(2),
    t({ '', 'end' })
  }),

  -- Expectations
  ---------------------------------------------------------------
  s('expect', {
    t('expect('), i(1), t(')'),
    c(2, {
      sn(nil, { t('.to'), i(1) }),
      sn(nil, { t('.not_to'), i(2) })
    })
  }),

  s('exst', {
    t('expect(response).to have_http_status :'),
    i(1, 'ok')
  }),

  luasnip.parser.parse_snippet('spec', [[
  # frozen_string_literal: true

  require 'rails_helper'

  RSpec.describe ${1:class}, type: ${2:type} do
  $0
end]])
})
