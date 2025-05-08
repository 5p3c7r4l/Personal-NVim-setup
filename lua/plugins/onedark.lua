return {
    {
        'navarasu/onedark.nvim',
        config = function() 
            colour = "onedark"
            vim.cmd("let g:onedark_config = {'ending_tildes': v:true, 'transparent': v:true}",'colorscheme onedark')
            vim.cmd.colorscheme(colour)

            vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
            vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
        end,
    }
}
