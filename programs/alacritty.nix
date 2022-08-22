{ ... }:
{
  home-manager.users.drusk = {
    programs.alacritty = {
      enable = true;

      settings = {
        window.padding = {
          x = 8;
          y = 8;
        };

        font = {
          family = "GoMono";
          size = 6;
        };

        colors = with import ../colors.nix; {
          primary = {
            background = primary.background;
            foreground = primary.foreground;
          };

          cursor = {
            cursor = cursor.background;
            text = cursor.foreground;
          };

          normal = {
            black = normal.black;
            red = normal.red;
            green = normal.green;
            yellow = normal.yellow;
            blue = normal.blue;
            magenta = normal.magenta;
            cyan = normal.cyan;
            white = normal.white;
          };

          bright = {
            black = bright.black;
            red = bright.red;
            green = bright.green;
            yellow = bright.yellow;
            blue = bright.blue;
            magenta = bright.magenta;
            cyan = bright.cyan;
            white = bright.white;
          };
        };
      };
    };
  };
}
