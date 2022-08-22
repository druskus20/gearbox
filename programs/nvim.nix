{ ... }:
{
  home-manager.users.drusk = {
    home.sessionVariables = {
       EDITOR = "nvim";
    };

    programs.vim = {
      enable = true;
      # TODO: vim config
    };
  };
}
