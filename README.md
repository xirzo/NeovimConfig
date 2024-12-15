# Clean LazyVim Config

This repository contains my minimal configuration for LazyVim.

## Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/xirzo/clean-lazyvim-config.git
   cd clean-lazyvim-config
   ```

2. Ensure the `init.lua` file is in your Neovim configuration directory:
   ```sh
   mkdir -p ~/.config/nvim
   cp init.lua ~/.config/nvim/
   ```

3. Start Neovim to let LazyVim bootstrap and install the necessary plugins:
   ```sh
   nvim
   ```

## Usage

Once installed, the configuration will automatically bootstrap LazyVim and load the plugins specified in the `config.lazy` file.
