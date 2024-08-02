local luasnip = require'luasnip'
local s = luasnip.s
local t = luasnip.text_node
local f = luasnip.function_node
local i = luasnip.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local postfix = require("luasnip.extras.postfix").postfix
local extras = require("luasnip.extras")
local rep = extras.rep
local l = extras.l

luasnip.add_snippets("lua", {
  s("req", fmt([[local {} = require('{}')]],
    {f(function(import_name)
        local parts = vim.split(import_name[1][1], ".", true)
        return parts[#parts] or ""
      end, { 1 }), i(1)})),

  s("lf", fmt([[
  local function {}({})
    {}
  end]],{ i(1), i(2), i(0) })),

  postfix(".fun", fmt([[
  {}.{} = function({})
    {}
  end]],{ l(l.POSTFIX_MATCH), i(1), i(2), i(0) })),

 postfix(".for",
            fmt([[
            for {}, {} in pairs({}) do
              {}
            end
            ]], { i(1), i(2), l(l.POSTFIX_MATCH), i(0)})),

 postfix(".fori",
            fmt([[
            for {}, {} in ipairs({}) do
              {}
            end
            ]], { i(1, "i"), i(2), l(l.POSTFIX_MATCH), i(0)})),
})
