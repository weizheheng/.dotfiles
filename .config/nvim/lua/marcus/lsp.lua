local signs = { Error = "E", Warn = "W", Hint = "H", Info = "I" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = false,
})


-- To instead override globally set floating preview to have border
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or "double"
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local on_attach = function(client)
    require "lsp_signature".on_attach()
end


require'lspconfig'.solargraph.setup {
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  }
}


-- require'lspinstall'.setup() -- important
-- For tailwind custom intellisence
require'lspconfig'.tailwindcss.setup{
  on_attach = function(client, bufnr)
    if client.server_capabilities.colorProvider then
      require("marcus.lsp-documentcolors").buf_attach(bufnr, { single_column = true })
    end
    on_attach(client)
  end,
  filetypes = { 'html', 'eruby', 'css', 'liquid'},
  root_dir = require('lspconfig').util.root_pattern('tailwind.config.js', 'tailwind.config.ts', 'postcss.config.js', 'postcss.config.ts', 'package.json', 'node_modules', '.git'),
  settings = {
    tailwindCSS = {
      classAttributes = { "class", "className", "classList", "ngClass" },
      experimental = {
        classRegex = {
        "class: \"([^\"]*)" -- <div class: "..." />
        }
      },
      lint = {
        cssConflict = "warning",
        invalidApply = "error",
        invalidConfigPath = "error",
        invalidScreen = "error",
        invalidTailwindDirective = "error",
        invalidVariant = "error",
        recommendedVariantOrder = "warning"
      },
      validate = true
    }
  }
}

require'lspconfig'.cssls.setup {
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    on_attach(client)
  end,
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  flags = {
    debounce_text_changes = 150,
  }
}

require'lspconfig'.html.setup{
  filetypes = { "html", "eruby" },
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    on_attach(client)
  end,
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  flags = {
    debounce_text_changes = 150,
  }
}

require'lspconfig'.jsonls.setup{
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    on_attach(client)
  end,
  flags = {
    debounce_text_changes = 150,
  }
}


require'lspconfig'.rust_analyzer.setup {
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  }
}

vim.cmd [[autocmd ColorScheme * highlight NormalFloat guibg=#1f2335]]
vim.cmd [[autocmd ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

require'lspconfig'.tsserver.setup {
    flags = {
      debounce_text_changes = 150,
    },
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
        require "nvim-lsp-ts-utils".setup {}
        on_attach(client)
    end
}

local prettier = require "efm/prettier"
local eslint = require "efm/eslint"
local eruby = require "efm/eruby"
local ruby = require "efm/ruby"
    -- filetypes = {
    --     "javascript",
    --     "typescript",
    --     "typescriptreact",
    --     "javascriptreact",
    -- },
require'lspconfig'.efm.setup {
    on_attach = on_attach,
    init_options = {documentFormatting = true},
    filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'json', 'html', 'eruby', 'css', 'scss'},
    root_dir = vim.loop.cwd,
    settings = {
        rootMarkers = {".git/"},
        languages = {
            typescript = {prettier, eslint},
            javascript = {prettier, eslint},
            typescriptreact = {prettier, eslint},
            javascriptreact = {prettier, eslint},
            yaml = {prettier},
            json = {prettier},
            html = {prettier},
            scss = {prettier},
            css = {prettier},
            eruby = {eruby},
            -- ruby= {ruby},
        }
    }
}


-- Sumneko for lua
-- https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
USER = vim.fn.expand('$USER')

local sumneko_root_path = ""
local sumneko_binary = ""

if vim.fn.has("mac") == 1 then
    sumneko_binary = "/Users/" .. USER .. "/.cache/nvim/nlua/sumneko_lua/lua-language-server/bin/macOS/lua-language-server"
    sumneko_root_path = "/Users/" .. USER .. "/.cache/nvim/nlua/sumneko_lua/lua-language-server"
elseif vim.fn.has("unix") == 1 then
    sumneko_root_path = "/home/" .. USER .. "/.config/nvim/lua-language-server"
    sumneko_binary = "/home/" .. USER .. "/.config/nvim/lua-language-server/bin/Linux/lua-language-server"
else
    print("Unsupported system for sumneko")
end

require'lspconfig'.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';')
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
            }
        }
    }
}
-- vim.o.updatetime = 10
-- vim.api.nvim_command [[autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false, border="double"})]]
