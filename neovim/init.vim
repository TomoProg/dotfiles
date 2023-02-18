" 色分け機能追加
syntax on

" 行番号表示
set number

" タブ幅
set tabstop=4

" スマートインデント
set smartindent

" 括弧を入力した際に対応する括弧に飛ぶ
" 対応する括弧に飛ぶ時間
set showmatch
set matchtime=1

" 検索が末尾まで進んだら先頭から再開する
set wrapscan

" '<', '>'で進む幅
set shiftwidth=4

" スワップファイルを作成しない
set noswapfile

" 行を折り返さない
set nowrap

" 空白文字などの特殊な文字を表示する
set list
set listchars=tab:>.,trail:_,extends:>,precedes:<,nbsp:%

" undoファイルを作成する
set undofile
set undodir=/tmp

" クリップボードにコピーする
" nnoremap <Space>y "*yy
" vnoremap <Space>y "*yy
set clipboard+=unnamed

" 検索ハイライトの削除
nnoremap <ESC><ESC> :noh<cr>

" ファイル開く
let g:mapleader = "\<Space>" 
" nnoremap <silent> <Leader>, : ~/.config/nvim/.init.vim<CR>
nnoremap <Leader>, :new ~/.config/nvim/init.vim<CR>

let g:python3_host_prog = expand('/usr/bin/python3')

" ----- ここからdein.vimの設定 -----
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  " 追加プラグイン
  " ファイルツリー
  call dein#add('scrooloose/nerdtree')
  call dein#add('Shougo/denite.nvim')
  " カラースキーマ
  call dein#add('jacoborus/tender.vim')
  call dein#add('morhetz/gruvbox')
  call dein#add('tomasr/molokai', {'merged': 0})

  call dein#add('elixir-editors/vim-elixir')

  " language server関連
  call dein#add('williamboman/mason.nvim')
  call dein#add('neovim/nvim-lspconfig')
  call dein#add('hrsh7th/cmp-nvim-lsp')
  call dein#add('hrsh7th/cmp-buffer')
  call dein#add('hrsh7th/cmp-path')
  call dein#add('hrsh7th/cmp-cmdline')
  call dein#add('hrsh7th/nvim-cmp')
  call dein#add('hrsh7th/cmp-vsnip')
  call dein#add('hrsh7th/vim-vsnip')

  call dein#end()
  call dein#save_state()

endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
"colorscheme tender
"set background=dark    " Setting dark mode
colorscheme gruvbox
"colorscheme molokai
syntax enable

lua <<EOF
  -- setup mason
  require("mason").setup()

  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['clangd'].setup {
    capabilities = capabilities
  }
EOF
