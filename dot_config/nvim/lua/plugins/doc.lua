return {
  {
    "danymat/neogen",
    config = true,
    keys = {
      { "cd", mode = { "n", "x", "o" }, function() require("neogen").generate() end, desc = "Neogen" },
    }
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
  }
}
