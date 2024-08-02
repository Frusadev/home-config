return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "debugpy",
        "nimlsp",
        "nimlangserver",
        "eslint-lsp",
        "flake8",
        "htmlhint",
        "html-lsp",
        "biome",
        "jsonlint",
        "jq",
        "lua-language-server",
        -- "v-analyzer",
        "stylua",
      },
    },
  },
  {
    "zbirenbaum/nvterm",
    config = function()
      require "configs.term"
    end,
  },
  {
    "LintaoAmons/cd-project.nvim",
    lazy = false,
    config = function()
      require "configs.proj"
    end,
  },
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap",
      "mfussenegger/nvim-dap-python", --optional
      { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
    },
    lazy = false,
    branch = "regexp", -- This is the regexp branch, use this for the new version
    config = function()
      require("venv-selector").setup()
    end,
    keys = {
      { "<leader>cv", "<cmd>VenvSelect<cr>" },
    },
  },
  {
    "wthollingsworth/pomodoro.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    lazy = false,
    config = function()
      require("pomodoro").setup {
        time_work = 25,
        time_break_short = 5,
        time_break_long = 20,
        timers_to_long_break = 4,
      }
    end,
  },
  {
    "petertriho/nvim-scrollbar",
    config = function()
      require "configs.scroll"
    end,
    lazy = false,
  },
  {
    "rmagatti/goto-preview",
    config = function()
      require "custom.configs.gotop"
    end,
    event = "VeryLazy",
  },
  {
    "folke/noice.nvim",
    config = function()
      return require "configs.noice"
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    event = "VeryLazy",
  },
  {
    "https://github.com/mlaursen/vim-react-snippets.git",
    event = "VeryLazy",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      return require "custom.configs.ts_autag"
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
      dofile(vim.g.base46_cache .. "syntax")
    end,
    event = "VeryLazy",
  },
  {
    "windwp/nvim-ts-autotag",
    event = "VeryLazy",
  },
  {
    "onsails/lspkind.nvim",
    config = function()
      return require "custom.configs.lspkind"
    end,
    event = "VeryLazy",
  },
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup {
        default = true,
        override = {},
        override_by_extension = {
          ["v"] = {
            icon = "",
            color = "#263a75",
            name = "Vlang",
          },

          ["vv"] = {
            icon = "",
            color = "#263a75",
            name = "Vlang",
          },
          require("nvim-web-devicons").set_icon {
            vlang = {
              icon = "",
              color = "#263a75",
              cterm_color = "65",
              name = "Vlang",
            },
          },
        },
      }
    end,
  },
  {
    "mfussenegger/nvim-lint",
    config = function()
      return require "custom.configs.nvim-lint"
    end,
    event = "VeryLazy",
  },
  {
    "vidocqh/auto-indent.nvim",
    opts = {},
    config = function()
      require("auto-indent").setup {
        lightmode = false,
      }
    end,
    event = "VeryLazy",
  },
  {
    "pocco81/auto-save.nvim",
    config = function()
      return require "custom.configs.autosave"
    end,
    lazy = false,
    vim.api.nvim_set_keymap("n", "<leader>as", ":ASToggle<CR>", {}),
  },
  {
    "andrewferrier/wrapping.nvim",
    lazy = false,
    config = function()
      require("wrapping").setup()
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, opts) end,
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },

    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },

    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end

      dap.listeners.after.event_terminated["dapui_config"] = function()
        dapui.close()
      end

      dap.listeners.after.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  { "heysokam/nim.vim", lazy = false },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  --- Uncomment these if you want to manage LSP servers from neovim
  -- {'williamboman/mason.nvim'},
  -- {'williamboman/mason-lspconfig.nvim'},

  {
    "VonHeikemen/lsp-zero.nvim",

    branch = "v3.x",
    config = function()
      require "custom.configs.lsp_zero"
    end,
  },
  -- {'neovim/nvim-lspconfig'},
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/nvim-cmp" },
  { "L3MON4D3/LuaSnip" },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = true,
  },
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
}
