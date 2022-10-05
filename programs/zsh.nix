{pkgs, ...}:
{
	home-manager.users.drusk = {
        home.sessionVariables = {
            # ...
        };

        home.packages = with pkgs; [
            zsh-you-should-use
            zsh-fast-syntax-highlighting
            zsh-autocomplete
            zsh-history-substring-search
            gitstatus
        ];

	    programs.zsh = {
	      	enable = true;
            enableAutosuggestions = true;
	      	enableCompletion = true;
            defaultKeymap = "viins";
            dotDir = ".config/zsh";
            history = {
                expireDuplicatesFirst = true;
                ignoreDups = true;
                save = 50000;
                size = 50000;
            };
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
            plugins = [
                {
                    name = "fast-syntax-highlighting";
                    src = pkgs.fetchFromGitHub {
                        owner = "zdharma-continuum";
                        repo = "fast-syntax-highlighting";
                        rev = "v1.55";
                        sha256 = "0h7f27gz586xxw7cc0wyiv3bx0x3qih2wwh05ad85bh2h834ar8d";
                    };
                }
                {
                    name = "zsh-history-substring-search";
                    src = pkgs.fetchFromGitHub {
                        owner = "zsh-users";
                        repo = "zsh-history-substring-search";
                        rev = "v1.0.2";
                        sha256 = "0y8va5kc2ram38hbk2cibkk64ffrabfv1sh4xm7pjspsba9n5p1y";
                    };
                }
                { # TODO not working?
                    name = "zsh-you-should-use";
                    src = pkgs.fetchFromGitHub {
                        owner = "MichaelAquilina";
                        repo = "zsh-you-should-use";
                        rev = "v1.7.3";
                        sha256 = "1dz48rd66priqhxx7byndqhbmlwxi1nfw8ik25k0z5k7k754brgy";
                    };
                }
            ];
        };
	};
}

