{
  config,
  lib,
  pkgs,
  ...
}:

{
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      22
      7777
      8888
    ];
    allowedUDPPorts = [
      22
      7777
      8888
    ];
  };
}
