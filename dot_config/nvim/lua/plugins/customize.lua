local float_border = {
  { "┌", "FloatBorder" },
  { "─", "FloatBorder" },
  { "┐", "FloatBorder" },
  { "│", "FloatBorder" },
  { "┘", "FloatBorder" },
  { "─", "FloatBorder" },
  { "└", "FloatBorder" },
  { "│", "FloatBorder" },
}

local logo = [[
 __         __     __   __   ______        __         ______     __  __     ______     __  __        ______     ______     _____     ______    
/\ \       /\ \   /\ \ / /  /\  ___\      /\ \       /\  __ \   /\ \/\ \   /\  ___\   /\ \_\ \      /\  ___\   /\  __ \   /\  __-.  /\  ___\   
\ \ \____  \ \ \  \ \ \'/   \ \  __\      \ \ \____  \ \  __ \  \ \ \_\ \  \ \ \__ \  \ \  __ \     \ \ \____  \ \ \/\ \  \ \ \/\ \ \ \  __\   
 \ \_____\  \ \_\  \ \__|    \ \_____\     \ \_____\  \ \_\ \_\  \ \_____\  \ \_____\  \ \_\ \_\     \ \_____\  \ \_____\  \ \____-  \ \_____\ 
  \/_____/   \/_/   \/_/      \/_____/      \/_____/   \/_/\/_/   \/_____/   \/_____/   \/_/\/_/      \/_____/   \/_____/   \/____/   \/_____/ 
                                                                                                                                               
]]

logo = string.rep("\n", 8) .. logo .. "\n\n"

return {
  {
    "nvimdev/dashboard-nvim",
    opts = {
      config = {
        header = vim.split(logo, "\n"),
      },
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      --      transparent = true,
      --      styles = {
      --        sidebars = "transparent",
      --        floats = "transparent",
      --      },
      dim_inactive = true,
      on_highlights = function(hl, c)
        local prompt = "#2d3149"
        hl.WinSeparator = { fg = c.blue }
        hl.TelescopeNormal = {
          bg = c.bg_dark,
          fg = c.fg_dark,
        }
        hl.TelescopeBorder = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.TelescopePromptNormal = {
          bg = prompt,
        }
        hl.TelescopePromptBorder = {
          bg = prompt,
          fg = prompt,
        }
        hl.TelescopePromptTitle = {
          bg = prompt,
          fg = prompt,
        }
        hl.TelescopePreviewTitle = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.TelescopeResultsTitle = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
      end,
    },
  },
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- Remove `rename` (setting it to <leader>cn later)
      keys[#keys + 1] = { "<leader>cr", false }
      -- Set `rename` to <leader>cn
      keys[#keys + 1] = { "<leader>cn", vim.lsp.buf.rename, desc = "Rename" }
    end,
    opts = {
      inlay_hints = {
        enabled = true,
      },
      codelens = {
        enabled = true,
      },
      diagnostics = {
        virtual_text = false,
      },
    },
  },
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    cmd = "Octo",
    config = function()
      require("octo").setup({
        default_to_projects_v2 = false,
      })
    end,
  },
}
