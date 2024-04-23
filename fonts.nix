{ config, lib, pkgs, ...}:
{
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = ["FiraCode" "DroidSansMono" ]; })
    proggyfonts
    fira-mono
  ];

}
