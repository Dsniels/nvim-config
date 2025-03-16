
return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true, -- Close NeoTree if it's the last window
      window={
        width = 30,
      },
      
    })
		vim.keymap.set("n", "<leader>e", ":Neotree filesystem reveal left<CR>", {noremap=false, silent=true})
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", { noremap = true, silent = true })
	end,
}
