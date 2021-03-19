{ config, pkgs, ... }:
let
  valheim-runner = pkgs.callPackage ./valheim-runner.nix {};
in
{
  # open valheim ports on system
  networking.firewall = {
    allowedUDPPorts = [
      2456
      2457
      2458
    ];
  };

  users.users.valheim.isNormalUser = true;
  sops.validateSopsFiles = false;
  sops.defaultSopsFile = "/etc/nixos/secrets/secrets.yaml"; # todo: copy to this path from activation
  sops.secrets.valheim-password = {};
  sops.secrets.valheim-password.owner = config.users.users.valheim.name;

  systemd.services.valheim = {
    description = "Valheim Server";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      SupplementaryGroups = [ "keys" ];
      LoadCredential="VALHEIM_PASSWORD:${config.sops.secrets.valheim-password.path}";
      User = "valheim";
      Group = "users";
      StandardOutput= "journal";
      Type = "simple";
      WorkingDirectory = "/home/valheim";
      ExecStart = "${valheim-runner}/bin/start_valheim.sh \${CREDENTIALS_DIRECTORY}/VALHEIM_PASSWORD"; # from valheim-runner
    };
  };

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [ 
    steam-run
    steamPackages.steamcmd
    valheim-runner
  ];
}
