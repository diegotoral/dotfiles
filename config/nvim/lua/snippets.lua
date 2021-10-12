local luasnip = require('luasnip')

local s = luasnip.snippet
local sn = luasnip.snippet_node

luasnip.snippets = {
  ruby = {
    luasnip.parser.parse_snippet('fro', '# frozen_string_literal: true\n\n'),
  }
}
