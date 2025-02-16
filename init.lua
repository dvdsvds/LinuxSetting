-- ~/.config/nvim/init.lua

-- 리더 키를 스페이스로 설정 (lazy.nvim 설정 전에 필요)
vim.g.mapleader = " "

-- 기본 옵션 설정
vim.opt.number = true         -- 줄 번호 표시
vim.opt.autoindent = true     -- 자동 들여쓰기
vim.opt.tabstop = 4           -- 탭 크기
vim.opt.expandtab = true      -- 탭을 스페이스로 대체
vim.opt.shiftwidth = 4        -- 자동 들여쓰기 크기
vim.opt.smarttab = true       -- 스마트 탭
vim.opt.softtabstop = 2       -- 편집할 때 탭 크기
vim.opt.termguicolors = true  -- 터미널 색상 지원
vim.opt.mouse = ""            -- 마우스 비활성화

-- lazy.nvim 설치
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 핵심 플러그인 설치
require("lazy").setup({
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require('tokyonight').setup({
        style = "night",
        transparent = true,
        terminal_colors = true,
      })
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  {
    "github/copilot.vim",
    lazy = false,
    config = function()
      -- Copilot 설정 (필요 시 추가)
    end,
  },
  { "jiangmiao/auto-pairs", lazy = false },
  {
    "preservim/nerdtree",
    lazy = false,
    config = function()
      vim.api.nvim_set_keymap('n', '<Leader>e', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<Leader>f', ':NERDTreeFind<CR>',   { noremap = true, silent = true })
    end,
  },
  { "Xuyuanp/nerdtree-git-plugin", lazy = false, dependencies = { "preservim/nerdtree" } },
  { "tiagofumo/vim-nerdtree-syntax-highlight", lazy = false, dependencies = { "preservim/nerdtree" } },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {},
    config = function()
      require('lualine').setup({
        options = { theme = 'tokyonight', icons_enabled = true }
      })
    end,
  },
  {
    "hashivim/vim-terraform",
    lazy = false,
    config = function()
      vim.g.terraform_fmt_on_save = 1
      vim.g.terraform_align = 1
    end,
  },
  {
    "numToStr/Comment.nvim",
    lazy = false,
    config = function()
      require("Comment").setup()
    end,
  },

  -- 자동완성을 위한 플러그인
  { 'hrsh7th/nvim-cmp', lazy = false },
  { 'hrsh7th/cmp-nvim-lsp', lazy = false },
  { 'neovim/nvim-lspconfig', lazy = false },

})

vim.g.NERDTreeShowIcons = 1

-- 기본 키매핑
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Ctrl + / 주석 처리 매핑
map('n', '<C-_>', '<Plug>(comment_toggle_linewise_current)', opts)
map('v', '<C-_>', '<Plug>(comment_toggle_linewise_visual)', opts)

-- 창 이동
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- nvim-cmp 설정 (자동완성)
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#expand"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = {
    { name = 'nvim_lsp' },  -- LSP 자동완성 소스
    { name = 'vsnip' },      -- 스니펫 소스 (선택사항)
  },
})

-- LSP 설정 (C++ 자동완성을 위한 clangd)
local lspconfig = require'lspconfig'

lspconfig.clangd.setup{
  on_attach = function(client, bufnr)
    -- LSP 관련 키맵핑
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', ':lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', ':lua vim.lsp.buf.references()<CR>', opts)
  end,
}

-- Python LSP 설정 (Pyright)
lspconfig.pyright.setup{
  on_attach = function(client, bufnr)
    -- LSP 관련 키맵핑
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', ':lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', ':lua vim.lsp.buf.references()<CR>', opts)
  end,
}


