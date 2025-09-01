## Siarune's config flake for [NixOS](https://nixos.org/).

Machines:
- Calla: desktop
- Flint: laptop

Configuration is split between system-wide configuration dictated by NixOS itself in `sys` and userspace configuration dictated by [Home Manager](https://github.com/nix-community/home-manager) in `usr`

`sys` and `usr` both have a set of base configuration files that provide sane defaults. Inside, each machine provides their own additions and overrides as needed. Individual machines determine the necessary configuration files necessary from a set of static imports to stay as simple as possible.
