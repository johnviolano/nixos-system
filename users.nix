{ ... }:
{
  users.users = {
    jv = {
      isNormalUser = true;
      home = "/home/jv";
      description = "John Violano";
      extraGroups = [ "wheel" ];
      openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC+lwgdRwgMD1pdrE2fVIP9JV/YX2/0+Zu84HFWM/GvUEU63f7h1By53bLOY74TaKUIGdItBRFRny4RLe0Q78jxoZEQ4lvOTXFGGyy50Qz5GIkk+nguj/axc928RrgpkHGRfm68fmdE0xFjW7Jt7bepwREHTCG3JlGSwsLkfw4RvRM9o9SCe8SGTseNwvKxXQyEr3staf+yzguhvx5UtNXvb7cPKamMErvSaotY1BRqCxklegcUlOkVoSoCvqmvdxcNlG4C3dsyOTaVG/xKlusXgUEF53M6ZQJw+u8RjyY49dEPqqvhONW1VOlBwIvZj7JxIcNzLgTNTCh1lagIrxvl" ];
    };
  };
}
