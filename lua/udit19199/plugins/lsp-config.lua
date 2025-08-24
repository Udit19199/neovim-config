return {
  -- Mason: Package manager for LSP servers, linters, formatters, etc.
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

  -- Mason-LSPConfig: bridges Mason with nvim-lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      ensure_installed = {
        -- JavaScript/TypeScript ecosystem
        "ts_ls",              -- TypeScript/JavaScript
        "tailwindcss",        -- Tailwind CSS
        "eslint",             -- ESLint linting

        -- Web technologies
        "html",               -- HTML
        "cssls",              -- CSS
        "emmet_ls",           -- Emmet for snippets

        -- Data & APIs
        "jsonls",             -- JSON
        "graphql",            -- GraphQL
        "prismals",           -- Prisma ORM

        -- Systems & DevOps
        "clangd",             -- C/C++
        "dockerls",           -- Docker
        "bashls",             -- Bash scripting

        -- Config (REMOVED lua_ls to prevent auto-setup)
        -- We'll configure lua_ls manually only
      },
      automatic_installation = true,
      -- Completely disable automatic setup
      automatic_setup = false,
    },
  },

  -- nvim-lspconfig: Core LSP client configs
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      -- TypeScript/JavaScript
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
            },
          },
        },
        filetypes = {
          "javascript", "javascriptreact", "typescript", "typescriptreact",
          "typescript.tsx", "javascript.jsx",
        },
      })

      -- Tailwind CSS
      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
      })

      -- HTML
      lspconfig.html.setup({
        capabilities = capabilities,
        filetypes = { "html", "templ" },
      })

      -- CSS
      lspconfig.cssls.setup({
        capabilities = capabilities,
      })

      -- JSON with schemastore
      lspconfig.jsonls.setup({
        capabilities = capabilities,
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      })

      -- ESLint
      lspconfig.eslint.setup({
        capabilities = capabilities,
        settings = {
          workingDirectory = { mode = "auto" },
        },
      })

      -- Prisma
      lspconfig.prismals.setup({
        capabilities = capabilities,
      })

      -- C/C++
      lspconfig.clangd.setup({
        capabilities = capabilities,
        cmd = { "clangd", "--background-index", "--clang-tidy", "--header-insertion=iwyu" },
        filetypes = { "c", "cpp", "cc", "cxx", "h", "hpp" },
      })

      -- Emmet
      lspconfig.emmet_ls.setup({
        capabilities = capabilities,
        filetypes = {
          "html", "css", "scss", "sass", "less",
          "typescriptreact", "javascriptreact", "jsx", "tsx",
        },
      })

      -- GraphQL
      lspconfig.graphql.setup({
        capabilities = capabilities,
        filetypes = { "graphql", "gql", "svelte", "astro", "vue", "typescript", "javascript" },
      })

      -- Docker
      lspconfig.dockerls.setup({
        capabilities = capabilities,
      })

      -- Bash
      lspconfig.bashls.setup({
        capabilities = capabilities,
      })

      -- Python (since pyright was in your health check)
      lspconfig.pyright.setup({
        capabilities = capabilities,
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              diagnosticMode = "openFilesOnly",
              useLibraryCodeForTypes = true,
            },
          },
        },
      })

      -- SINGLE lua_ls configuration - this prevents duplicates
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            diagnostics = {
              globals = { "vim" }, -- Fix the vim global warning
            },
            workspace = {
              checkThirdParty = false,
              library = {
                vim.fn.expand("$VIMRUNTIME/lua"),
                vim.fn.stdpath("config") .. "/lua",
              },
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })

      -- Updated diagnostic configuration
      vim.diagnostic.config({
        virtual_text = {
          prefix = "◉", -- Clean unicode bullet point
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          border = "rounded",
          source = "if_many",
          header = "",
          prefix = "",
        },
      })

      -- Keymaps for diagnostics - using modern API
      vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, { desc = "Previous diagnostic" })
      vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, { desc = "Next diagnostic" })
      vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic" })
      vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Diagnostic list" })
    end,
  },

  -- JSON Schema Store
  {
    "b0o/schemastore.nvim",
    lazy = true,
  },
}
