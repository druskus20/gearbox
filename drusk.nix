{ pkgs, home-manager, ... }:
{
  imports = [
    home-manager.nixosModule
    ./programs
    ./system.nix
  ];

  users.users.drusk = {
    isNormalUser = true;
    initialPassword = "foo";
    uid = 1000;
    extraGroups = [
      "networkmanager"
      "sway"
      "wheel"
    ];
  };

  environment.systemPackages = with pkgs; [
    git
    neovim
  ];

  fonts.fonts = with pkgs; [
    dejavu_fonts
    go-font
    noto-fonts
  ];

  home-manager.users.drusk = {
    home.packages = with pkgs; [
      gdb
      github-cli
      htop
      #linuxPackages.perf # TODO: check if this works
      ripgrep
      tree
      wget
    ];

    home.sessionVariables = {
       BROWSER = "chromium";
    };

    programs.direnv = {
      enable = true;
      enableZshIntegration = true;
    };
  };

  # TODO: borgbackup
  hardware.bluetooth.enable = true;
  virtualisation.libvirtd.enable = true;
  systemd.coredump.enable = true;
  security.rtkit.enable = true; # used by pipewire

  powerManagement = {
    enable = true;
    powertop.enable = true;
  };

  services = {
    tlp.enable = true;
    upower.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };
  };
}
