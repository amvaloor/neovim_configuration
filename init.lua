-- Set leader key to <space>
vim.g.mapleader = "<space>"

-- Set up options
require("config.options")

-- Set up API
require("config.api")

-- Set up package manager
require("config.lazy")

-- Set up keymaps
require("config.keymaps")
