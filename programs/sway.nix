{ pkgs, lib, ... }:
{
  programs.sway.enable = true; # TODO: is this required?

  home-manager.users.drusk = {
    wayland.windowManager.sway = {
      enable = true;
      wrapperFeatures.gtk = true;
      xwayland = false;

      config = let
        browser = "firefox";
        mod = "Mod4";
        terminal = "alacritty";
        colors = import ../colors.nix;

        makeWorkspaceBinds = (
          num:
          let
            ws = toString num;
          in
          {
            "${mod}+${ws}" = "workspace ${ws}";
            "${mod}+Shift+${ws}" = "move container to workspace ${ws}";
            }
            );

            joinAttrSets = (sets: builtins.foldl' (x: y: x // y) {} sets);

          # TODO: rewrite in more readable lang
          statusCommand = pkgs.writeScript "status_command" ''
            #!/bin/sh

            while :; do
                energy_full=
                energy_now=
                charge=

                for bat in /sys/class/power_supply/*/capacity; do
                    bat="''${bat%/*}"
                    read -r full < $bat/energy_full
                    read -r now < $bat/energy_now
                    energy_full=$((energy_full + full))
                    energy_now=$((energy_now + now))
                done

                if cat /sys/class/power_supply/*/status | grep -q Charging; then
                    charge=+
                fi

                printf '%s %s ' "$charge$((energy_now * 100 / energy_full))%" "$(date +'%H:%M')"

                sleep 3
            done
          '';
        in
        {
          modifier = mod;
          window.border = 1;
          focus.followMouse = true;
          fonts = {
            names = [ "GoMono" ];
            style = "Regular";
            size = 6.0;

          };

          gaps = {
            inner = 5;
            outer = 0;
          };

          input."*" = { xkb_options = "compose:ralt"; };
          output."*" = { bg = "${colors.primary.background} solid_color"; };

          colors = with colors; rec {
            focused = rec {
              border = wm.focused.border;
              background = primary.background;
              text = wm.focused.text;
              indicator = border;
              childBorder = border;
            };

            unfocused = rec {
              border = wm.unfocused.border;
              background = primary.background;
              text = wm.unfocused.text;
              indicator = border;
              childBorder = border;
            };

            focusedInactive = unfocused;
          };

          keybindings = {
            "${mod}+Shift+c" = "kill";
            "${mod}+Control+r" = "reload";
            "${mod}+Shift+e" = "exit";

            "${mod}+Shift+Return" = "exec ${terminal}";
            "${mod}+i" = "exec ${browser}";
            "${mod}+Shift+y" = "exec ${pkgs.swaylock}/bin/swaylock -ec '${colors.primary.background}'";
            "${mod}+z" = "exec ${pkgs.brightnessctl}/bin/brightnessctl s 1%-";
            "${mod}+x" = "exec ${pkgs.brightnessctl}/bin/brightnessctl s 1%+";
            "${mod}+Shift+z" = "exec ${pkgs.brightnessctl}/bin/brightnessctl s 5%-";
            "${mod}+Shift+x" = "exec ${pkgs.brightnessctl}/bin/brightnessctl s 5%+";

             # TODO: saner screenshot keybinds
            "${mod}+p" = "exec ${pkgs.sway-contrib.grimshot}/bin/grimshot copy active";
            "${mod}+Shift+p" = "exec ${pkgs.sway-contrib.grimshot}/bin/grimshot copy area";
            "${mod}+Alt+p" = "exec ${pkgs.sway-contrib.grimshot}/bin/grimshot copy output";
            "${mod}+Ctrl+p" = "exec ${pkgs.sway-contrib.grimshot}/bin/grimshot copy window";

            "${mod}+o" = "splith";
            "${mod}+u" = "splitv";

            "${mod}+s" = "layout stacking";
            "${mod}+t" = "layout tabbed";
            "${mod}+e" = "layout toggle split";
            "${mod}+f" = "fullscreen";

            "${mod}+h" = "focus left";
            "${mod}+j" = "focus down";
            "${mod}+k" = "focus up";
            "${mod}+l" = "focus right";

            "${mod}+Left" = "focus left";
            "${mod}+Down" = "focus down";
            "${mod}+Up" = "focus up";
            "${mod}+Right" = "focus right";

            "${mod}+Shift+h" = "move left";
            "${mod}+Shift+j" = "move down";
            "${mod}+Shift+k" = "move up";
            "${mod}+Shift+l" = "move right";

            "${mod}+Ctrl+h" = "resize grow left 10 px or 10 ppt";
            "${mod}+Ctrl+j" = "resize grow down 10 px or 10 ppt";
            "${mod}+Ctrl+k" = "resize grow up 10 px or 10 ppt";
            "${mod}+Ctrl+l" = "resize grow right 10 px or 10 ppt";

            "${mod}+space" = "focus mode_toggle";
            "${mod}+a" = "focus parent";

            "${mod}+Shift+space" = "floating toggle";
          } // (joinAttrSets (map makeWorkspaceBinds (lib.range 1 9)));

          bars = [
            {
              position = "top";
              fonts = {
                names = [ "GoMono" ];
                style = "Regular";
                size = 6.0;

              };
              statusCommand = "${statusCommand}";

              colors = with colors; {
                statusline = primary.foreground;
                background = primary.background;

                focusedWorkspace = {
                  background = primary.background;
                  text = wm.focused.text;
                  border = wm.unfocused.border;
                };

                inactiveWorkspace = {
                  background = primary.background;
                  text = wm.unfocused.text;
                  border = primary.background;
                };
              };

              extraConfig = ''
                  gaps 5
              '';
            }
          ];
        };
      };
    };
  }
