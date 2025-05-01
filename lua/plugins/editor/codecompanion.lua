# https://github.com/olimorris/codecompanion.nvim/blob/main/lua/codecompanion/config.lua
return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    local fmt = string.format
    local constants = {
      LLM_ROLE = "llm",
      USER_ROLE = "user",
      SYSTEM_ROLE = "system",
    }

    require("codecompanion").setup({
      strategies = {
        chat = {
          adapter = "copilot",
          model = "claude-3.7-sonnet",
        },
      },
      opts = {
        log_level = "INFO",
      },
      prompt_library = {
        ["VIDE - update docstring"] = {
          strategy = "chat",
          description = "Update docstring",
          opts = {
            index = 1,
            modes = { "n", "v" },
            short_name = "docstring",
            auto_submit = true,
            user_prompt = false,
            placement = "new",
            stop_context_insertion = true,
          },
          prompts = {
            {
              role = constants.SYSTEM_ROLE,
              content = [[When generating the docstrings, follow these steps:

1. Detect the programming language to determine the appropriate docstring syntax (Python, JavaScript, Lua, etc.).
2. Check the parameters of classes, functions, and methods.
3. If a docstring already exists, retain the descriptions of existing parameters.
4. Update the docstring if parameters have been added or removed.]]
            },
            {
              role = constants.USER_ROLE,
              content = "#buffer @editor Yes, I'd like you to update all docstring"
            }
          },
        },
        ["VIDE python - mypy compliance"] = {
          strategy = "chat",
          description = "Convert function to mypy compliance",
          opts = {
            index = 2,
            modes = { "n", "v" },
            short_name = "mypy",
            auto_submit = true,
            user_prompt = false,
            placement = "new",
            stop_context_insertion = true,
          },
          prompts = {
            {
              role = constants.SYSTEM_ROLE,
              content = "Do you want use python with types?",
            },
            {
              role = constants.USER_ROLE,
              content = "#buffer @editor I would like you to convert all mypy compatible functions, methods and classes"
            }
          },
        },
        ["VIDE python - Check this code"] = {
          strategy = "chat",
          description = "Test if the selected code is correct",
          opts = {
            index = 3,
            is_default = true,
            is_slash_cmd = false,
            modes = { "n", "v" },
            short_name = "check",
            auto_submit = true,
            user_prompt = false,
            stop_context_insertion = true,
          },
          prompts = {
            {
              role = constants.SYSTEM_ROLE,
              content = [[When asked to check this code, follow these steps:



1. **Check Naming Conventions**: Ensure that variable and function names follow Python's PEP 8 naming conventions.
2. **Type Annotations**: Ensure that type annotations are correctly used.
3. **Docstrings**: Ensure that docstrings are present and correctly formatted.
4. **Implement the Fix**: Write the corrected code in a single code block if necessary.
5. **Explain the Fix**: Briefly explain what changes were made and why.


Ensure the code respect this rules:

- Only suggest adding necessary imports if and only if the script contains either of the following:
  - Python seebang line.
  - Use of the `import` statement.
- Handles potential errors.
- Follows best practices for readability and maintainability.
- Is formatted correctly.

Use Markdown formatting and include the programming language name at the start of the code block.]],
              opts = {
                visible = false,
              },
            },
            {
              role = constants.USER_ROLE,
              content = function(context)
                local code = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)

                return fmt(
                  [[Please check this code from buffer %d:

```%s
%s
```
]],
                  context.bufnr,
                  context.filetype,
                  code
                )
              end,
              opts = {
                contains_code = true,
              },
            },
          },
        },
        ["VIDE python - generate pyproject.toml"] = {
          strategy = "chat",
          description = "Test if the selected code is correct",
          opts = {
            index = 4,
            is_default = true,
            is_slash_cmd = false,
            modes = { "n", "v" },
            short_name = "pyproject",
            auto_submit = true,
            user_prompt = false,
            stop_context_insertion = true,
          },
          prompts = {
            {
              role = constants.SYSTEM_ROLE,
              content = [[@full_stack_dev Can you generate a `pyproject.toml` file based on the current #buffer ?
  Ensure the project is installable in both normal and development modes.
  Detect dependencies automatically and format the file according to `setuptools`.]],
              opts = {
                visible = false,
              },
            },
            {
              role = constants.USER_ROLE,
              content = function(context)
                local code = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)

                return fmt(
                  [[Please read this code (for generating the `pyproject.toml`) %d:

```%s
%s
```


]],
                  context.bufnr,
                  context.filetype,
                  code
                )
              end,
              opts = {
                contains_code = true,
              },
            },
          },
        },
      }
    })
  end,
  keys = {
    {
      "<leader>aa",
      "<cmd>CodeCompanionChat Toggle<cr>",
      desc = "Toggle Chat",
      mode = { "n", "v" },
    },
    {
      "<leader>ao",
      "<cmd>CodeCompanionActions<cr>",
      desc = "Options",
      mode = { "n", "v" },
    },
    {
      "<leader>ai",
      "<cmd>CodeCompanion<cr>",
      desc = "Inline",
      mode = { "n", "v" },
    },

  },
  cmd = {
    "CodeCompanion",
    "CodeCompanionChat",
    "CodeCompanionActions",
  },
}
