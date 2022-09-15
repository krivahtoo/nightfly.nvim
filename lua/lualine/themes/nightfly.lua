local c = require 'nightfly.colors'

return {
  replace = {
    a = { fg = c.dark_blue, bg = c.watermelon, gui = 'bold' },
    b = { fg = c.fg, bg = c.slate_blue },
  },
  inactive = {
    a = { fg = c.cadet_blue, bg = c.slate_blue, gui = 'bold' },
    b = { fg = c.cadet_blue, bg = c.slate_blue },
    c = { fg = c.cadet_blue, bg = c.slate_blue },
  },
  normal = {
    a = { fg = c.dark_blue, bg = c.blue, gui = 'bold' },
    b = { fg = c.fg, bg = c.slate_blue },
    c = { fg = c.fg, bg = c.slate_blue },
  },
  visual = {
    a = { fg = c.dark_blue, bg = c.purple, gui = 'bold' },
    b = { fg = c.fg, bg = c.slate_blue },
  },
  insert = {
    a = { fg = c.dark_blue, bg = c.fg, gui = 'bold' },
    b = { fg = c.fg, bg = c.slate_blue },
  },
}
