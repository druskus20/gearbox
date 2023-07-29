{
  nixpkgs,
  nixpkgs-unstable,
  ...
}: {
  time.timeZone = "Europe/Stockholm";
  i18n.defaultLocale = "en_US.UTF-8";

  boot.loader = {
  	grub.enable = true;
  	grub.efiSupport = true;
  	grub.efiInstallAsRemovable = true;
  	efi.efiSysMountPoint = "/boot";
  	grub.device = "nodev";
  };

  fileSystems = {
    "/".options = ["compress=zstd"];
    "/nix".options = ["compress=zstd" "noatime"];
    "/var".options = ["compress=zstd" "noatime"];
    "/home".options = ["compress=zstd"];
    "/root".options = ["compress=zstd"];
  };

  networking = {
    hostName = "t270";
    networkmanager.enable = true;
    nameservers = ["1.1.1.1"];
  };

  nix = {
    registry = {
      nixpkgs.flake = nixpkgs;
      nixpkgs-unstable.flake = nixpkgs-unstable;
    };
    settings = {
      auto-optimise-store = true;
      trusted-users = ["root" "drusk"];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };

    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
}
