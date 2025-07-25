{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    loader.systemd-boot.enable = true;
    kernelPackages = lib.mkForce pkgs.linuxPackages_cachyos;
    kernelModules = [ "kvm-amd" ];
    extraModulePackages = [ ];

    initrd = {
      kernelModules = [ ];
      availableKernelModules = [
        "nvme"
        "ahci"
        "xhci_pci"
        "thunderbolt"
        "usbhid"
      ];
    };

  };

  # Ignores wakeup call from NVME device that keeps it from suspending
  services.udev.extraRules = ''
    ACTION=="add" SUBSYSTEM=="pci" ATTR{vendor}=="0x1022" ATTR{device}=="0x1483" ATTR{power/wakeup}="disabled"
  '';

  swapDevices = [
    { device = "/dev/disk/by-uuid/e249f8fa-39b5-4466-a081-295f5429aede"; }
  ];

  fileSystems = {
    ## DO NOT TOUCH ##
    "/" = {
      device = "/dev/disk/by-uuid/7f9ef1f3-96c6-4e26-848d-16b338bd9ded";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/24FE-6571";
      fsType = "vfat";
      options = [
        "fmask=0022"
        "dmask=0022"
      ];
    };

    ## Nonessential, can touch

    "/mnt/m2" = {
      device = "/dev/disk/by-label/m2";
      fsType = "auto";
    };

    "/mnt/s1" = {
      device = "/dev/disk/by-label/s1";
      fsType = "ext4";
    };

    "/mnt/s2" = {
      device = "/dev/disk/by-label/s2";
      fsType = "ext4";
    };

  };

  networking.hostName = "Calla";
  networking.useDHCP = lib.mkDefault true;
  hardware.bluetooth.enable = true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
