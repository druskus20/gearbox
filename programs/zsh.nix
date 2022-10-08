{pkgs, ...}:
{
	home-manager.users.drusk = {
        home.sessionVariables = {
            # ...
        };

	    programs.zsh = {
	      	enable = true;
            enableAutosuggestions = false;
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
                la = "ls -a";
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
                    name = "zsh-fast-syntax-highlighting";
                    src = "${pkgs.zsh-fast-syntax-highlighting}/share/zsh/site-functions";
                    file = "fast-syntax-highlighting.plugin.zsh";
                }
                {
                    name = "zsh-history-substring-search";
                    src = "${pkgs.zsh-history-substring-search}/share/zsh-history-substring-search";
                    file = "zsh-history-substring-search.plugin.zsh";
                }
                {
                    name = "zsh-you-should-use";
                    src = "${pkgs.zsh-you-should-use}/share/zsh/plugins/you-should-use";
                    file = "you-should-use.plugin.zsh";
                }
                {
                    name = "zsh-autocomplete";
                    src  = "${pkgs.zsh-autocomplete}/share/zsh-autocomplete";
                    file = "zsh-autocomplete.plugin.zsh";
                }
            ];
        };
	};
}

