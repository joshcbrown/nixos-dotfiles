{
  programs.git = {
    enable = true;
    userName = "joshcbrown";
    userEmail = "joshcarlbrown@gmail.com";
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
