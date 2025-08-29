if vim.loop.os_uname().sysname == "Darwin" then
    package.path = package.path
      .. ";/opt/homebrew/Cellar/luarocks/3.11.1/share/lua/5.1/?.lua"
      .. ";/opt/homebrew/share/lua/5.1/?.lua"
      .. ";/opt/homebrew/share/lua/5.1/?/init.lua"
      .. ";/opt/homebrew/lib/lua/5.1/?.lua"
      .. ";/opt/homebrew/lib/lua/5.1/?/init.lua"
      .. ";/Users/rhoulihan/.luarocks/share/lua/5.1/?.lua"
      .. ";/Users/rhoulihan/.luarocks/share/lua/5.1/?/init.lua"

    package.cpath = package.cpath
      .. ";/opt/homebrew/lib/lua/5.1/?.so"
      .. ";/opt/homebrew/lib/lua/5.1/loadall.so"
      .. ";/Users/rhoulihan/.luarocks/lib/lua/5.1/?.so"
end

require "user.plugins"

require "user.go"
require "user.airline"
require "user.autocommands"
require "user.cmp"
require "user.colors"
require "user.dap"
require "user.dapgo"
require "user.dapui"
require "user.keymaps"
require "user.loghighlight"
require "user.lsp"
require "user.nvimtree"
require "user.outline"
require "user.telescope"
require "user.treesitter"
require "user.gitblame"
require "user.gitsigns"
require "user.rest"
require "user.vennvim"

require "user.comment"
require "user.null"
require "user.augment"
require "user.options"
