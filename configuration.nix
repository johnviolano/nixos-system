{ config, pkgs, modulesPath, lib, ... }:
{
  imports = 
  [
    # access control
    ./users.nix

    # valheim server
    ./valheim-service.nix

    # sops
    ("${builtins.fetchTarball "https://github.com/Mic92/sops-nix/archive/master.tar.gz"}/modules/sops")

    # digital ocean
    (modulesPath + "/virtualisation/digital-ocean-config.nix")
  ] ++ lib.optional (builtins.pathExists ./do-userdata.nix) ./do-userdata.nix;

  networking.firewall = {
    allowedTCPPorts = [ 
      22      # ssh
      8384    # syncthing
      22000   # syncthing
    ];
    allowedUDPPorts = [
     22000   # syncthing
    ];
  };

  nixpkgs.config.allowUnfree = true;
  # default packages
  environment.systemPackages = with pkgs; [ 
    git
    gnupg
    home-manager
    nodejs-12_x # for vscode remote
    vim 
    wget
    which
    zip
  ];

  time.timeZone = "America/New_York";
  system.stateVersion = "20.09";
}
