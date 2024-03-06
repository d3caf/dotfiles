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

vim.keymap.set("n", "<C-x>", vim.diagnostic.open_float)
vim.keymap.set(
  "n",
  "<leader>cr",
  require("telescope.builtin").lsp_references,
  { noremap = true, silent = true, desc = "Find References" }
)
vim.keymap.set("n", "<leader>ci", remove_unused_imports, { desc = "Remove Unused Imports" })
