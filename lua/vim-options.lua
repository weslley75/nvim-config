vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Configurações básicas de edição
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.number = true
vim.opt.relativenumber = true

-- Experiência de usuário melhorada
vim.opt.backspace = "2"
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.updatetime = 100 -- Reduzido de 250 para maior responsividade de Git e LSP
vim.opt.timeout = true
vim.opt.timeoutlen = 300 -- Reduzido para acelerar comandos com leader key

-- Sem arquivos de swap, mas com histórico de undo persistente
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")
vim.opt.undofile = true

-- Pesquisa melhorada
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Configuração de divisões e rolagem
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Visual
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes" -- Sempre mostra a coluna de sinal para evitar deslocamento de texto
vim.opt.cmdheight = 1
vim.opt.showmode = false   -- Não é necessário com lualine
vim.opt.wrap = false       -- Desabilita quebra de linha por padrão

-- Comportamento do clipboard
vim.opt.clipboard = "unnamedplus" -- Integração com o clipboard do sistema

-- Para arquivos muito grandes
vim.opt.redrawtime = 1500 -- Tempo de redesenho aumentado para arquivos grandes

-- Diagnósticos
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = true,
  },
})
