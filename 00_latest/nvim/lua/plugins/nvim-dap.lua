return {
    "mfussenegger/nvim-dap",
    lazy = true,
    dependencies = {
        {
            "rcarriga/nvim-dap-ui",
            dependencies = { "nvim-neotest/nvim-nio" }
        },
        'leoluz/nvim-dap-go',
        {
            "jay-babu/mason-nvim-dap.nvim",
            config = function()
                require("mason-nvim-dap").setup({
                    -- https://github.com/jay-babu/mason-nvim-dap.nvim/blob/main/lua/mason-nvim-dap/mappings/source.lua
                    ensure_installed = { "delve", "js" }
                })
            end
        }
    },
    keys = {
        { "<leader>dt", function() require 'dapui'.toggle() end,          desc = "Toggle DAP UI" },
        { "<leader>db", function() require 'dap'.toggle_breakpoint() end, desc = "Toggle Breakpoint" },
        { "<leader>dc", function() require 'dap'.continue() end,          desc = "Continue" },
        { "<leader>do", function() require 'dap'.step_over() end,         desc = "Step Over" },
        { "<leader>di", function() require 'dap'.step_into() end,         desc = "Step Into" },
        { "<leader>du", function() require 'dap'.step_out() end,          desc = "Step Out" },
        { "<leader>dr", function() require 'dap'.repl.open() end,         desc = "Open REPL" },
        { "<leader>dl", function() require 'dap'.run_last() end,          desc = "Run Last" },
        { "<leader>dX", function() require 'dap'.terminate() end,         desc = "Terminate" },
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")
        local dapgo = require("dap-go")

        dap.set_log_level("INFO") -- Set to "TRACE" or "DEBUG" for more detailed logs

        dapui.setup()
        dapgo.setup()

        -- Path to the js-debug-adapter executable (dapDebugServer.js)
        -- Ensure 'js-debug-adapter' is installed via Mason: `:MasonInstall js-debug-adapter`
        local js_debug_adapter_path = vim.fn.expand("$MASON/packages/js-debug-adapter/js-debug/src/dapDebugServer.js")

        -- Manual setup for js-debug-adapter (used by pwa-node, pwa-chrome)
        -- nvim-dap starts this server, then sends the chosen configuration (attach/launch) to it.
        local js_adapter_definition = {
            type = "server",
            host = "localhost",
            port = "${port}", -- nvim-dap substitutes this with a free port
            executable = {
                command = "node",
                args = { js_debug_adapter_path, "${port}", host },
            },
        }

        dap.adapters["pwa-node"] = js_adapter_definition
        dap.adapters["pwa-chrome"] = js_adapter_definition

        -- Common skipFiles for JS/TS
        local common_skip_files = {
            "${workspaceFolder}/node_modules/**/*.js",
            "<node_internals>/**/*.js",
        }

        local function port_prompt(default)
            default = default or "9222"
            local co = coroutine.running()
            return coroutine.create(function()
                vim.ui.input({ prompt = "Enter PORT: ", default = default }, function(port)
                    if port == nil or port == "" then
                        return
                    else
                        coroutine.resume(co, port)
                    end
                end)
            end)
        end

        local js_ts_dap_configs = {
            {
                type = "pwa-node",
                request = "attach",
                name = "Node: Attach to Process (Port Prompt)",
                port = port_prompt,
                cwd = "${workspaceFolder}",
                sourceMaps = true, -- Default to true; can be an issue for plain JS without maps
                skipFiles = common_skip_files,
            },
            {
                type = "pwa-chrome",
                request = "launch",
                name = "Chrome: Launch Client",
                url = "http://localhost:3000",
                webRoot = "${workspaceFolder}",
                sourceMaps = true,
                userDataDir = false,
            },
            {
                type = "pwa-node",
                request = "launch",
                name = "Node: Launch Current File (CLI)",
                program = "${file}",
                cwd = "${workspaceFolder}",
                sourceMaps = true,              -- Set to false if plain JS without transpilation
                skipFiles = common_skip_files,
                console = "integratedTerminal", -- Or "internalConsole"
            },
            {
                type = "pwa-node",
                request = "launch",
                name = "Node: Launch Compiled TS App (e.g., dist/index.js)",
                program = "${workspaceFolder}/dist/index.js", -- Adjust if your entry point is different
                cwd = "${workspaceFolder}",
                sourceMaps = true,
                skipFiles = common_skip_files,
                console = "integratedTerminal",
                outFiles = { "${workspaceFolder}/dist/**/*.js" }, -- Crucial for mapping to TS sources
            },
            {
                type = "pwa-node",
                request = "launch",
                name = "Node: Launch JS File (Prompt)",
                cwd = "${workspaceFolder}",
                sourceMaps = false, -- Typically false for plain JS not using a transpiler
                skipFiles = common_skip_files,
                console = "integratedTerminal",
            },
        }

        for _, language in ipairs({ "typescript", "javascript", "javascriptreact", "typescriptreact" }) do
            dap.configurations[language] = vim.deepcopy(js_ts_dap_configs)
        end

        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open({ reset = true })
        end
        dap.listeners.before.event_terminated["dapui_config"] = dapui.close
        dap.listeners.before.event_exited["dapui_config"] = dapui.close
    end
}
