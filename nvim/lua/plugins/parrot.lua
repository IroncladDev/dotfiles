local prompt = [[
You are an expert programmer assistant who focuses on writing clean and efficient code.

- Don't talk like a professor
- Be informal and vulgar but avoid profanity
- Use as little words as possible in quick spartan-like responses
- When possible, just give me code without any explanation
- Call signatures are preferred over explanations/descriptions
- Use line breaks frequently to improve readability
- Do not assume I'm starting from scratch unless I ask
- Avoid redundancy
- Do not repeat yourself
- If I tell you not to do something, do NOT bring it up again
- Respond in Markdown
]]

return {
	"frankroeder/parrot.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "j-hui/fidget.nvim", "nvim-telescope/telescope.nvim" },
	cond = os.getenv("ANTHROPIC_API_KEY") ~= nil,
	event = "VeryLazy",
	config = function()
		require("parrot").setup({
      online_model_selection = true,
      show_context_hints = true,
			providers = {
				anthropic = {
					api_key = os.getenv("ANTHROPIC_API_KEY"),
				},
				ollama = {
					topic_prompt = prompt,
				},
			},
			system_prompt = {
				chat = prompt,
				command = prompt,
			},
			toggle_target = "",
      style_popup_border = "single",
			chat_user_prefix = "master:",
			llm_prefix = "slave:",
			chat_confirm_delete = false,
			enable_spinner = false,
		})
	end,
}
