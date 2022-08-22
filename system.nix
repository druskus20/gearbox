{ nixpkgs, ... }:
{
  imports = [
    #./hardware-configuration.nix
  ];

  # Don't change!
  system.stateVersion = "22.05";
  home-manager.users.drusk.home.stateVersion = "22.05";

  time.timeZone = "UTC";
  i18n.defaultLocale = "en_US.UTF-8";

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking = {
    useDHCP = false;
    interfaces = {
      enp0s25.useDHCP = true;
      wlp3s0.useDHCP = true;
    };
    hostName = "tincan";
    networkmanager.enable = true;
    nameservers = [ "1.1.1.1" ];
  };

  nix = {
    autoOptimiseStore = true;
    trustedUsers = [ "root" "drusk" ];
    registry.nixpkgs.flake = nixpkgs;

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };

    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
}
