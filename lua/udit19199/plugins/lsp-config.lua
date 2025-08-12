return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      ensure_installed = {
        -- JavaScript/TypeScript ecosystem
        "ts_ls",              -- TypeScript/JavaScript (updated from tsserver)
        "tailwindcss",        -- Tailwind CSS
        "eslint",             -- ESLint linting
        
        -- Web technologies
        "html",               -- HTML
        "cssls",              -- CSS
        "emmet_ls",           -- HTML/CSS snippets
        
        -- Data & APIs
        "jsonls",             -- JSON
        "graphql",            -- GraphQL
        "prismals",           -- Prisma ORM
        
        -- Systems & DevOps
        "clangd",             -- C/C++
        "dockerls",           -- Docker
        "bashls",             -- Bash scripting
        
        -- Config
        "lua_ls",             -- Lua (Neovim config)
      },
      automatic_installation = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")

      -- TypeScript/JavaScript with Next.js support
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = 'all',
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
            }
          }
        },
        -- Next.js specific file types
        filetypes = { 
          "javascript", "javascriptreact", "typescript", "typescriptreact",
          -- Next.js specific
          "typescript.tsx", "javascript.jsx"
        }
      })

      -- Tailwind CSS
      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
      })

      -- HTML with better React support
      lspconfig.html.setup({
        capabilities = capabilities,
        filetypes = { "html", "templ" },
      })

      -- CSS
      lspconfig.cssls.setup({
        capabilities = capabilities,
      })

      -- JSON
      lspconfig.jsonls.setup({
        capabilities = capabilities,
        settings = {
          json = {
            schemas = require('schemastore').json.schemas(),
            validate = { enable = true },
          },
        },
      })

      -- ESLint
      lspconfig.eslint.setup({
        capabilities = capabilities,
        settings = {
          workingDirectory = { mode = "auto" }
        }
      })

      -- Prisma ORM
      lspconfig.prismals.setup({
        capabilities = capabilities,
      })

      -- C/C++ development
      lspconfig.clangd.setup({
        capabilities = capabilities,
        cmd = { "clangd", "--background-index", "--clang-tidy", "--header-insertion=iwyu" },
        filetypes = { "c", "cpp", "cc", "cxx", "h", "hpp" },
      })

      -- Emmet for fast HTML/CSS (supports JSX/TSX)
      lspconfig.emmet_ls.setup({
        capabilities = capabilities,
        filetypes = { 
          "html", "css", "scss", "sass", "less",
          -- React/Next.js support
          "typescriptreact", "javascriptreact", "jsx", "tsx"
        }
      })

      -- GraphQL
      lspconfig.graphql.setup({
        capabilities = capabilities,
        filetypes = { "graphql", "gql", "svelte", "astro", "vue", "typescript", "javascript" }
      })

      -- Docker
      lspconfig.dockerls.setup({
        capabilities = capabilities,
      })

      -- Lua (for Neovim config)
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT"
            },
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })

      -- Global LSP handlers for better UX
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
      })

      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
      })

      -- Diagnostic configuration
      vim.diagnostic.config({
        virtual_text = {
          prefix = "●", -- Could be '■', '▎', 'x'
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      })

      -- Diagnostic keymaps
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
      vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic" })
      vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Diagnostic list" })
    end,
  },
  -- Schema store for JSON
  {
    "b0o/schemastore.nvim",
  },
}
