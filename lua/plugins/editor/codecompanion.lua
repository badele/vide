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
          model = "claude-4-sonnet",
        },
      },
      opts = {
        log_level = "WARN",
      },
      prompt_library = {
        ["VIDE - create github issue"] = {
          strategy = "chat",
          description = "Create a github issue",
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
              content = [[I will provide you with a text describing a technical problem or incident.

Based on this text, generate a well-structured issue in English, containing the following sections:

* **Description:** Summarize the problem clearly and concisely (2-3 sentences).

* **Observed behavior:** List what works and what fails using ✅ and ❌ to indicate the observed behaviors.

* **Potential causes we are considering:** List 2 or 3 potential technical hypotheses explaining the problem.

* **Action plan:** Propose a structured action plan with 3 parts:

  * Diagnostics & Testing
  * Issue Identification
  * Fix Implementation

* **We are looking for input on:** Indicate any specific advice or feedback we would like from the community or colleagues.

**Requirements:**

* Write everything in English.
* If some details are missing from the original text, make reasonable assumptions to fill in the sections.]]
            },
            {
              role = constants.USER_ROLE,
              content = "#buffer @editor, Create an github issue and edit my current buffer"
            }
          },
        },
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
      "<leader>ac",
      "<cmd>CodeCompanionChat Toggle<cr>",
      desc = "Toggle CodeCompanion Chat",
      mode = { "n", "v" },
    },
    {
      "<leader>ao",
      "<cmd>CodeCompanionActions<cr>",
      desc = "CodeCompanion Options",
      mode = { "n", "v" },
    },
    {
      "<leader>ai",
      "<cmd>CodeCompanion<cr>",
      desc = "CodeCompanion Inline",
      mode = { "n", "v" },
    },

  },
  cmd = {
    "CodeCompanion",
    "CodeCompanionChat",
    "CodeCompanionActions",
  },
}
