return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config

    opts = {},
    config = function ()
        require("ibl").setup {
            -- for example, context is off by default, use this to turn it on
            scope = {enabled = false}
        }
    end
}
