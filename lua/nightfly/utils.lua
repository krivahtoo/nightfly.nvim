local utils = {}

function utils.highlight(group, color)
  local style = color.style and 'gui=' .. color.style or 'gui=NONE'
  local fg = color.fg and 'guifg=' .. color.fg or 'guifg=NONE'
  local bg = color.bg and 'guibg=' .. color.bg or 'guibg=NONE'
  local sp = color.sp and 'guisp=' .. color.sp or ''
  vim.api.nvim_command(
    'highlight '
      .. group
      .. ' '
      .. style
      .. ' '
      .. fg
      .. ' '
      .. bg
      .. ' '
      .. sp
  )
end

function utils.tobool(val)
  if val == 0 or not val then
    return false
  end
  return true
end

---@param bg string
---@param color string
---@param alpha number
---@return string
function utils.rgba2rgb(bg, color, alpha)
  local r = (1 - alpha) * tonumber(bg:sub(2, 3), 16)
    + alpha * tonumber(color:sub(2, 3), 16)
  local g = (1 - alpha) * tonumber(bg:sub(4, 5), 16)
    + alpha * tonumber(color:sub(4, 5), 16)
  local b = (1 - alpha) * tonumber(bg:sub(6, 7), 16)
    + alpha * tonumber(color:sub(6, 7), 16)
  return string.format('#%02x%02x%02x', r, g, b)
end

return utils
