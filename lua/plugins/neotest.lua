return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-python",
  },
  config = function()
    local adapters = {
      require("neotest-python")({
        -- Extra arguments for nvim-dap configuration
        -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
        dap = { justMyCode = false },
        -- Command line arguments for runner
        -- Can also be a function to return dynamic values
        args = { "--log-level", "DEBUG" },
        -- Runner to use. Will use pytest if available by default.
        -- Can be a function to return dynamic value.
        runner = "pytest",
        -- Custom python path for the runner.
        -- Can be a string or a list of strings.
        -- Can also be a function to return dynamic value.
        -- If not provided, the path will be inferred by checking for
        -- virtual envs in the local directory and for Pipenev/Poetry configs
        python = "python",
        -- Returns if a given file path is a test file.
        -- NB: This function is called a lot so don't perform any heavy tasks within it.
        -- is_test_file = function(file_path)
        --   return file_path:match('test_[a-zA-Z0-9_].py$') ~= nil;
        -- end,
        -- !!EXPERIMENTAL!! Enable shelling out to `pytest` to discover test
        -- instances for files containing a parametrize mark (default: false)
        pytest_discover_instances = true,
      }),
    }
    local neotest = require("neotest")
    local which_key = require("which-key")

    neotest.setup({ adapters = adapters })

    which_key.register({
      t = {
        "Testing",
        r = {
          function()
            neotest.run.run(vim.fn.expand("%"))
          end,
          "Run all",
        },
        d = {
          function()
            neotest.run.run({ vim.fn.expand("%"), strategy = "dap" })
          end,
          "Debug all",
        },
      },
    }, { prefix = "<leader>" })
  end,
}
