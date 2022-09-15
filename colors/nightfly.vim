" clear cache so this reloads changes.
" useful for development
lua package.loaded['nightfly'] = nil
lua package.loaded['nightfly.colors'] = nil
lua package.loaded['nightfly.utils'] = nil
lua package.loaded['nightfly.config'] = nil
lua require('nightfly').colorscheme()
