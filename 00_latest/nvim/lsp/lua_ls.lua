return {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { ".luarc.json", ".luarc.jsonc" },
    telemetry = { enabled = false },
    formatters = {
        ignoreComments = false,
    },
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            signatureHelp = { enabled = true },
        },
    },
}
