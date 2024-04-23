{config, pkgs, ...}:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      ll = "ls -la --color=tty";
      ".." = "cd ..";
      rbld = "nh os switch ~/.dotfiles/";
    };
  };

  programs.starship.enable = true;
  programs.starship.settings = {
    add_newline = false;
    aws.disabled = true;
    gcloud.disabled = true;
    line_break.disabled = true;
  };
}
