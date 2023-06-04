{
  docker = {
    enable = false;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
  libvirtd.enable = true;
}
