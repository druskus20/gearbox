{
  pkgs,
  lib,
  ...
}: {
  programs.sway.enable = true;

  home-manager.users.drusk = {
    wayland.windowManager.sway = {
      enable = true;
      wrapperFeatures.gtk = true;
      xwayland = false;

      config = let
        browser = "google-chrome-stable";
        mod = "Mod4";
        terminal = "alacritty";
        theme = import ../theme.nix;

        makeWorkspaceBinds = num: let
          ws = toString num;
        in {
          "${mod}+${ws}" = "workspace ${ws}";
          "${mod}+Shift+${ws}" = "move container to workspace ${ws}";
        };

        joinAttrSets = builtins.foldl' (x: y: x // y) {};

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
      in {
        modifier = mod;
        window.border = 1;
	window.commands = [
		#{ command = "opacity 1.0"; criteria = { app_id = ".*"; }; }
	];
        focus.followMouse = true;
        fonts = {
          names = [theme.font.family];
          style = "Regular";
          size = theme.font.size * 1.0;
        };

        gaps = {
          inner = 5;
          outer = 0;
        };

        input."type:keyboard" = {
		xkb_layout = "es";
		repeat_delay = "250";
		repeat_rate = "35";
		xkb_options = "caps:escape compose:prsc";
	};

	input."type:touchpad" = { 
		tap = "true";
		natural_scroll = "true";
	};

        output."*" = {bg = "${theme.primary.background} solid_color";};

        colors = with theme; rec {
          focused = rec {
            inherit (wm.focused) border text;
            inherit (primary) background;
            indicator = border;
            childBorder = border;
          };

          unfocused = rec {
            inherit (wm.unfocused) border text;
            inherit (primary) background;
            indicator = border;
            childBorder = border;
          };

          focusedInactive = unfocused;
        };

        keybindings =
          {
            "${mod}+Shift+q" = "kill";
            "${mod}+Control+r" = "reload";
            #"${mod}+Shift+e" = "exit";

            "${mod}+Return" = "exec ${terminal}";
            "${mod}+i" = "exec ${browser}";
            "${mod}+Shift+y" = "exec ${pkgs.swaylock}/bin/swaylock -ec '${theme.primary.background}'";
            "${mod}+z" = "exec ${pkgs.brightnessctl}/bin/brightnessctl s 1%-";
            "${mod}+x" = "exec ${pkgs.brightnessctl}/bin/brightnessctl s 1%+";
            "${mod}+Shift+z" = "exec ${pkgs.brightnessctl}/bin/brightnessctl s 5%-";
            "${mod}+Shift+x" = "exec ${pkgs.brightnessctl}/bin/brightnessctl s 5%+";

            "${mod}+p" = "exec ${pkgs.sway-contrib.grimshot}/bin/grimshot copy window";
            "${mod}+Shift+p" = "exec ${pkgs.sway-contrib.grimshot}/bin/grimshot copy active";

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
          }
          // (joinAttrSets (map makeWorkspaceBinds (lib.range 1 9)));

        seat."*" = {
		hide_cursor = "when-typing enable";
		xcursor_theme = "phinger-cursors-light 32";
	};

        bars = [
          {
            position = "top";
            fonts = {
              names = [theme.font.family];
              style = "Regular";
              size = theme.font.size * 1.0;
            };
            statusCommand = "${statusCommand}";

            colors = with theme; {
              statusline = primary.foreground;
              inherit (primary) background;

              focusedWorkspace = {
                inherit (primary) background;
                inherit (wm.focused) text;
                inherit (wm.focused) border;
              };

              inactiveWorkspace = {
                inherit (primary) background;
                inherit (wm.unfocused) text;
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
