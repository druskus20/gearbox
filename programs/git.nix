_: {
  home-manager.users.drusk = {
    programs.git = {
      enable = true;
      userEmail = "druskus20@gmail.com";
      userName = "druskus20";
      difftastic = {
        enable = true;
        background =
          if (import ../theme.nix).light
          then "light"
          else "dark";
      };

      aliases = {
        a = "add";
        b = "branch";
        c = "commit --verbose";
        m = "commit --amend --verbose";

        d = "diff";
        ds = "diff --stat";
        dc = "diff --cached";

        s = "status -s";
        co = "checkout";
        cob = "checkout -b";
      };

      extraConfig = {
        init = {
          defaultBranch = "master";
        };
      };
    };
  };
}
