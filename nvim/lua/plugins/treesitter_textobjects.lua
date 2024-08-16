return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	lazy = true,

	opts = {
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
					["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
					["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
					["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },

					["ar"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
					["ir"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },

					["ac"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
					["ic"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },

					["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
					["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },

					["am"] = { query = "@call.outer", desc = "Select outer part of a function call" },
					["im"] = { query = "@call.inner", desc = "Select inner part of a function call" },

					["af"] = { query = "@function.outer", desc = "Select outer part of a function definition" },
					["if"] = { query = "@function.inner", desc = "Select inner part of a function definition" },
				},
			},
		},
	},

	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
