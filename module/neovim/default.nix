{ pkgs, ... }:

let

in
  {
    environment.variables.EDITOR = "nvim";
    environment.systemPackages = with pkgs; [
      xclip
      clang-tools_14
      fzf
      neovim
      nil
      sumneko-lua-language-server
      php82Packages.psalm
      python310Packages.python-lsp-server
      python310Packages.pylsp-mypy
    ];

    nixpkgs.overlays = [ (import ../../overlay/neovim) ];
  }

