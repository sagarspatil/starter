return {
    {
      -- Main plugin
      "VonHeikemen/fine-cmdline.nvim",
      dependencies = {
        -- Required dependency
        "MunifTanjim/nui.nvim",
      },
      config = function()
        -- 1) Basic setup, see docs for advanced config
        require('fine-cmdline').setup({
          cmdline = {
            enable_keymaps = true,     -- uses recommended default keymaps
            smart_history = true,      -- command history is filtered by typed text
            prompt = ': ',            -- prompt text
          },
          popup = {
            border = {
              style = 'rounded',
            },
            win_options = {
              winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
            },
          },
        })
  
        -- 2) Map ":" in Normal mode to open the floating command line
        vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', { noremap = true, silent = true })
      end
    }
  }