return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            hidden = true,
            ignore = true,
          },
          files = {
            hidden = true, -- あいまい検索でドットファイルを表示する
            ignore = true, -- オプション: gitignored ファイルを表示する
          },
        }, 
      },
    },
  },
}
