{ config, pkgs, inputs, ... }:

{
  # get the color sexy yes
  imports = [
    inputs.nix-colors.homeManagerModules.default

    # TODO make a default.nix in ./features and have all the imports done
    ./features/kitty.nix
    ./features/zsh.nix
  ]; 
  
  colorScheme = inputs.nix-colors.colorSchemes.tokyo-city-dark;

  nixpkgs.config.allowUnfree = true;
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "lotus";
  home.homeDirectory = "/home/lotus";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
     zip
     ripgrep
     nh
     btop
     tldr
     wget
     unzip
     nix-output-monitor
     android-tools
     vscode
     neofetch
     curl
     git
     parsec-bin
     webcord-vencord
     starship
     librewolf
     spotify
  ];
  
  programs.git = {
    enable = true;
    userName = "nnNyx";
    userEmail = "monkeynik04@gmail.com";
    extraConfig = {
      init.defafultBranch = "main";
    };
  };
  
  programs.neovim = {
    enable = true;
    vimAlias = true;
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    # EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
