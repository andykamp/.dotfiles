" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/mikael/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/mikael/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/mikael/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/mikael/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/mikael/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/mikael/.local/share/nvim/site/pack/packer/start/LuaSnip"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/mikael/.local/share/nvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/mikael/.local/share/nvim/site/pack/packer/start/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/mikael/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/mikael/.local/share/nvim/site/pack/packer/start/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/mikael/.local/share/nvim/site/pack/packer/start/cmp_luasnip"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/mikael/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  harpoon = {
    loaded = true,
    path = "/home/mikael/.local/share/nvim/site/pack/packer/start/harpoon"
  },
  ["headlines.nvim"] = {
    loaded = true,
    path = "/home/mikael/.local/share/nvim/site/pack/packer/start/headlines.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/mikael/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/mikael/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/mikael/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/mikael/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/mikael/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/mikael/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/mikael/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/mikael/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["onedark.vim"] = {
    loaded = true,
    path = "/home/mikael/.local/share/nvim/site/pack/packer/start/onedark.vim"
  },
  ["org-bullets.nvim"] = {
    config = { "\27LJ\2\nd\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\fsymbols\1\0\0\1\5\0\0\b???\b???\b???\b???\nsetup\16org-bullets\frequire\0" },
    loaded = true,
    path = "/home/mikael/.local/share/nvim/site/pack/packer/start/org-bullets.nvim"
  },
  orgmode = {
    loaded = true,
    path = "/home/mikael/.local/share/nvim/site/pack/packer/start/orgmode"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/mikael/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/mikael/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/mikael/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/mikael/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/mikael/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gutentags"] = {
    loaded = true,
    path = "/home/mikael/.local/share/nvim/site/pack/packer/start/vim-gutentags"
  },
  ["vim-oscyank"] = {
    loaded = true,
    path = "/home/mikael/.local/share/nvim/site/pack/packer/start/vim-oscyank"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/home/mikael/.local/share/nvim/site/pack/packer/start/vim-rhubarb"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/mikael/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/home/mikael/.local/share/nvim/site/pack/packer/start/vim-test"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/home/mikael/.local/share/nvim/site/pack/packer/start/vim-unimpaired"
  },
  ["vim-vinegar"] = {
    loaded = true,
    path = "/home/mikael/.local/share/nvim/site/pack/packer/start/vim-vinegar"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: org-bullets.nvim
time([[Config for org-bullets.nvim]], true)
try_loadstring("\27LJ\2\nd\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\fsymbols\1\0\0\1\5\0\0\b???\b???\b???\b???\nsetup\16org-bullets\frequire\0", "config", "org-bullets.nvim")
time([[Config for org-bullets.nvim]], false)
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
