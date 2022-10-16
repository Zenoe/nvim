require('configs')
require('plugins')

-- invalidate cache
if package.loaded['initvim'] then
  package.loaded['initvim'] = nil
end
require('initvim')

require('keybindings')
