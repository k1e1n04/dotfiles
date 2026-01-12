return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          -- 1. ルート検知
          root_dir = function(fname)
            local util = require("lspconfig.util")
            return util.root_pattern("tsconfig.json")(fname)
              or util.root_pattern("package.json", "pnpm-workspace.yaml", ".git")(fname)
          end,
          -- 2. 設定
          settings = {
            typescript = {
              tsserver = {
                -- 大規模モノレポでカクつくなら、メモリ上限を上げる（単位: MB）
                maxTsServerMemory = 4096,
              },
              preferences = {
                -- インポート時に自動で適切なパスを選択させる
                importModuleSpecifierPreference = "non-relative",
              },
            },
          },
        },
      },
    },
  },
}
