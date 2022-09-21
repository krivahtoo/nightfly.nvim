local c = require 'nightfly.colors'
local utils = require 'nightfly.utils'
local cfg = require('nightfly.config').styles
local nightfly = {}

local function set_terminal_colors()
  vim.g.terminal_color_0 = c.regal_blue
  vim.g.terminal_color_1 = c.red
  vim.g.terminal_color_2 = c.green
  vim.g.terminal_color_3 = c.yellow
  vim.g.terminal_color_4 = c.blue
  vim.g.terminal_color_5 = c.violet
  vim.g.terminal_color_6 = c.turquoise
  vim.g.terminal_color_7 = c.white
  vim.g.terminal_color_8 = c.grey_blue
  vim.g.terminal_color_9 = c.watermelon
  vim.g.terminal_color_10 = c.emerald
  vim.g.terminal_color_11 = c.tan
  vim.g.terminal_color_12 = c.blue
  vim.g.terminal_color_13 = c.purple
  vim.g.terminal_color_14 = c.turquoise
  vim.g.terminal_color_15 = c.white_blue
  vim.g.terminal_color_background = c.bg
  vim.g.terminal_color_foreground = c.fg
end

local function set_transparent(color)
  if not utils.tobool(vim.g.nightfly_transparent) then
    return color
  end
  return c.none
end

