-- Single-tabpage interface for reviewing git diffs and file history
-- https://github.com/sindrets/diffview.nvim

local function select_local_branch(prompt, on_choice)
  local current = vim.fn.systemlist({ "git", "rev-parse", "--abbrev-ref", "HEAD" })[1]
  local branches = vim.fn.systemlist({ "git", "branch", "--format=%(refname:short)" })
  if vim.v.shell_error ~= 0 then
    vim.notify("Failed to list local git branches", vim.log.levels.ERROR)
    return
  end

  local choices = vim.tbl_filter(function(branch)
    return branch ~= "" and branch ~= current
  end, branches)

  if vim.tbl_isempty(choices) then
    vim.notify("No other local branches to choose from", vim.log.levels.WARN)
    return
  end

  vim.ui.select(choices, { prompt = prompt }, function(branch)
    if not branch then
      return
    end
    on_choice(branch)
  end)
end

return {
  "sindrets/diffview.nvim",
  cmd = {
    "DiffviewOpen",
    "DiffviewClose",
    "DiffviewFileHistory",
    "DiffviewToggleFiles",
    "DiffviewFocusFiles",
    "DiffviewRefresh",
  },
  opts = {
    keymaps = {
      view = {
        { "n", "<esc><esc>", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" } },
      },
      file_panel = {
        { "n", "<esc><esc>", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" } },
      },
      file_history_panel = {
        { "n", "<esc><esc>", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" } },
      },
    },
  },
  keys = {
    {
      "<leader>pd",
      "<cmd>DiffviewOpen<cr>",
      desc = "Diffview Open",
    },
    {
      "<leader>pD",
      "<cmd>DiffviewClose<cr>",
      desc = "Diffview Close",
    },
    {
      "<leader>ph",
      "<cmd>DiffviewFileHistory<cr>",
      desc = "Diffview File History",
    },
    {
      "<leader>pH",
      "<cmd>DiffviewFileHistory %<cr>",
      mode = "n",
      desc = "Diffview Current File History",
    },
    {
      "<leader>pH",
      ":'<,'>DiffviewFileHistory<cr>",
      mode = "v",
      desc = "Diffview Line Range History",
    },
    {
      "<leader>pr",
      function()
        select_local_branch("Diffview vs branch:", function(branch)
          vim.cmd("DiffviewOpen " .. vim.fn.fnameescape(branch))
        end)
      end,
      desc = "Diffview vs branch",
    },
    {
      "<leader>pc",
      function()
        select_local_branch("Diffview commits since branch:", function(branch)
          vim.cmd("DiffviewFileHistory --range=" .. vim.fn.fnameescape(branch) .. "..HEAD")
        end)
      end,
      desc = "Diffview commits since branch",
    },
  },
}
