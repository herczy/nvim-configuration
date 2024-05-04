local which_key = require("which-key")

which_key.register({
  j = { [[ <cmd>cn<cr> ]], "Next error" },
  k = { [[ <cmd>cp<cr> ]], "Previous error" },
}, { prefix = "g" })
