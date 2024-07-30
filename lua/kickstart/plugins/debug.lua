-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

---@module 'lazy'
---@type LazySpec
return {
  -- Installs the debug adapters for you
  {
    'jay-babu/mason-nvim-dap.nvim',
    opts = {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_installation = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        'codelldb',
      },
    },
    cmd = { 'DapInstall', 'DapUninstall' },
    dependencies = {
      'williamboman/mason.nvim',
    },
  },
  {
    -- NOTE: Yes, you can install new plugins here!
    'mfussenegger/nvim-dap',
    -- NOTE: And you can specify dependencies as well
    dependencies = {
      -- Add your own debuggers here
    },
    keys = {
      -- Basic debugging keymaps, feel free to change to your liking!
      {
        '<F5>',
        function()
          require('dap').continue()
        end,
        desc = 'Debug: Start/Continue',
      },
      {
        '<F1>',
        function()
          require('dap').step_into()
        end,
        desc = 'Debug: Step Into',
      },
      {
        '<F2>',
        function()
          require('dap').step_over()
        end,
        desc = 'Debug: Step Over',
      },
      {
        '<F3>',
        function()
          require('dap').step_out()
        end,
        desc = 'Debug: Step Out',
      },
      {
        '<leader>b',
        function()
          require('dap').toggle_breakpoint()
        end,
        desc = 'Debug: Toggle Breakpoint',
      },
      {
        '<leader>B',
        function()
          require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
        end,
        desc = 'Debug: Set Breakpoint',
      },
    },
    config = function()
      require('dap').listeners.before.attach.dapui_config = function()
        require('dapui').open()
      end
      require('dap').listeners.before.launch.dapui_config = function()
        require('dapui').open()
      end
      require('dap').listeners.before.event_terminated.dapui_config = function()
        require('dapui').close()
      end
      require('dap').listeners.before.event_exited.dapui_config = function()
        require('dapui').close()
      end
    end,
  },
  -- Creates a beautiful debugger UI
  -- For more information, see |:help nvim-dap-ui|
  {
    'rcarriga/nvim-dap-ui',
    opts = {},
    dependencies = {
      -- Required dependency for nvim-dap-ui
      'nvim-neotest/nvim-nio',
    },
    keys = {
      -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
      {
        '<F7>',
        function()
          require('dapui').toggle()
        end,
        desc = 'Debug: See last session result.',
      },
    },
  },
}
