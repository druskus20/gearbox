{ pkgs, ... }:
{
  home-manager.users.drusk = {
    gtk = {
      enable = true;
      # TODO: fix phinger
      #cursorTheme.package = pkgs.phinger-cursors;
    };
  };
}
