{ ... }:
{
  home-manager.users.drusk = {
    programs.chromium = {
      enable = true;
      extensions = []; # TODO: chromium extensions
    };
  };
}
