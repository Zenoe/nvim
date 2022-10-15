require('plugins')
require('configs')

-- invalidate cache
package.loaded['initvim'] = nil
require('initvim')

require('keybindings')
