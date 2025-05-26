local mapKey = require("utils.keyMapper").mapKey

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("neovim-starter", { clear = true }),
    callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)

        -- if client:supports_method('textDocument/completion') then
        --     vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
        --
        --     vim.cmd("set completeopt+=noselect") -- autocompletion is buggy without this
        -- end

        -- vim.diagnostic.config({
        --     -- Use the default configuration
        --     virtual_lines = true
        --
        --     -- Alternatively, customize specific options
        --     -- virtual_lines = {
        --     --     -- Only show virtual line diagnostics for the current cursor line
        --     --     current_line = true,
        --     -- },
        -- })

        mapKey("gd", ":lua vim.lsp.buf.definition()<CR>")
    end,
})



vim.lsp.enable({
    "luals",
    "gopls",
    "html",
    "ts_ls",
    "clangd",
})
