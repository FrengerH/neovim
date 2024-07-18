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
      php83Packages.psalm
      nodePackages.intelephense
    ];

    nixpkgs.overlays = [ (import ../../overlay/neovim) ];
  }

