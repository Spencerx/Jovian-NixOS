{
  config,
  lib,
  pkgs,
  ...
}:

let
  inherit (lib)
    mkIf
    mkOption
    types
    ;
  cfg = config.jovian.steamos;
in
{
  options = {
    jovian.steamos = {
      enableHdmiCecIntegration = mkOption {
        default = cfg.useSteamOSConfig;
        defaultText = lib.literalExpression "config.jovian.steamos.useSteamOSConfig";
        type = types.bool;
        description = ''
          Whether to enable SteamOS HDMI-CEC integration.
        '';
      };
    };
  };

  config = mkIf cfg.enableHdmiCecIntegration {
    environment.systemPackages = [ pkgs.cecd ];
    services.dbus.packages = [ pkgs.cecd ];
    services.udev.packages = [
      pkgs.cecd
      pkgs.inputattach-cec-units
    ];
    systemd.packages = [
      pkgs.cecd
      pkgs.inputattach-cec-units
    ];

    systemd.user.services.cecd = {
      overrideStrategy = "asDropin";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "steamos-manager-configure-cecd.service" ];
      after = [ "steamos-manager-configure-cecd.service" ];
    };
  };
}
