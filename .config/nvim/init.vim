" basic options
filetype plugin on
set nocompatible
set path+=**
set updatetime=100
set wildmenu
syntax on
set encoding=utf-8

" colours
hi LineNr ctermfg=8
hi CursorLineNr ctermfg=5
hi TabLineSel ctermfg=5 ctermbg=0
hi TabLine ctermfg=7 ctermbg=0
hi TabLineFill ctermfg=0 ctermbg=1
hi Pmenu ctermfg=7 ctermbg=0

" disable bells
set t_vb=
set visualbell

" hide end of file symbols
hi EndOfBuffer ctermbg=black ctermfg=black guibg=black guifg=black

" auto commands
augroup General
    autocmd FileType markdown,text,tex
        \ setlocal spell textwidth=80 nowrap |
        \ call lexical#init() " |
        " \ call pencil#init({'wrap': 'hard'})
    autocmd VimResized * execute "normal \<C-W>="
augroup END

augroup Syntax
    autocmd Filetype python set noexpandtab tabstop=4 shiftwidth=4
    autocmd Filetype vim set expandtab tabstop=2 shiftwidth=2
    autocmd Filetype rust
        \ set noexpandtab tabstop=4 shiftwidth=4 |
        \ %retab!
    autocmd BufReadPost,BufNewFile *.asm setlocal ft=nasm tabstop=8 noexpandtab
augroup END

augroup Build
    autocmd Filetype c set makeprg=gcc\ -o\ '%<'.out\ '%'
    autocmd Filetype cpp,c++ set makeprg=g++\ -o\ '%<'.out\ '%'\ -std=c++17
    autocmd Filetype typescript setlocal makeprg=tsc\ '%'
augroup END

" indenting
set shiftwidth=4
set tabstop=4
set noexpandtab
set autoindent
set smartindent
filetype plugin indent on

" line wrapping
hi ColorColumn ctermbg=8
set colorcolumn=81
set nowrap
set textwidth=0
set wrapmargin=0

" pandoc
let g:pandoc#formatting#mode='hA'
let g:pandoc#folding#mode='relative'

" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" vimwiki
let g:vimwiki_ext2syntax = {}

" netrw
let g:netrw_banner=0        " disable annoying banner
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" vim-latex-live-preview
let g:livepreview_previewer = 'zathura'
let g:livepreview_use_biber = 1
let g:livepreview_cursorhold_recompile = 0

" no backup file
set undofile

" plugins
call plug#begin('~/.config/nvim/plugged')
    " lsp
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/cmp-nvim-lsp'

    " autocompletion engine
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'onsails/lspkind-nvim'

    " autocomplete langs
    Plug 'simrat39/rust-tools.nvim'

    " snips
    Plug 'SirVer/ultisnips'
    Plug 'quangnguyen30192/cmp-nvim-ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }

    " analysis and debugging
    Plug 'dense-analysis/ale'
    Plug 'puremourning/vimspector'

    " customization
    Plug 'airblade/vim-gitgutter'

    " syntax highlighting
    Plug 'sheerun/vim-polyglot'
    Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'sirtaj/vim-maildrop'
    Plug 'elkowar/yuck.vim'

    " libs
    Plug 'google/vim-maktaba'
    Plug 'google/vim-glaive'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'kyazdani42/nvim-web-devicons'

    " editing
    Plug 'junegunn/vim-easy-align'
    Plug 'reedes/vim-wordy'
    Plug 'reedes/vim-pencil'
    Plug 'reedes/vim-lexical'
    Plug 'vim-pandoc/vim-pandoc'
    Plug 'wakatime/vim-wakatime'
    Plug 'tpope/vim-abolish'
    Plug 'lervag/vimtex'
    Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
call plug#end()

" ultisnips
nnoremap <C-E> <nop>

let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger = '<c-e>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" octo colours
hi DiffAdd ctermfg=4 ctermbg=0
hi DiffChange ctermfg=5 ctermbg=0
hi DiffDelete ctermfg=6 ctermbg=0
hi DiffText ctermfg=4 ctermbg=0 cterm=bold

