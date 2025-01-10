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
      handlers = {
        asm = function(config)
          config.configurations = {
            {
              name = 'Launch',
              type = 'codelldb',
              request = 'launch',
              program = function()
                return vim.fn.input 'Path to executable: '
              end,
              cwd = '${workspaceFolder}',
              stopOnEntry = true,
            },
          }
          require('mason-nvim-dap').default_setup(config) -- don't forget this!
        end,
      },

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        'codelldb',
        'js-debug-adapter',
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
      require('dap').configurations.asm = {
        {
          name = 'Launch',
          type = 'codelldb',
          request = 'launch',
          program = function()
            return vim.fn.input 'Path to executable: '
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = true,
        },
      }

      -- Dap UI setup
      -- For more information, see |:help nvim-dap-ui|
      -- require('dapui').setup {
      -- Set icons to characters that are more likely to work in every terminal.
      --    Feel free to remove or use ones that you like more! :)
      --    Don't feel like these are good choices.
      -- icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      -- controls = {
      --  icons = {
      --    pause = '⏸',
      --    play = '▶',
      --    step_into = '⏎',
      --    step_over = '⏭',
      --    step_out = '⏮',
      --    step_back = 'b',
      --    run_last = '▶▶',
      --    terminate = '⏹',
      --    disconnect = '⏏',
      --  },
      --},
      --}

      -- Change breakpoint icons
      -- vim.api.nvim_set_hl(0, 'DapBreak', { fg = '#e51400' })
      -- vim.api.nvim_set_hl(0, 'DapStop', { fg = '#ffcc00' })
      -- local breakpoint_icons = vim.g.have_nerd_font
      --     and { Breakpoint = '', BreakpointCondition = '', BreakpointRejected = '', LogPoint = '', Stopped = '' }
      --   or { Breakpoint = '●', BreakpointCondition = '⊜', BreakpointRejected = '⊘', LogPoint = '◆', Stopped = '⭔' }
      -- for type, icon in pairs(breakpoint_icons) do
      --   local tp = 'Dap' .. type
      --   local hl = (type == 'Stopped') and 'DapStop' or 'DapBreak'
      --   vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
      -- end

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
