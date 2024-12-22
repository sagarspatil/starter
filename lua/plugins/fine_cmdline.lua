return {
  -- Dependency needed by fine-cmdline
  {
    "MunifTanjim/nui.nvim",
    lazy = true,  -- Set to true to lazy-load
  },

  -- fine-cmdline plugin
  {
    "VonHeikemen/fine-cmdline.nvim",
    cmd = "FineCmdline",  -- Lazy-load when :FineCmdline is invoked
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
      require("fine-cmdline").setup({
        cmdline = {
          enable_keymaps = true,
          smart_history = true,
          prompt = ": ",
        },
        popup = {
          position = {
            row = "10%",
            col = "50%",
          },
          size = {
            width = "60%",
          },
          border = {
            style = "rounded",
          },
          -- You can customize further as needed
        },
        hooks = {
          before_mount = function(input)
            -- Optional: Actions before mounting the cmdline
          end,
          after_mount = function(input)
            -- Optional: Actions after mounting the cmdline
            -- Example: Map <Esc> to close the cmdline
            vim.keymap.set('i', '<Esc>', '<cmd>FineCmdlineClose<CR>', { buffer = input.bufnr, desc = "Close FineCmdline" })
          end,
          set_keymaps = function(imap, feedkeys)
            -- Optional: Define custom keybindings
            -- Example: Map <M-s> to insert a search-replace snippet
            -- imap("<M-s>", '%s///gc<Left><Left><Left><Left>')
          end,
        },
      })
    end,
  },
}