local function set_groups()
  local groups = {
    -- Base
    -- Editor highlight groups
    Normal = { fg = c.fg, bg = set_transparent(c.bg) }, -- normal text and background color
    SignColumn = { fg = c.green, bg = c.bg },
    EndOfBuffer = { fg = c.regal_blue }, -- ~ lines at the end of a buffer
    NormalFloat = { fg = c.fg, bg = c.dark_blue }, -- normal text and background color for floating windows
    FloatBorder = { fg = c.slate_blue, bg = c.bg },
    ColorColumn = { fg = c.none, bg = c.black_blue }, --  used for the columns set with 'colorcolumn'
    Conceal = { fg = c.ash_blue, bg = c.regal_blue }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor = { fg = c.cadet_blue, bg = c.none, style = 'reverse' }, -- the character under the cursor
    CursorIM = { fg = c.cyan, bg = c.none, style = 'reverse' }, -- like Cursor, but used when in IME mode
    Directory = { fg = c.blue, bg = c.none }, -- directory names (and other special names in listings)
    DiffAdd = { fg = c.none, bg = utils.rgba2rgb(c.bg, c.emerald, 0.20) }, -- diff mode: Added line
    DiffChange = {
      bg = utils.rgba2rgb(c.bg, c.orange, 0.16),
      fg = c.none,
    }, --  diff mode: Changed line
    DiffDelete = { bg = utils.rgba2rgb(c.bg, c.red, 0.16), fg = c.red }, -- diff mode: Deleted line
    DiffText = { bg = utils.rgba2rgb(c.bg, c.indigo, 0.50), fg = c.fg }, -- diff mode: Changed text within a changed line
    ErrorMsg = { fg = c.red }, -- error messages
    Folded = { fg = c.green, bg = c.dark_blue, style = 'italic' },
    FoldColumn = { fg = c.ash_blue, bg = c.regal_blue },
    IncSearch = { bg = c.orange, fg = c.bg },
    Substitute = { bg = c.tan, fg = c.bg },
    LineNr = { fg = c.steel_blue },
    CursorLineNr = { fg = c.blue, bg = c.dark_blue },
    MatchParen = { fg = c.none, bg = c.regal_blue, style = 'bold' },
    ModeMsg = { fg = c.steel_blue, style = cfg.bold },
    MoreMsg = { fg = c.cyan, style = cfg.bold },
    NonText = { fg = c.steel_blue },
    Pmenu = { fg = c.fg, bg = c.deep_blue },
    PmenuSel = { fg = c.white_blue, bg = c.cyan_blue },
    PmenuSbar = { bg = c.deep_blue },
    PmenuThumb = { bg = c.steel_blue },
    Question = { fg = c.green, style = cfg.bold },
    QuickFixLine = { fg = c.none, bg = c.regal_blue },
    qfLineNr = { fg = c.blue, bg = c.bg },
    qfFileName = { fg = c.emerald },
    Search = { bg = c.orange, fg = c.bg },
    SpecialKey = { fg = c.blue },
    SpellBad = { sp = c.watermelon, bg = c.none, style = 'undercurl' },
    SpellCap = { sp = c.blue, bg = c.none, style = 'undercurl' },
    SpellLocal = { sp = c.turquoise, bg = c.none, style = 'undercurl' },
    SpellRare = { sp = c.grey_blue, bg = c.none, style = 'undercurl' },
    StatusLine = { bg = c.slate_blue },
    StatusLineNC = { bg = c.slate_blue },
    StatusLineTerm = { fg = c.fg, bg = c.bg },
    StatusLineTermNC = { fg = c.fg, bg = c.bg3 },
    TabLineFill = { fg = c.fg },
    TablineSel = { fg = c.bg, bg = c.blue },
    Tabline = { fg = c.gray },
    Title = { fg = c.cyan, bg = c.none, style = cfg.bold },
    Visual = { bg = c.regal_blue },
    VisualNOS = { fg = c.none, style = 'reverse' },
    WarningMsg = { fg = c.orange, style = cfg.bold },
    WildMenu = { fg = c.bg0, bg = c.blue, style = 'bold' },
    WinBar = { fg = c.cadet_blue, bg = c.dark_blue },
    WinBarNC = { fg = c.cadet_blue, bg = c.bg },
    CursorColumn = { fg = c.none, bg = c.dark_blue },
    CursorLine = { fg = c.none, bg = c.dark_blue },
    ToolbarLine = { fg = c.fg, bg = c.bg },
    ToolbarButton = { fg = c.fg, bg = c.none, style = 'bold' },
    NormalMode = { fg = c.emerald, bg = c.none, style = 'reverse' },
    InsertMode = { fg = c.indigo, bg = c.none, style = 'reverse' },
    ReplacelMode = { fg = c.red, bg = c.none, style = 'reverse' },
    VisualMode = { fg = c.purple, bg = c.none, style = 'reverse' },
    VertSplit = { fg = c.slate_blue },
    CommandMode = { fg = c.yellow, bg = c.none, style = 'reverse' },
    Warnings = { fg = c.orange },
    healthError = { fg = c.red },
    healthSuccess = { fg = c.green },
    healthWarning = { fg = c.orange },
    --common
    Type = { fg = c.emerald }, -- int, long, char, etc.
    StorageClass = { fg = c.violet }, -- static, register, volatile, etc.
    Structure = { fg = c.indigo }, -- struct, union, enum, etc.
    Constant = { fg = c.orange }, -- any constant
    Comment = {
      fg = c.grey_blue,
      bg = c.none,
      style = cfg.italic_comment,
    },
    Conditional = {
      fg = c.violet,
      bg = c.none,
      style = cfg.italic_keyword,
    }, -- italic if, then, else, endif, switch, etc.
    Keyword = { fg = c.violet, bg = c.none, style = cfg.italic_keyword }, -- italic for, do, while, etc.
    Repeat = { fg = c.violet, bg = c.none, style = cfg.italic_keyword }, -- italic any other keyword
    Boolean = {
      fg = c.watermelon,
      bg = c.none,
      style = cfg.italic_boolean,
    }, -- true , false
    Function = {
      fg = c.blue,
      bg = c.none,
    },
    Identifier = {
      fg = c.turquoise,
      bg = c.none,
      style = cfg.italic_variable,
    }, -- any variable name
    String = { fg = c.tan, bg = c.none }, -- Any string
    Character = { fg = c.purple }, -- any character constant: 'c', '\n'
    Number = { fg = c.orange }, -- a number constant: 5
    Float = { fg = c.orange }, -- a floating point constant: 2.3e10
    Statement = { fg = c.violet }, -- any statement
    Label = { fg = c.turquoise }, -- case, default, etc.
    Operator = { fg = c.watermelon }, -- sizeof", "+", "*", etc.
    Exception = { fg = c.violet }, -- try, catch, throw
    PreProc = { fg = c.orange }, -- generic Preprocessor
    Include = { fg = c.watermelon }, -- preprocessor #include
    Define = { fg = c.purple }, -- preprocessor #define
    Macro = { fg = c.purple }, -- same as Define
    Typedef = { fg = c.emerald }, -- A typedef
    PreCondit = { fg = c.violet }, -- preprocessor #if, #else, #endif, etc.
    Special = { fg = c.watermelon, bg = c.none, style = 'italic' }, -- any special symbol
    SpecialChar = { fg = c.watermelon }, -- special character in a constant
    Tag = { fg = c.turquoise }, -- you can use CTRL-] on this
    Delimiter = { fg = c.yellow }, -- character that needs attention like , or .
    SpecialComment = { fg = c.blue }, -- special things inside a comment
    Debug = { fg = c.red }, -- debugging statements
    Underlined = { fg = c.none, bg = c.none, style = 'underline' }, -- text that stands out, HTML links
    Ignore = { fg = c.gray_alt }, -- left blank, hidden
    Error = { fg = c.red, bg = c.none, style = 'bold,underline' }, -- any erroneous construct
    Todo = { fg = c.yellow, bg = c.none, style = 'bold,italic' }, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX
    -- HTML
    htmlArg = { fg = c.orange },
    htmlBold = { fg = c.orange, bg = c.none, style = 'bold' },
    htmlEndTag = { fg = c.fg },
    htmlstyle = { fg = c.cyan_blue, bg = c.none, style = 'italic' },
    htmlLink = { fg = c.cyan_blue, style = 'underline' },
    htmlSpecialChar = { fg = c.orange },
    htmlSpecialTagName = { fg = c.blue, style = cfg.bold },
    htmlTag = { fg = c.fg },
    htmlTagN = { fg = c.blue },
    htmlTagName = { fg = c.blue, cfg.bold },
    htmlTitle = { fg = c.fg },
    htmlH1 = { fg = c.blue, style = 'bold' },
    htmlH2 = { fg = c.blue, style = 'bold' },
    htmlH3 = { fg = c.blue, style = 'bold' },
    htmlH4 = { fg = c.blue, style = 'bold' },
    htmlH5 = { fg = c.blue, style = 'bold' },
    -- Markdown
    markdownH1 = { fg = c.blue, style = 'bold' },
    markdownH2 = { fg = c.blue, style = 'bold' },
    markdownH3 = { fg = c.blue, style = 'bold' },
    markdownH4 = { fg = c.blue, style = 'bold' },
    markdownH5 = { fg = c.blue, style = 'bold' },
    markdownH6 = { fg = c.blue, style = 'bold' },
    markdownHeadingDelimiter = { fg = c.red },
    markdownHeadingRule = { fg = c.gray },
    markdownId = { fg = c.cyan_blue },
    markdownIdDeclaration = { fg = c.blue },
    markdownIdDelimiter = { fg = c.cyan_blue },
    markdownstyle = { fg = c.cyan_blue, bg = c.none, style = 'italic' },
    markdownLinkDelimiter = { fg = c.cyan_blue },
    markdownLinkText = { fg = c.blue },
    markdownListMarker = { fg = c.red },
    markdownOrderedListMarker = { fg = c.red },
    markdownRule = { fg = c.grey_blue },
    markdownUrl = { fg = c.indigo, bg = c.none, style = 'underline' },
    markdownBlockquote = { fg = c.gray },
    markdownBold = { fg = c.orange, bg = c.none, style = 'bold' },
    markdownCode = { fg = c.purple, bg = c.bg },
    markdownCodeBlock = { fg = c.green },
    markdownCodeDelimiter = { fg = c.green },
    -- Dashboard
    DashboardShortCut = { fg = c.red },
    DashboardHeader = { fg = c.purple },
    DashboardCenter = { fg = c.blue },
    DashboardFooter = { fg = c.cadet_blue, style = 'italic' },
    -- TreeSitter highlight groups
    TSComment = {
      fg = c.grey_blue,
      bg = c.none,
      style = cfg.italic_comment,
    }, -- For comment blocks.
    TSConditional = { fg = c.violet, style = cfg.italic_keyword }, -- For keywords related to conditionnals.
    TSKeyword = { fg = c.violet, style = cfg.italic_keyword }, -- For keywords that don't fall in previous categories.
    TSAnnotation = { fg = c.violet }, -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
    TSRepeat = { fg = c.violet, style = cfg.italic_keyword }, -- For keywords related to loops.
    TSAttribute = { fg = c.blue }, -- (unstable) TODO: docs
    TSKeywordFunction = { fg = c.violet, style = cfg.italic_keyword }, -- For keywords used to define a fuction.
    TSKeywordOperator = { fg = c.violet, style = cfg.italic_keyword }, -- For keywords, like `new`.
    TSKeywordReturn = { fg = c.violet }, -- For keywords, like `new`.
    TSCharacter = { fg = c.purple }, -- For characters.
    TSBoolean = {
      fg = c.watermelon,
      bg = c.none,
      style = cfg.italic_boolean,
    }, -- true or false
    TSFunction = {
      fg = c.blue,
      style = cfg.italic_function .. cfg.bold,
    }, -- For fuction (calls and definitions).
    TSMethod = { fg = c.blue, style = cfg.italic_function }, -- For method calls and definitions.

    TSConstructor = { fg = c.emerald }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
    TSFuncBuiltin = { fg = c.blue, style = cfg.italic_function }, -- For builtin functions: `table.insert` in Lua.
    TSConstant = { fg = c.turquoise }, -- For constants
    TSVariable = { fg = c.fg, style = cfg.italic_variable }, -- Any variable name that does not have another highlight.
    TSVariableBuiltin = { fg = c.green, style = cfg.italic_variable }, -- Variable names that are defined by the languages, like `this` or `self`.
    TSConstBuiltin = { fg = c.green }, -- For constant that are built in the language: `nil` in Lua.
    TSConstMacro = { fg = c.violet }, -- For constants that are defined by macros: `NULL` in C.
    TSError = { fg = c.white_blue }, -- For syntax/parser errors.
    TSException = { fg = c.violet }, -- For exception related keywords.
    TSField = { fg = c.turquoise }, -- For fields.
    TSFloat = { fg = c.orange }, -- For floats.
    TSFuncMacro = { fg = c.blue }, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    TSInclude = { fg = c.watermelon }, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
    TSLabel = { fg = c.turquoise }, -- For labels: `label:` in C and `:label:` in Lua.
    TSNamespace = { fg = c.indigo }, -- For identifiers referring to modules and namespaces.
    TSNumber = { fg = c.orange }, -- For all numbers
    TSOperator = { fg = c.watermelon }, -- For any operator: `+`, but also `->` and `*` in C.
    TSParameter = { fg = c.white_blue }, -- For parameters of a function.
    TSParameterReference = { fg = c.white_blue }, -- For references to parameters of a function.
    TSProperty = { fg = c.turquoise }, -- Same as `TSField`.
    TSPunctDelimiter = { fg = c.ash_blue }, -- For delimiters ie: `.`
    TSPunctBracket = { fg = c.white_blue }, -- For brackets and parens.
    TSPunctSpecial = { fg = c.orange }, -- For special punctutation that does not fall in the catagories before.
    TSString = { fg = c.tan }, -- For strings.
    TSStringRegex = { fg = c.peach }, -- For regexes.
    TSStringEscape = { fg = c.watermelon }, -- For escape characters within a string.
    TSSymbol = { fg = c.purple }, -- For identifiers referring to symbols or atoms.
    TSType = { fg = c.emerald }, -- For types.
    TSTypeBuiltin = { fg = c.emerald }, -- For builtin types.
    TSTag = { fg = c.blue }, -- Tags like html tag names.
    TSTagDelimiter = { fg = c.green }, -- Tag delimiter like `<` `>` `/`
    TSText = { fg = c.fg }, -- For strings considered text in a markup language.
    TSTextReference = { fg = c.orange }, -- FIXME
    TSEmphasis = { fg = c.white_blue, style = 'italic' }, -- For text to be represented with emphasis.
    TSUnderline = { fg = c.fg, bg = c.none, style = 'underline' }, -- For text to be represented with an underline.
    TSStrike = { style = 'strikethrough' }, -- For strikethrough text.
    TSTitle = { fg = c.fg, bg = c.none, style = 'bold' }, -- Text that is part of a title.
    TSLiteral = { fg = c.tan }, -- Literal text.
    TSURI = { fg = c.green }, -- Any URL like a link or email.
    -- Diagnostic highlight groups
    DiagnosticDefaultError = { fg = c.red }, -- used for "Error" diagnostic virtual text
    DiagnosticSignError = { fg = c.red }, -- used for "Error" diagnostic signs in sign column
    DiagnosticFloatingError = { fg = c.red, style = 'bold' }, -- used for "Error" diagnostic messages in the diagnostics float
    DiagnosticVirtualTextError = {
      fg = c.red,
      bg = utils.rgba2rgb(c.bg, c.red, 0.15),
    }, -- Virtual text "Error"
    DiagnosticUnderlineError = {
      style = 'undercurl',
      sp = c.red,
    }, -- used to underline "Error" diagnostics.
    DiagnosticDefaultWarn = { fg = c.yellow }, -- used for "Warning" diagnostic signs in sign column
    DiagnosticSignWarn = { fg = c.yellow }, -- used for "Warning" diagnostic signs in sign column
    DiagnosticFloatingWarn = { fg = c.yellow, style = 'bold' }, -- used for "Warning" diagnostic messages in the diagnostics float
    DiagnosticVirtualTextWarn = {
      fg = c.yellow,
      bg = utils.rgba2rgb(c.bg, c.yellow, 0.15),
    }, -- Virtual text "Warn"
    DiagnosticUnderlineWarn = {
      style = 'undercurl',
      sp = c.yellow,
    }, -- used to underline "Warn" diagnostics.
    DiagnosticDefaultInfo = { fg = c.regal_blue }, -- used for "Info" diagnostic virtual text
    DiagnosticSignInfo = { fg = c.blue }, -- used for "Info" diagnostic signs in sign column
    DiagnosticFloatingInfo = { fg = c.blue, style = 'bold' }, -- used for "Info" diagnostic messages in the diagnostics float
    DiagnosticVirtualTextInfo = {
      fg = c.steel_blue,
      style = cfg.bold,
    }, -- Virtual text "Info"
    DiagnosticUnderlineInfo = {
      style = 'undercurl',
      sp = c.ash_blue,
    }, -- used to underline "Info" diagnostics.
    DiagnosticDefaultHint = {}, -- used for "Hint" diagnostic virtual text
    DiagnosticSignHint = { fg = c.ash_blue }, -- used for "Hint" diagnostic signs in sign column
    DiagnosticFloatingHint = { fg = c.ash_blue, style = 'bold' }, -- used for "Hint" diagnostic messages in the diagnostics float
    DiagnosticVirtualTextHint = { fg = c.steel_blue }, -- Virtual text "Hint"
    DiagnosticUnderlineHint = {
      style = 'undercurl',
      sp = c.blue,
    }, -- used to underline "Hint" diagnostics.
    LspReferenceText = { fg = c.fg, bg = c.purple }, -- used for highlighting "text" references
    LspReferenceRead = { fg = c.fg, bg = c.purple }, -- used for highlighting "read" references
    LspReferenceWrite = { fg = c.fg, bg = c.purple }, -- used for highlighting "write" references
    -- Plugins highlight groups
    -- LspTrouble
    LspTroubleText = { fg = c.bg4 },
    LspTroubleCount = { fg = c.purple, bg = c.bg3 },
    LspTroubleNormal = { fg = c.fg, bg = c.bg },
    -- Diff
    diffAdded = { fg = c.green },
    diffRemoved = { fg = c.red },
    diffChanged = { fg = c.blue },
    diffOldFile = { fg = c.bg },
    diffNewFile = { fg = c.fg },
    diffFile = { fg = c.grey_blue },
    diffLine = { fg = c.blue },
    diffIndexLine = { fg = c.purple },
    -- Neogit
    NeogitBranch = { fg = c.gray_alt },
    NeogitRemote = { fg = c.purple },
    NeogitHunkHeader = { fg = c.fg, bg = c.cyan },
    NeogitHunkHeaderHighlight = { fg = c.blue },
    NeogitDiffContextHighlight = { fg = c.fg },
    NeogitDiffDeleteHighlight = { fg = c.red },
    NeogitDiffAddHighlight = { fg = c.green },
    -- GitGutter
    GitGutterAdd = { fg = c.emerald }, -- diff mode: Added line |diff.txt|
    GitGutterChange = { fg = c.yellow }, -- diff mode: Changed line |diff.txt|
    GitGutterChangeDelete = { fg = c.orange },
    GitGutterDelete = { fg = c.red }, -- diff mode: Deleted line |diff.txt|
    -- GitSigns
    GitSignsAdd = { fg = c.emerald }, -- diff mode: Added line |diff.txt|
    GitSignsAddNr = { fg = c.emerald }, -- diff mode: Added line |diff.txt|
    GitSignsAddLn = { fg = c.green }, -- diff mode: Added line |diff.txt|
    GitSignsChange = { fg = c.yellow }, -- diff mode: Changed line |diff.txt|
    GitSignsChangeNr = { fg = c.yellow }, -- diff mode: Changed line |diff.txt|
    GitSignsChangeLn = { fg = c.yellow }, -- diff mode: Changed line |diff.txt|
    GitSignsDelete = { fg = c.red }, -- diff mode: Deleted line |diff.txt|
    GitSignsDeleteNr = { fg = c.red }, -- diff mode: Deleted line |diff.txt|
    GitSignsDeleteLn = { fg = c.red }, -- diff mode: Deleted line |diff.txt|
    -- vim-signify
    SignifySignAdd = { fg = c.emerald },
    SignifySignChange = { fg = c.yellow },
    SignifySignDelete = { fg = c.red },
    -- Syntastic
    SyntasticError = { fg = c.red },
    SyntasticWarning = { fg = c.yellow },
    SyntasticErrorSign = { fg = c.red },
    SyntasticWarningSign = { fg = c.yellow },
    -- Telescope
    TelescopePromptBorder = { fg = c.slate_blue },
    TelescopeResultsBorder = { fg = c.regal_blue },
    TelescopePreviewBorder = { fg = c.deep_blue },
    TelescopeSelection = { fg = c.white_blue, bg = c.regal_blue },
    TelescopeMatching = { fg = c.orange },
    TelescopeMultiSelection = { fg = c.watermelon },
    TelescopeNormal = { fg = c.ash_blue },
    TelescopePreviewDate = { fg = c.grey_blue },
    TelescopePreviewGroup = { fg = c.grey_blue },
    TelescopePreviewLink = { fg = c.turquoise },
    TelescopePreviewMatch = { bg = c.regal_blue },
    TelescopePreviewRead = { fg = c.orange },
    TelescopePreviewSize = { fg = c.emerald },
    TelescopePreviewUser = { fg = c.grey_blue },
    TelescopePromptPrefix = { fg = c.blue },
    TelescopeResultsDiffAdd = { fg = c.green },
    TelescopeResultsDiffChange = { fg = c.red },
    TelescopeResultsSpecialComment = { fg = c.steel_blue },
    TelescopeSelectionCaret = { fg = c.watermelon },
    TelescopeTitle = { fg = c.steel_blue },
    -- Nerdtree
    NERDTreeDir = { fg = c.purple },
    NERDTreeDirSlash = { fg = c.blue },
    NERDTreeOpenable = { fg = c.orange },
    NERDTreeClosable = { fg = c.orange },
    NERDTreeFile = { fg = c.blue },
    NERDTreeExecFile = { fg = c.green },
    NERDTreeUp = { fg = c.gray },
    NERDTreeCWD = { fg = c.green },
    NERDTreeHelp = { fg = c.gray_alt },
    NERDTreeToggleOn = { fg = c.green },
    NERDTreeToggleOff = { fg = c.red },
    -- NvimTree
    NvimTreeRootFolder = { fg = c.steel_blue, style = 'italic' },
    NvimTreeNormal = {
      fg = c.fg,
      bg = utils.rgba2rgb('#000000', c.bg, 0.9),
    },
    NvimTreeGitDirty = { fg = c.watermelon },
    NvimTreeGitNew = { fg = c.green },
    NvimTreeImageFile = { fg = c.purple },
    NvimTreeExecFile = { fg = c.green },
    NvimTreeSpecialFile = { fg = c.yellow },
    NvimTreeFolderName = { fg = c.blue },
    NvimTreeEmptyFolderName = { fg = c.gray },
    NvimTreeFolderIcon = { fg = c.blue },
    NvimTreeIndentMarker = { fg = c.steel_blue },
    LspDiagnosticsError = { fg = c.red },
    LspDiagnosticsWarning = { fg = c.orange },
    LspDiagnosticsInformation = { fg = c.gray_alt },
    LspDiagnosticsHint = { fg = c.blue },
    -- Ale-vim
    ALEError = { fg = c.red },
    ALEWarning = { fg = c.orange },
    ALEInfo = { fg = c.blue },
    ALEErrorSign = { fg = c.red },
    ALEWarningSign = { fg = c.orange },
    ALEInfoSign = { fg = c.blue },
    ALEVirtualTextError = { fg = c.red },
    ALEVirtualTextWarning = { fg = c.yellow },
    ALEVirtualTextInfo = { fg = c.blue },
    -- WhichKey
    WhichKey = { fg = c.blue, style = 'italic' },
    WhichKeyGroup = { fg = c.violet, style = 'italic' },
    WhichKeyDesc = { fg = c.turquoise, style = 'bold' },
    WhichKeySeperator = {},
    WhichKeyFloating = { bg = c.dark_blue },
    WhichKeyFloat = { bg = c.dark_blue },
    -- LspSaga
    -- DiagnosticError = { fg = c.red },
    -- DiagnosticWarning = { fg = c.orange },
    -- DiagnosticInformation = { fg = c.blue },
    -- DiagnosticHint = { fg = c.ash_blue },
    -- DiagnosticTruncateLine = { fg = c.fg },
    LspFloatWinNormal = { bg = c.bg },
    LspFloatWinBorder = { fg = c.purple },
    LspSagaBorderTitle = { fg = c.cyan_blue },
    LspSagaHoverBorder = { fg = c.grey_blue },
    LspSagaRenameBorder = { fg = c.green },
    LspSagaDefPreviewBorder = { fg = c.green },
    LspSagaCodeActionBorder = { fg = c.blue },
    LspSagaFinderSelection = { fg = c.green },
    LspSagaCodeActionTitle = { fg = c.grey_blue },
    LspSagaCodeActionContent = { fg = c.purple },
    LspSagaSignatureHelpBorder = { fg = c.purple },
    ReferencesCount = { fg = c.purple },
    DefinitionCount = { fg = c.purple },
    DefinitionIcon = { fg = c.blue },
    ReferencesIcon = { fg = c.blue },
    TargetWord = { fg = c.cyan },
    -- BufferLine
    -- BufferLineIndicatorSelected = { fg = c.turquoise },
    -- BufferLineFill = { bg = utils.rgba2rgb('#000000', c.bg, 0.5) },
    -- Sneak
    Sneak = { fg = c.bg, bg = c.green },
    SneakScope = { bg = c.cyan_blue },
    -- Indent Blankline
    IndentBlanklineChar = { fg = c.deep_blue },
    IndentBlanklineContextChar = { fg = c.turquoise },
    -- Nvim dap
    DapBreakpoint = { fg = c.red },
    DapStopped = { fg = c.green },
    -- Startify
    StartifyNumber = { fg = c.purple },
    StartifySelect = { fg = c.green },
    StartifyBracket = { fg = c.gray },
    StartifySpecial = { fg = c.cyan },
    StartifyVar = { fg = c.blue },
    StartifyPath = { fg = c.blue },
    StartifyFile = { fg = c.green },
    StartifySlash = { fg = c.violet },
    StartifyHeader = { fg = c.purple },
    StartifySection = { fg = c.red },
    StartifyFooter = { fg = c.green },
    -- EasyMotion
    EasyMotionTarget = { fg = c.red, bg = c.none, style = 'bold' },
    EasyMotionTarget2First = { fg = c.red, bg = c.none, style = 'bold' },
    EasyMotionTarget2Second = { fg = c.red, bg = c.none, style = 'bold' },
    -- Hop
    HopNextKey = { fg = c.orange },
    HopNextKey1 = { fg = c.blue },
    HopNextKey2 = { fg = c.watermelon },
    HopUnmatched = { fg = c.grey_blue },
    -- Cmp
    CmpItemAbbrMatch = { fg = c.tan },
    CmpItemAbbrMatchFuzzy = { fg = c.orange },
    CmpItemAbbrDeprecated = { fg = c.grey_blue, style = 'strikethrough' },
    CmpItemKindDefault = { fg = c.white_blue },
    CmpItemKindClass = { fg = c.emerald },
    CmpItemKindColor = { fg = c.turquoise },
    CmpItemKindConstant = { fg = c.purple },
    CmpItemKindConstructor = { fg = c.blue },
    CmpItemKindEnum = { fg = c.violet },
    CmpItemKindEnumMember = { fg = c.turquoise },
    CmpItemKindEvent = { fg = c.violet },
    CmpItemKindField = { fg = c.turquoise },
    CmpItemKindFile = { fg = c.blue },
    CmpItemKindFolder = { fg = c.blue },
    CmpItemKindFunction = { fg = c.blue, bg = c.none },
    CmpItemKindInterface = { fg = c.emerald },
    CmpItemKindKeyword = { fg = c.violet },
    CmpItemKindMethod = { fg = c.blue, bg = c.none },
    CmpItemKindModule = { fg = c.emerald },
    CmpItemKindOperator = { fg = c.violet },
    CmpItemKindProperty = { fg = c.turquoise },
    CmpItemKindReference = { fg = c.turquoise },
    CmpItemKindStruct = { fg = c.emerald, bg = c.none },
    CmpItemKindTypeParameter = { fg = c.emerald },
    CmpItemKindUnit = { fg = c.turquoise },
    CmpItemKindValue = { fg = c.turquoise },
    CmpItemKindVariable = { fg = c.turquoise },
    CmpItemMenu = { fg = c.steel_blue },
    -- CoC
    CocErrorSign = { fg = c.red },
    CocWarningSign = { fg = c.orange },
    CocInfoSign = { fg = c.green },
    CocHintSign = { fg = c.blue },
    CocErrorFloat = { fg = c.red },
    CocWarningFloat = { fg = c.orange },
    CocInfoFloat = { fg = c.green },
    CocHintFloat = { fg = c.blue },
    CocDiagnosticsError = { fg = c.red },
    CocDiagnosticsWarning = { fg = c.orange },
    CocDiagnosticsInfo = { fg = c.green },
    CocDiagnosticsHint = { fg = c.blue },
    CocSelectedText = { fg = c.red },
    CocCodeLens = { fg = c.gray },
    CocErrorHighlight = { fg = c.red },
    CocWarningHighlight = { fg = c.orange },
    CocInfoHighlight = { fg = c.green },
    CocHintHighlight = { fg = c.blue },
    CocExplorerIndentLine = { fg = c.gray },
    CocExplorerBufferRoot = { fg = c.cyan },
    CocExplorerFileRoot = { fg = c.cyan },
    CocExplorerBufferFullPath = { fg = c.gray },
    CocExplorerFileFullPath = { fg = c.gray },
    CocExplorerBufferReadonly = { fg = c.purple },
    CocExplorerBufferModified = { fg = c.purple },
    CocExplorerBufferNameVisible = { fg = c.orange },
    CocExplorerFileReadonly = { fg = c.purple },
    CocExplorerFileModified = { fg = c.purple },
    CocExplorerFileHidden = { fg = c.gray },
    CocExplorerHelpLine = { fg = c.purple },
    -- Fidget.nvim
    FidgetTitle = { fg = c.turquoise, style = 'bold' },
  }

  local overrides = vim.g.nightfly_overrides
  if overrides then
    vim.tbl_extend('force', groups, overrides)
  end

  for group, parameters in pairs(groups) do
    utils.highlight(group, parameters)
  end
end

function nightfly.colorscheme()
  vim.cmd 'hi clear'
  if vim.fn.exists 'syntax_on' then
    vim.cmd 'syntax reset'
  end

  vim.o.termguicolors = true
  vim.g.colors_name = 'nightfly'

  set_terminal_colors()
  set_groups()
end

return nightfly
