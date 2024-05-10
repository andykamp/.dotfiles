_G.RemoveCurrentQFEntry= function()
  -- Get the current line number in the quickfix window
  local index = vim.fn.line('.')
  
  -- Fetch the current quickfix list
  local qflist = vim.fn.getqflist()
  
  -- Remove the entry at the current line (adjust for 1-based Lua index)
  table.remove(qflist, index)
  
  -- Update the quickfix list
  vim.fn.setqflist({}, 'r', {items = qflist})
  
  -- Optionally, refresh the quickfix window
  vim.cmd('cwindow')
end

local map = vim.api.nvim_set_keymap
map('n', '<leader>q', '<Cmd>lua _G.RemoveCurrentQFEntry()<CR>', { noremap = true, silent = true, desc = "Remove current entry from QuickFix" })


-- -- Define the function globally
-- _G.RemoveCurrentQFEntryGlobal = function()
--   -- Find the quickfix window and get the index of the currently selected entry
--   local qf_win_id = vim.fn.getqflist({ winid = 0 }).winid
--   if qf_win_id ~= 0 then
--     vim.api.nvim_set_current_win(qf_win_id) -- Switch to quickfix window
--     local index = vim.fn.line('.')
--     local qflist = vim.fn.getqflist()
--     table.remove(qflist, index)
--     vim.fn.setqflist({}, 'r', {items = qflist})
--     vim.cmd('cwindow') -- Optionally refresh the quickfix window
--     vim.cmd('wincmd p') -- Go back to the previous window
--   else
--     print("Quickfix list is not open.")
--   end
-- end

-- -- Set the key mapping
-- local map = vim.api.nvim_set_keymap
-- map('n', '<leader>q', '<cmd>lua RemoveCurrentQFEntryGlobal()<CR>', { noremap = true, silent = true, desc = "Remove current entry from QuickFix globally" })


-- Define the function globally
-- _G.RemoveAndJumpNextQFEntry = function()
--   -- Find the quickfix window and get the index of the currently selected entry
--   local qf_win_id = vim.fn.getqflist({winid = 0}).winid
--   if qf_win_id ~= 0 then
--     vim.api.nvim_set_current_win(qf_win_id) -- Switch to quickfix window
--     local index = vim.fn.line('.')
--     local qflist = vim.fn.getqflist()

--     -- Remove the entry and refresh quickfix window
--     table.remove(qflist, index)
--     vim.fn.setqflist({}, 'r', {items = qflist})
--     vim.cmd('cwindow')

--     -- Move cursor to next item or the last item if at end
--     local next_index = (index > #qflist) and #qflist or index
--     if next_index > 0 then
--       vim.api.nvim_win_set_cursor(qf_win_id, {next_index, 0}) -- Move cursor to the next index
--     end

--     -- Go back to the previous window and open the next buffer
--     vim.cmd('wincmd p')
--     vim.cmd('cnext') -- Open the buffer corresponding to the new cursor position in quickfix
--   else
--     print("Quickfix list is not open.")
--   end
-- end

-- -- Set the key mapping
-- local map = vim.api.nvim_set_keymap
-- map('n', '<leader>q', '<cmd>lua RemoveAndJumpNextQFEntry()<CR>', { noremap = true, silent = true, desc = "Remove current entry from QuickFix and jump to next" })

