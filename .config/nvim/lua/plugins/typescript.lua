return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          -- 1. ルート検知（モノレポ対応: 最も近いpackage.jsonをルートにする）
          root_dir = function(fname)
            local util = require("lspconfig.util")
            -- 各ファイルから最も近いpackage.jsonを探す（モノレポの各パッケージをルートとして認識）
            return util.root_pattern("package.json")(fname)
              or util.root_pattern("tsconfig.json", "pnpm-workspace.yaml", ".git")(fname)
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
