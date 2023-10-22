local map = vim.api.nvim_set_keymap
local options = { noremap = true }
-----------------------------------------------------------------------------
-- vimwiki
-- nice overview here https://mkaz.blog/working-with-vim/vimwiki/
-----------------------------------------------------------------------------

-- general 
-- <Leader>ws               :List and select available wikis.
-- <Leader>ww               :Go to the wiki index page (:VimwikiIndex)

--
-- list
-- cntr<Leader>             : to toggle list checkbox 
-- gl+space                 : to remove list checkbox
-- gln                      : to partially check list checkbox

-- diary
-- <Leader>wi               : Open diary index file (:VimwikiDiaryIndex) Do :VimwikiDiaryGenerateLinks to generate linked_states
-- <Leader>w<Leader>w       : Open diary wiki-file for today (:VimwikiMakeDiaryNote)
-- <Leader>w<Leader>y       : Open diary wiki-file for yesterday (:VimwikiMakeYesterdayDiaryNote)
-- <Leader>w<Leader>m       : Open diary wiki-file for tomorrow  (:VimwikiMakeTomorrowDiaryNote)

-- calender
-- <Leader>wc              : to open calendar view


vim.g.wiki_global_ext = 0
local l = {}
l.path = '~/vimwiki/'
l.syntax = 'markdown'
l.ext = '.md'
l.auto_diary_index = 1 -- autogenerate vimwiki diary
vim.g.vimwiki_list = { l }
-- vim.g.vimwiki_listsyms = '✗○◐●✓'
-- toggle list time to done/not done
-- not needed as cntr+space does the same
map('n', '<leader>wq', ':VimwikiToggleListItem<CR>', options)
-- open calendar view
map('n', '<leader>wc', ':CalendarVR<CR>', options)
-- map('n', '<leader>wr', ':VimwikiDiaryGenerateLinks<CR>', options)

-- Set timestampp
map('n', '<leader>wt', ":put =strftime('%c')<CR>", options)

