local opt = vim.opt

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.mouse = 'a'
opt.clipboard = 'unnamed,unnamedplus'
opt.swapfile = false

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true
opt.relativenumber = true
opt.showmatch = true
opt.ignorecase = true
opt.smartcase = true
opt.linebreak = true

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
local indent = 4
opt.expandtab = true
opt.shiftwidth = indent
opt.smartindent = true
opt.tabstop = indent
opt.hidden = true
opt.scrolloff = 4
opt.shiftround = true
opt.splitbelow = true
opt.splitright = true
opt.wildmode = 'list:longest'

-----------------------------------------------------------
-- Highlight on yank
-----------------------------------------------------------
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.hl.on_yank({ on_visual = false })
  end,
})
