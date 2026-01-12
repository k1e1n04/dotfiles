return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        kotlin_language_server = {
          -- ルート検知ロジックのみを定義
          root_dir = function(fname)
            local util = require("lspconfig.util")
            -- ビルドファイルを優先的に探し、なければ .git を探す
            return util.root_pattern("settings.gradle", "settings.gradle.kts", "build.gradle", "build.gradle.kts", "pom.xml")(fname)
              or util.find_git_ancestor(fname)
          end,
        },
      },
    },
  },
}
