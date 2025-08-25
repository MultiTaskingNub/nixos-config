{
  config,
  lib,
  pkgs,
  ...
}:

{
  networking.useDHCP = false;
  networking.interfaces.wlp3s0.useDHCP = false;
  networking.networkmanager.wifi.powersave = false;
  networking.networkmanager.settings = {
    connection.wifi.band = "a"; # “a” = 5GHz only
  };

}
