
return {
  "nvim-telescope/telescope-file-browser.nvim",
  version = "*",
  config = function ()
    local actions = require('telescope.actions')
    local fb_actions = require "telescope".extensions.file_browser.actions
    local builtin = require("telescope.builtin")
    require('telescope').setup {
      defaults = {
        mappings = {
          n = {
            ["q"] = actions.close
          },
        },
      },
      extensions = {
        file_browser = {
          theme = "dropdown",
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          mappings = {
            -- your custom insert mode mappings
            ["i"] = {
              ["<C-w>"] = function() vim.cmd('normal vbd') end,
            },
            ["n"] = {
              -- your custom normal mode mappings
              ["N"] = fb_actions.create,
              ["h"] = fb_actions.goto_parent_dir,
              ["/"] = function()
                vim.cmd('startinsert')
              end
            },
          },
        },
      },

    }
    require('telescope').load_extension("file_browser")

  end,
}

