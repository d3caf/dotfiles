-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local remove_unused_imports = function()
  vim.lsp.buf.code_action({
    apply = true,
    context = {
      only = { "source.removeUnused.ts" },
      diagnostics = {},
    },
  })
end

-- Open diagnostics on C-x
vim.keymap.set("n", "<C-x>", vim.diagnostic.open_float)

-- Find references
vim.keymap.set(
  "n",
  "<leader>cr",
  require("telescope.builtin").lsp_references,
  { noremap = true, silent = true, desc = "Find References" }
)

-- Remove unused imports
vim.keymap.set("n", "<leader>ci", remove_unused_imports, { desc = "Remove Unused Imports" })

-- Diff open buffers
vim.keymap.set("n", "<leader>bX", function()
  if vim.o.diff then
    vim.cmd("windo diffoff")
  else
    vim.cmd("windo diffthis")
  end
end, { desc = "Toggle diff on open buffers" })
