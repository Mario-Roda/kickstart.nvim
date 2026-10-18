local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local fmta = require("luasnip.extras.fmt").fmta

-- Helper to check if we are in math mode using VimTeX
local in_mathzone = function()
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

return {
  -- 1. Subscript shortcut: types "a1" or uses trailing underscores like "a__"
  s({ trig = "([%a%)%]%}])__", regTrig = true, wordTrig = false, condition = in_mathzone },
    fmta("<>_{<>}", {
      f(function(_, snip) return snip.captures[1] end),
      i(1),
    })
  ),

  -- 2. Fraction shortcut: types "ff" in math mode to generate \frac{<>}{<>}
  s({ trig = "ff", snippetType = "autosnippet", condition = in_mathzone },
    fmta("\\frac{<>}{<>}", {
      i(1),
      i(2),
    })
  ),
}
