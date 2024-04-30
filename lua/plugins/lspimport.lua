return {
  "stevanmilic/nvim-lspimport",
  config = function()
    local which_key = require("which-key")
    local lspimport = require("lspimport")

    which_key.register({
      a = {
        lspimport.import,
        "Import missing",
      },
    }, { prefix = "<leader>" })
  end,
}
