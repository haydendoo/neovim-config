require("nvchad.configs.lspconfig").defaults()

local servers = {
    "html",
    "cssls",
    "tailwindcss",
    "pyright",
    "gopls",
    "elixirls",
    "clangd",
    "ts_ls",
    "terraformls",
    "dockerls",
    "docker_compose_language_service",
    "roslyn",
    "rust_analyzer"
}

vim.lsp.enable(servers)

vim.lsp.config("ts_ls", {
    init_options = vim.fn.isdirectory(vim.fn.getcwd() .. "/node_modules/typescript") == 1
        and {
            typescript = {
                tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib"
            }
        }
        or {},
    settings = {
        typescript = {
            inlayHints = {
                includeInlayParameterNameHints = 'none',
            },
            suggest = {
                autoImports = true,
            },
        },
        javascript = {
            inlayHints = {
                includeInlayParameterNameHints = 'none',
            },
            suggest = {
                autoImports = true,
            },
        },
    },
})

vim.lsp.config("roslyn", {
    on_attach = function()
        print("This will run when the server attaches!")
    end,
    settings = {
        ["csharp|inlay_hints"] = {
            csharp_enable_inlay_hints_for_implicit_object_creation = true,
            csharp_enable_inlay_hints_for_implicit_variable_types = true,
        },
        ["csharp|code_lens"] = {
            dotnet_enable_references_code_lens = true,
        },
    },
})
