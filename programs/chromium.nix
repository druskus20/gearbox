_: {
  home-manager.users.drusk = {
    home.sessionVariables.NIXOS_OZONE_WL = "1";

    programs.chromium = {
      enable = true;
      extensions = [
        {id = "nngceckbapebfimnlniiiahkandclblb";} # Bitwarden
        {id = "gcbommkclmclpchllfjekcdonpmejbdp";} # HTTPS Everywhere
        {id = "hlepfoohegkhhmjieoechaddaejaokhf";} # Refined GitHub
        {id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";} # uBlock Origin
      ];
    };
  };
}
