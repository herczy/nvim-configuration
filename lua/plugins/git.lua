return {
  "lewis6991/gitsigns.nvim",
  config = function()
    local gs = require("gitsigns")
    local which_key = require("which-key")

    gs.setup({
      signs = {
        add = { text = "+" },
        change = { text = "»" },
        delete = { text = "-" },
        topdelete = { text = "‾" },
        changedelete = { text = "±" },
        untracked = { text = "?" },
      },
      numhl = true,
      linehl = true,
    })

    which_key.register({
      g = {
        "Git commands",
        ["0"] = { gs.detach, "Disable for buffer" },
        ["1"] = { gs.attach, "Enable for buffer" },
        D = { gs.diffthis, "Diff" },
        B = { gs.blame_line, "Blame line" },
        n = { gs.next_hunk, "Next hunk" },
        s = { gs.stage_hunk, "Stage hunk" },
        u = { gs.undo_stage_hunk, "Undo last staged" },
        d = { gs.toggle_deleted, "Show deleted lines" },
        w = { gs.toggle_word_diff, "Show word diff" },
      },
    }, { prefix = "<leader>" })

    which_key.register({
      h = {
        "Hunk",
        j = { gs.next_hunk, "Next" },
        k = { gs.prev_hunk, "Prev" },
      },
    }, { prefix = "g" })
  end,
}
