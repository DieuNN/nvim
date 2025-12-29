# NvChad Neovim Configuration

This directory contains a custom Neovim configuration based on [NvChad](https://nvchad.com/) (v2.5). It is designed to be modular and easy to extend, leveraging `lazy.nvim` for plugin management.

## Project Structure

*   **`init.lua`**: The entry point. Bootstraps `lazy.nvim`, loads NvChad, and imports user configs.
*   **`lua/chadrc.lua`**: Overrides NvChad default configuration (UI, theme, etc.).
*   **`lua/options.lua`**: Vim options (not deep-dived but standard location).
*   **`lua/mappings.lua`**: Custom keybindings.
*   **`lua/plugins/init.lua`**: Definition of user-installed plugins.
*   **`lua/configs/`**: specific configurations for plugins (e.g., `lspconfig.lua`, `conform.lua`).

## Key Features & Plugins

### Language Support (LSP)
The configuration heavily emphasizes **Vue**, **TypeScript**, and **C/C++** development with **Inlay Hints** enabled.

*   **TypeScript (`ts_ls`)**: Configured with `@vue/typescript-plugin` for Vue support. Inlay hints enabled for parameters, variables, and properties.
*   **Vue (`vue_ls`)**: Configured with inlay hints for destructured props, missing props, etc.
*   **C/C++ (`clangd`)**: Configured with `clang-tidy`, background indexing, and inlay hints.
*   **Flutter**: Supported via `flutter-tools.nvim`.
*   **HTML/CSS**: Standard support enabled.

### Git Integration
*   **Neogit**: Magit-like Git interface (`<leader>gg`).
*   **GitLab**: Extensive integration via `gitlab.nvim` for MR reviews, comments, and pipeline management (mappings under `<leader>gl`).
*   **Blame**: `blame.nvim` for git blame lines.

### Other Tools
*   **Formatting**: Handled by `conform.nvim`.
*   **Markdown**: `render-markdown.nvim` for previewing.
*   **Comments**: `Comment.nvim` for easy commenting.
*   **Auto-tag**: `nvim-ts-autotag` for HTML/XML.

## Keybindings

### General
*   **Command Mode**: `;` maps to `:` for faster access.
*   **Escape**: `jk` in insert mode maps to `<ESC>`.
*   **Navigation**: Arrow keys are **disabled** in Normal and Insert modes to enforce HJKL usage.

### GitLab (`<leader>gl...`)
*   `r`: Review
*   `s`: Summary
*   `A`: Approve MR
*   `R`: Revoke approval
*   `c`: Create comment
*   `p`: Pipeline
*   `o`: Open in browser

## Customization

*   **Theme**: Currently set to `"aquarium"` in `lua/chadrc.lua`.
*   **Adding Plugins**: Add new plugins to `lua/plugins/init.lua`.
*   **LSP Settings**: Modify `lua/configs/lspconfig.lua` to add servers or change settings.

## Installation/Usage

1.  Requires Neovim >= 0.9.0 (implied by NvChad v2.5).
2.  Ensure `npm` is installed for LSP servers (Vue, TS).
3.  Ensure `clangd` is installed for C++ support.
4.  Run `nvim` and `lazy.nvim` will automatically install plugins.
