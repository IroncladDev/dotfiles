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
          name = "anthropic",
          endpoint = "https://api.anthropic.com/v1/messages",
          model_endpoint = "https://api.anthropic.com/v1/models",
          api_key = os.getenv("ANTHROPIC_API_KEY"),
          params = {
            chat = { max_tokens = 4096 },
            command = { max_tokens = 4096 },
          },
          topic = {
            model = "claude-3-7-sonnet-latest",
            params = { max_tokens = 32 },
          },
          headers = function(self)
            return {
              ["Content-Type"] = "application/json",
              ["x-api-key"] = self.api_key,
              ["anthropic-version"] = "2023-06-01",
            }
          end,
          models = {
            "claude-sonnet-4-20250514",
            "claude-3-7-sonnet-20250219",
            "claude-3-5-sonnet-20241022",
            "claude-3-5-haiku-20241022",
          },
          preprocess_payload = function(payload)
            for _, message in ipairs(payload.messages) do
              message.content = message.content:gsub("^%s*(.-)%s*$", "%1")
            end
            if payload.messages[1] and payload.messages[1].role == "system" then
              -- remove the first message that serves as the system prompt as anthropic
              -- expects the system prompt to be part of the API call body and not the messages
              payload.system = payload.messages[1].content
              table.remove(payload.messages, 1)
            end
            return payload
          end,
        },
      },
      system_prompt = {
        chat = prompt,
        command = prompt,
      },
      toggle_target = "",
      style_popup_border = "single",
      model_cache_expiry_hours = 48,
      chat_user_prefix = "master:",
      llm_prefix = "slave:",
      chat_confirm_delete = false,
      enable_spinner = false,
    })
  end,
}
