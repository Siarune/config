{
  config,
  lib,
  modulesPath,
  ...
}:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    loader.systemd-boot.enable = true;
    initrd.availableKernelModules = [
      "nvme"
      "xhci_pci"
      "thunderbolt"
      "usb_storage"
      "sd_mod"
      "sdhci_pci"
    ];
    initrd.kernelModules = [ ];
    kernelModules = [ "kvm-amd" ];
    kernelParams = [
      "acpi.ec_no_wakeup=1" # Fixes ACPI wakeup issues
      "amdgpu.dcdebugmask=0x10" # Fixes Wayland slowdowns/freezes
      "resume_offset=6475776" # Hibernation resume point to root offset
      "mem_sleep_default=deep"
    ];

    extraModulePackages = with config.boot.kernelPackages; [ yt6801 ];
    resumeDevice = "/dev/disk/by-uuid/71c7c3e6-ff7e-41a1-a802-ecb7ae2b3463";
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/71c7c3e6-ff7e-41a1-a802-ecb7ae2b3463";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/24BD-4F4B";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };

    "/mnt/games" = {
      device = "/dev/disk/by-partlabel/games";
      fsType = "ext4";
    };
  };

  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 32 * 1024;
    }
  ];

  powerManagement.enable = true;
  systemd.sleep.extraConfig = "HibernateDelaySec=1h";

  networking.hostName = "Flint";
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  system.stateVersion = "25.05";
}
