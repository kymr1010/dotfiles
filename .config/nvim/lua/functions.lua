local Terminal = require("toggleterm.terminal").Terminal

local function git_root()
  local out = vim.fn.systemlist("git rev-parse --show-toplevel")
  if vim.v.shell_error ~= 0 or #out == 0 then
    vim.notify("Git repository not found", vim.log.levels.WARN)
    return nil
  end
  return out[1]
end

local function make_lazygit_terminal(cmd, dir)
  local root = dir or git_root()
  if not root then return nil end
  return Terminal:new({
    cmd = cmd or "lazygit",
    dir = root,
    direction = "float",
    float_opts = { border = "double" },
    on_open = function(term)
      vim.cmd("startinsert!")
      vim.keymap.set("t", "q", [[<C-\><C-n>:close<CR>]], { buffer = term.bufnr, noremap = true, silent = true })
    end,
    on_close = function(_)
      vim.cmd("startinsert!")
    end,
  })
end

function _lazygit_toggle_repo()
  local t = make_lazygit_terminal("lazygit", git_root())
  if t then t:toggle() end
end

function _lazygit_toggle_file_history()
  local root = git_root(); if not root then return end
  local file_abs = vim.api.nvim_buf_get_name(0)
  if file_abs == "" then
    vim.notify("No file", vim.log.levels.WARN); return
  end

  local rel = vim.fs.relpath(root, file_abs)

  if not rel or rel == "" then
    vim.notify("Failed to make relative path", vim.log.levels.ERROR); return
  end

  -- 引数のクォートは必須（スペース/日本語対策）
  local cmd = string.format('lazygit -f %q', rel)
  
  local t = make_lazygit_terminal(cmd, root)
  if t then t:toggle() end
end

function _git_checkout_branch()
  local root = git_root(); if not root then return end
  local branches = vim.fn.systemlist(("git -C %q for-each-ref --format=%%(refname:short) refs/heads"):format(root))
  if vim.v.shell_error ~= 0 or #branches == 0 then
    vim.notify("No local branches", vim.log.levels.WARN)
    return
  end
  vim.ui.select(branches, { prompt = "Checkout branch > " }, function(choice)
    if not choice then return end
    local out = vim.fn.systemlist(("git -C %q switch %q"):format(root, choice))
    if vim.v.shell_error == 0 then
      vim.notify("Switched to " .. choice)
    else
      vim.notify(table.concat(out, "\n"), vim.log.levels.ERROR)
    end
  end)
end

