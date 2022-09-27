{
  light = false;

  font = {
    # TODO: Link this to the package install. Maybe include a family atribute inside the font package. jetbrainsmono.overrideAttrs.family = " "
    family = "JetBrainsMono Nerd Font Mono";
    size = 14;
  };

  cursor = { 
#    # TODO: Link this to the package install. Maybe include a name atribute inside the font package. phinger-cursors.overrideAttrs.family = " "
#    name = "phinger-cursors"
#    light = true
#    size = 32
    background = "#586e75";
    foreground = "#fdf6e3";
  };


    # Default colors
  primary = {	
    background = "#2C2E43";
    foreground = "#bfbfcb";
  };

  normal = {
    black   = "#29283c";
    red     = "#eca8a8";
    green   = "#ccd389";
    yellow  = "#efd5a0";
    blue    = "#a5c6e1";
    magenta = "#e1bee9";
    cyan    = "#c7ebe6";
    white   = "#bbbbcb";
  };
  bright = {
    black   = "#2e2e3f";
    red     = "#ffc4c4";
    green   = "#eff6ab";
    yellow  = "#ffe6b5";
    blue    = "#c9e6fd";
    magenta = "#f7d7ff";
    cyan    = "#ddfcf8";
    white   = "#e1e1ef";
  };

  wm = {
    focused = {
      text = "#586e75";
      border = "#b8ced5";
    };

    unfocused = {
      text = "#788e95";
      border = "#fdf6e3";
    };
  };
}
