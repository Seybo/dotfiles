vim.g.mapleader = " " -- must be set prior plugins initialization

require "utils.map"   -- should go first as defines global mapping function
require "plugins"
require "mappings"
require "settings"
require "utils.autoload"
require "theme"
require "autocommands"

require "colorizer".setup() -- TODO_MM: for some reason it doesnt work in the plugin config
