-- Configuración del método de compilación (latexmk es el predeterminado y el más recomendado)
vim.g.vimtex_compiler_engine = 'lualatex'
vim.g.vimtex_compiler_method = 'latexmk'
-- Configuración de VimTeX para Windows 11
vim.g.vimtex_view_method = 'general'
vim.g.vimtex_view_general_viewer = 'SumatraPDF'

-- Opciones específicas para Windows Terminal
vim.g.vimtex_view_general_options = '-reuse-instance -forward-search "@tex" @line "@pdf"'
-- Opcional: Ocultar o "conceal" ciertos elementos de LaTeX para leer mejor el código
vim.g.vimtex_syntax_conceal = {
accents = 1,
ligatures = 1,
sections = 0,
styles = 1,
math_bounds = 1,
math_delimiters = 1,
math_fracs = 1,
math_super_sub = 1,
math_symbols = 1,
spacing = 1,
}
-- Force VimTeX to use LuaLaTeX for compilation
vim.g.vimtex_compiler_latexmk_engines = {
  ['_'] = '-lualatex',
}
