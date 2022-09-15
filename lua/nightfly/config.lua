local tobool = require('nightfly.utils').tobool

local settings = {
  style = 'default',
  italic_comment = true,
  italic_keyword = false,
  italic_boolean = false,
  italic_function = false,
  italic_variable = false,
  bold = false,
}

local styles = {
  italic_comment = 'italic',
  italic_keyword = 'italic',
  italic_boolean = 'italic',
  italic_function = 'italic',
  italic_variable = 'italic',
  bold = 'bold',
}

for k, val in pairs(settings) do
  local key = 'nightfly_' .. k
  if vim.g[key] == nil then
    vim.g[key] = val
  end
end

-- style check
if not tobool(vim.g.nightfly_italic_comment) then
  styles.italic_comment = 'NONE'
end

if not tobool(vim.g.nightfly_italic_keyword) then
  styles.italic_keyword = 'NONE'
end

if not tobool(vim.g.nightfly_italic_boolean) then
  styles.italic_boolean = 'NONE'
end

if not tobool(vim.g.nightfly_italic_function) then
  styles.italic_function = 'NONE'
end

if not tobool(vim.g.nightfly_italic_variable) then
  styles.italic_variable = 'NONE'
end

if not tobool(vim.g.nightfly_bold) then
  styles.bold = 'NONE'
end

return { settings = settings, styles = styles }
