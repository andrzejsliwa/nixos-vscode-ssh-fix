let
  moduleConfig = name: description: serviceConfig: {
    systemd.user.services.${name} = {
      Unit = {
        Description = description;
      };
      Service = serviceConfig;
      Install = {
        WantedBy = ["default.target"];
      };
    };
  };
in {
  imports = [
    ./phpstorm.nix
    ({
      name,
      description,
      serviceConfig,
      ...
    }: (moduleConfig name description serviceConfig))
  ];
}
