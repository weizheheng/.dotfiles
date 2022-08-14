" call plug#begin('~/.vim/plugged')
call plug#begin()
Plug 'sheerun/vim-polyglot'
Plug 'kabouzeid/nvim-lspinstall'
Plug '~/plugins/nord-vim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
" :Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug '~/plugins/telescope.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'tpope/vim-fugitive'
Plug 'vim-test/vim-test'
Plug 'mg979/vim-visual-multi'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'szw/vim-maximizer'
Plug 'cohama/lexima.vim'
Plug 'voldikss/vim-floaterm'
Plug '~/plugins/vim-closetag'
Plug 'weizheheng/nvim-workbench'
" Plug '~/plugins/nvim-workbench'
Plug '~/plugins/friendly-snippets'
Plug '~/plugins/swap-buffers.nvim'
Plug 'hrsh7th/vim-vsnip'
Plug 'AndrewRadev/tagalong.vim'
Plug 'andymass/vim-matchup'
Plug 'ap/vim-css-color'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'tjdevries/express_line.nvim'
Plug 'tjdevries/nlua.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'tpope/vim-commentary'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'ray-x/lsp_signature.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'MunifTanjim/nui.nvim'
Plug 'arnamak/stay-centered.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'stevearc/dressing.nvim'
call plug#end()

set termguicolors
colorscheme nord

let mapleader = " "

nnoremap <C-s> :NvimTreeToggle<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
nnoremap <leader>f :lua vim.lsp.buf.formatting_sync({}, 5000)<CR>


" my personal remap
inoremap jk <Esc>
vnoremap < <gv
vnoremap > >gv
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>th <C-w>t<C-w>H
nnoremap <leader>tk <C-w>t<C-w>K
noremap  <leader>hh :set invhlsearch hlsearch?<CR>
noremap  <leader>rv :vertical resize 155<CR>

" Theprimeagen remap
" nnoremap Y y$
" Keeping it centered
nnoremap n nzzzv
nnoremap N Nzzzv
" nnoremap J mzJ`z
" Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
" Jumplist mutations
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
" Moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Workbench
nmap <leader>bp <Plug>ToggleProjectWorkbench
nmap <leader>bb <Plug>ToggleBranchWorkbench
nmap <leader><CR> <Plug>WorkbenchToggleCheckbox

" greatest remap ever
" vnoremap <leader>p "_dP
nnoremap <leader>v "0p

" next greatest remap ever : asbjornHaland
nnoremap <leader>Y gg"+yG
vnoremap <leader>d "_d
nnoremap <leader>br :%s//g<Left><Left>
nnoremap <leader>gsr :cdo s//gc<Left><Left><Left>

let g:closetag_close_shortcut = ",>"
let g:closetag_filenames = '*.erb,*.slim,*.tsx,*.html'
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ }

" Matchup config
let g:matchup_matchparen_deferred = 1
let g:matchup_matchparen_offscreen = {}

lua require('marcus.lsp')
lua require('marcus.cmp')
lua require('marcus.telescope')
lua require('marcus.expressline')
lua require('marcus.autocommands')

lua <<EOF

require'nvim-tree'.setup({
    renderer = {
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = false,
            git = true,
          },
        }
    }
})
require"stay-centered"
require('swap-buffers').setup({
  ignore_filetypes = {'NvimTree'}
})
EOF
