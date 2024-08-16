return {
	"Exafunction/codeium.vim",

	config = function()
		vim.api.nvim_set_hl(0, "CodeiumSuggestion", { link = "Comment" })
	end,
}
