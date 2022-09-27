{pkgs, ...}: let
  inputrc = pkgs.writeText "inputrc" ''
    set completion-ignore-case on
  '';
in {
  home-manager.users.drusk = {
    home.sessionVariables = {
      INPUTRC = inputrc;
    };

    programs.bash = {
      enable = true;
      historyControl = ["erasedups" "ignorespace"];

      shellAliases = {
        "cd.." = "cd ..";
        htop = "htop -t";
        mkdir = "mkdir -p";
        rg = "rg -S";
	vim = "nvim";
      };

      initExtra = ''
        __prompt() {
            case $? in
                0) PS1='; ' ;;
                *) PS1='\[\e[31m\]; \[\e[0m\]' ;;
            esac
        }
        PROMPT_COMMAND="__prompt"
      '';
    };
  };
}

