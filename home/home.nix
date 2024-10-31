{ config, pkgs, inputs, ... }:

{
  imports = [
    ./apps/firefox
  ];

  home.username = "faulty";
  home.homeDirectory = "/home/faulty";

  home.packages = with pkgs; [
    neofetch
  ];


  programs.git = {
    enable = true;
    userName = "faultypointer";
    userEmail = "faultypointer@proton.me";
  };


  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
