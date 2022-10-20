{ config, pkgs, nixpkgs, lib, home-manager, ... }:
{
  imports =
    [
      home-manager.nixosModule
      ./programs
      ./hardware-configuration.nix
    ];

  # Don't change!
  system.stateVersion = "22.05";

  users.users.drusk = {
    isNormalUser = true;
    initialPassword = "foo";
    uid = 1000;
    shell = pkgs.bash;


    extraGroups = [
	"networkmanager"
	"sway"
	"wheel"
    ];
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "drusk";
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Stockholm";

  console.keyMap = "es";
  console.font = "Lat2-Terminus32";

  environment.shells = with pkgs; [ zsh ];
  environment.systemPackages = with pkgs; [
    phinger-cursors
    git
    neovim
  ];

  # TODO hardcoded name!  also sway is not system wide..
  services.getty.autologinUser = "drusk";
  environment.loginShellInit = ''
    #[[ "$(tty)" == /dev/tty? ]] && sudo /run/current-system/sw/bin/lock this 
    [[ "$(tty)" == /dev/tty1 ]] && sway
  '';

  environment.shellAliases = {
  	vim = "nvim";
  };

  environment.sessionVariables = {
  	NIXOS_OZONE_WL = "1";
	NIXPKGS_ALLOW_UNFREE = "1";
    BROWSER = "google-chrome-stable";
  };

  fonts.fonts = with pkgs; [
    dejavu_fonts
    go-font
    noto-fonts
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  home-manager.users.drusk = {
    home = {
      stateVersion = "22.05";
      packages = with pkgs; [
      	wireshark
      	google-chrome
        du-dust
        fd
        gdb
        github-cli
        htop
        kcachegrind
        linuxPackages.perf
        ripgrep
        strace
        trash-cli
        tree
        wget
        wl-clipboard
        spotify
        fzf
      ];


      pointerCursor = {
	size = 16;
        package = pkgs.phinger-cursors;
        name = "phinger-cursors-light";
        gtk.enable = true;
      };
    };
  };

  nix = {
    autoOptimiseStore = true;
    trustedUsers = ["root" "drusk"];
    registry.nixpkgs.flake = nixpkgs;

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };

    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

#  powerManagement = {
#    enable = true;
#    powertop.enable = true;
#  };
#
#  services = {
#    tlp.enable = true;
#    upower.enable = true;
#  };

}

