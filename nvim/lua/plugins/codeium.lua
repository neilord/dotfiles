return {
	"Exafunction/codeium.vim",
	-- enabled = false,

	config = function()
		vim.keymap.set("i", "<Right>", function()
			return vim.fn["codeium#Accept"]()
		end, { expr = true, silent = true })

		vim.api.nvim_set_hl(0, "CodeiumSuggestion", { link = "Comment" })
	end,
}
