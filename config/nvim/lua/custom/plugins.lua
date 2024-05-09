local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "nimlsp",
        "eslint-lsp",
        "mypy",
        "htmlhint",
        "html-lsp",
        "biome",
        "jsonlint",
        "jq",
        "lua-language-server",
      },
    },
  },
  {
    'rmagatti/goto-preview',
    config = function()
      require("custom.configs.gotop")
    end,
    event = "VeryLazy"
  },
  {
    "https://github.com/mlaursen/vim-react-snippets.git",
    event = "VeryLazy"
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
    event = "VeryLazy"
  },
  {
    "onsails/lspkind.nvim",
    config = function ()
      return require("custom.configs.lspkind")
    end,
    event = "VeryLazy",
  },
  -- {
  --   'ray-x/web-tools.nvim',
  --   config = function ()
  --     return require("custom.configs.webtools")
  --   end,
  --   lazy = false,
  -- },
  {
    'stevearc/conform.nvim',
    opts = {
    },
    config = function ()
      return require("custom.configs.conform")
    end,
    event = "VeryLazy"
  },
  {
    "mfussenegger/nvim-lint",
    config = function ()
      return require("custom.configs.nvim-lint")
    end,
    event = "VeryLazy"
  },
  {
    'vidocqh/auto-indent.nvim',
    opts = {},
    config = function ()
      require("auto-indent").setup ({
        lightmode = false,
      })
    end,
    event = "VeryLazy"
  },
  {
    "elkowar/yuck.vim",
    event = "VeryLazy",
  },
  {
    "pocco81/auto-save.nvim",
    config = function ()
      return require("custom.configs.autosave")
    end,
    lazy = false,
    vim.api.nvim_set_keymap("n", "<leader>as", ":ASToggle<CR>", {}),
  },
  {
    "andrewferrier/wrapping.nvim",
    event = "VeryLazy",
    config = function()
      require("wrapping").setup()
    end
  },
  -- null ls
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    -- ft = {
    --   "python",
    --   "javascript",
    --   "typescript",
    --   "c",
    --   "c++",
    -- },
    dependencies = {
      'nvim-lua/plenary.nvim',
      "nvimtools/none-ls-extras.nvim",
    },
    opts = function()
      return require "custom.configs.null_ls"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    'mfussenegger/nvim-dap',
    config = function (_, opts)
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      'mfussenegger/nvim-dap',
      "rcarriga/nvim-dap-ui",
    },

    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap"
    },

    config = function ()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function ()
        dapui.open()
      end

      dap.listeners.after.event_terminated["dapui_config"] = function ()
        dapui.close()
      end

      dap.listeners.after.event_exited["dapui_config"] = function ()
        dapui.close()
      end
    end
  },
  {
    'alaviss/nim.nvim',
    ft = { "nim" },
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  },
  --- Uncomment these if you want to manage LSP servers from neovim
  -- {'williamboman/mason.nvim'},
  -- {'williamboman/mason-lspconfig.nvim'},

  {'VonHeikemen/lsp-zero.nvim',

    branch = 'v3.x',
    config = function ()
      require "custom.configs.lsp_zero"
    end
  },
  -- {'neovim/nvim-lspconfig'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/nvim-cmp'},
  {'L3MON4D3/LuaSnip'},
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  },

}

return plugins