" automatic linting, courtesy of ale
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\  '*': ['remove_trailing_lines', 'trim_whitespace'],
\  'javascript': ['eslint'],
\  'typescript': ['eslint'],
\  'python': ['autopep8'],
\}
let g:ale_linters = {
\  'javascript': ['eslint'],
\  'typescript': ['eslint', 'tsserver'],
\}

" debugging (vimspector)
let g:vimspector_enable_mappings = 'HUMAN'

" searching
set hlsearch
set ignorecase
set incsearch
set smartcase
nnoremap <esc> :noh<LF>

" set title of file as window title
set title

" show invisible characters
set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_

" spelling
set spelllang=en_gb
hi SpellBad ctermbg=1 ctermfg=0

" editing remaps
inoremap jk <esc>
inoremap <esc> <nop>

" splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" ui
set number
set relativenumber
set scrolloff=10
set cmdheight=1
set shortmess=at

" status bar colors
hi StatusLine ctermfg=0 ctermbg=8 cterm=none term=none
hi User1 ctermfg=8 ctermbg=0 cterm=none term=none
hi User2 ctermfg=8 ctermbg=none cterm=none term=none
hi User3 ctermfg=8 ctermbg=0 cterm=none term=none
hi User4 ctermfg=0 ctermbg=8 cterm=none term=none

" status bar
set statusline=\                    "
set statusline+=%t                  "
set statusline+=\ %1*\              "
set statusline+=%y                  "
set statusline+=\ %2*\              "
set statusline+=%=                  "
set statusline+=\ %3*\              "
set statusline+=line                "
set statusline+=\                   "
set statusline+=%l:%c               "
set statusline+=\ %4*\              "
set statusline+=of                  "
set statusline+=\                   "
set statusline+=%L                  "
set statusline+=\                   "

" lsp remaps
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>

" Quick-fix
nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>

lua <<EOF
  -- Setup rust-tools.
  local nvim_lsp = require('lspconfig')

  --
  require('rust-tools').setup({
    tools = {
      autoSetHints = true,
      hover_with_actions = true,
      runnables = {
        use_telescope = true
      },
      inlay_hints = {
        show_parameter_hints = true,
        parameter_hints_prefix = "",
        other_hints_prefix = "",
      },
    },
    -- opts for nvim-lspconfig. these override defaults set by rust-tools.nvim.
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
    --[[
    server = {
      settings = {
        ["rust-analyzer"] = {
          checkOnSave = { command = "clippy" }
        }
      }
    }
    --]]
  })
  --

  -- Setup nvim-cmp.
  local cmp = require('cmp')
  local lspkind = require('lspkind')

  cmp.setup({
    formatting = {
      format = lspkind.cmp_format({
        with_text = true,
        menu = ({
          buffer = "[Buf]",
          nvim_lsp = "[LSP]",
          cmp_tabnine = "[TN]"
        })
      })
    },
    snippet = {
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body)
      end,
    },
    mapping = {
      ['<C-k>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-j>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<Tab>'] = cmp.mapping.select_next_item(),
      ['<S-Tab>'] = cmp.mapping.select_prev_item(),
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      })
    },
    sources = cmp.config.sources({
      { name = 'path' },
      { name = 'buffer' },
      { name = 'nvim_lsp' },
      { name = 'cmp_tabnine' },
      { name = 'ultisnips' },
      { name = 'crates' },
    })
  })

  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  local lspconfig = require('lspconfig')
  lspconfig['tsserver'].setup {
    capabilities = capabilities;
  }
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  -- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
  --   capabilities = capabilities
  -- }

  require('cmp_tabnine.config'):setup({
    max_lines = 1000;
    max_num_results = 20;
    sort = true;
    snippet_placeholder = '..';
  })
EOF

" Show diagnostic popup on cursor hover (300ms)
set updatetime=300
autocmd CursorHold * lua vim.diagnostic.open_float()

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
