-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

map("n", "<leader>fm", function()
  Snacks.rename.rename_file()
end, { desc = "Move/Rename file" })

map("n", "<leader>fd", function()
  local path = vim.api.nvim_buf_get_name(0)
  if path == "" then
    vim.notify("No file associated with the current buffer", vim.log.levels.WARN)
    return
  end

  -- Prompt for confirmation before deleting
  vim.ui.select({ "Yes, delete it", "Cancel" }, {
    prompt = "Permanently delete file from filesystem? \n" .. path,
  }, function(choice)
    if choice == "Yes, delete it" then
      local success = vim.fn.delete(path) == 0
      if success then
        Snacks.bufdelete({ buf = 0, force = true })
        vim.notify("File deleted: " .. path, vim.log.levels.INFO)
      else
        vim.notify("Failed to delete file on disk", vim.log.levels.ERROR)
      end
    end
  end)
end, { desc = "Delete File" })
