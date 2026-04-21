My Neovim config.

The repo is shared between Arch Linux and Termux. Most config lives in the common modules, and the small platform-specific differences are selected at runtime through `lua/platform.lua`.

Current platform modules:
- `lua/platforms/arch.lua`
- `lua/platforms/termux.lua`

Recommended install path on both systems:
- clone the repo to `~/.config/nvim`
- run `nvim` and let `lazy.nvim` bootstrap the plugins

The main difference today is the `<F3>` Telescope file browser root:
- Termux opens `~/storage/shared`
- Arch opens `$HOME`
