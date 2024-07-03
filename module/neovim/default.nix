{ pkgs, ... }:

let

in
  {
    environment.variables.EDITOR = "nvim";
    environment.systemPackages = with pkgs; [
      ripgrep
      xclip
      clang-tools_14
      fzf
      neovim
      nil
      sumneko-lua-language-server
      php82Packages.psalm
    ];

    nixpkgs.overlays = [ (import ../../overlay/neovim) ];
  }

