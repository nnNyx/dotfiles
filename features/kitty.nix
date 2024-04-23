{ pkgs, config, ...}: 
{
  programs.kitty.enable = true;
  programs.kitty.theme = "Tokyo Night";
  programs.kitty.settings = {
    font_family = "Fira Mono";
    font_size = 12;
  };
}
