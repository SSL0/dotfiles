return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "MunifTanjim/nui.nvim",
          "nvim-tree/nvim-web-devicons", -- optional, but recommended
        },
        lazy = false, -- neo-tree will lazily load itself
        ---@module 'neo-tree'
        ---@type neotree.Config
        config = function()
           local builtin = require("neo-tree").setup({
              close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
              popup_border_style = "NC", -- or "" to use 'winborder' on Neovim v0.11+
              enable_git_status = true,
              enable_diagnostics = true,
              open_files_do_not_replace_types = { "terminal", "trouble", "qf" }, -- when opening files, do not use windows containing these filetypes or buftypes
              open_files_using_relative_paths = false,
              sort_case_insensitive = false, -- used when sorting files and directories in the tree
              sort_function = nil,  
            })
            vim.keymap.set("n", "<leader>e", "<Cmd>Neotree<CR>")
        end
    }
}
