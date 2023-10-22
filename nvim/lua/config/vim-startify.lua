vim.g.startify_change_to_vcs_root = 1
vim.g.startify_session_delete_buffers = 1
vim.g.startify_fortune_use_unicode = 1
vim.g.startify_enable_special = 0
vim.g.startify_custom_header = {
    '   _  __     _         __  ___         __     ___ ',
    '  / |/ /  __(_)_ _    /  |/  /__ _____/ /    |_  |',
    ' /    / |/ / /  ` \\  / /|_/ / _ `/ __/ _ \\  / __/ ',
    '/_/|_/|___/_/_/_/_/ /_/  /_/\\_,_/\\__/_//_/ /____/ ',
}
vim.g.startify_lists = {
    { type = 'files', header = { '   Files' } },
    --{ type= 'dir',       header= {'   Current Directory '}},
    { type = 'bookmarks', header = { '   Bookmarks' } },
}
vim.g.startify_bookmarks = {
    { d = '~/dotfiles' },
    { w = '~/documents/work' },
    { s = '~/documents/side-projects' },
    { r = '~/documents/random' }
}

