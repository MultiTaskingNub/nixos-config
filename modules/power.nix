{ config, ... }:
{
  services.logind.lidSwitchExternalPower = "ignore";
  powerManagement.cpuFreqGovernor = "performance";
}
