return {
    'fedepujol/move.nvim',
    config = function()
        require('move').setup({
            line = {
                enable = true, 
                indent = true  
            },
            block = {
                enable = true, 
                indent = true  
            },
            word = {
                enable = true, 
            },
            char = {
                enable = false, 
            }
        })
    end
} 
