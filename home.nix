{ pkgs, ... }:
let
  secrets = import ./secrets.nix;
in
{
  home.username = "multitasker";
  home.homeDirectory = "/home/multitasker";
  home.stateVersion = "24.05";

  home.packages = with pkgs; [
    ripgrep
    fd
    starship
  ];

  programs.git = {
    enable = true;
    userName = "MultiTaskingNoob";
    userEmail = secrets.gitUserEmail;
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  programs.zellij = {
    enable = true;
    enableBashIntegration = true;
  };

  home.file = {
    ".config/i3/config".source = ./dotfiles/i3/config;
    ".config/nvim".source = ./dotfiles/nvim;
    ".config/picom/picom.conf".source = ./dotfiles/picom/picom.conf;
    "/home/multitasker/.bashrc".source = ./dotfiles/bash/.bashrc;
    ".config/starship.toml".source = ./dotfiles/starship/starship.toml;
  };
}
