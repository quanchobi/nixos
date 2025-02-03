# 💻 Host Configuration

## 🖥️ Machines

### Common

Contains packages and keyboard configuration to be shared across all systems.

### Desktop

My desktop machine. Contains a 2080 Super and 11900K-ES. Used for desktop things. Gaming, coding, 3d printing, etc.

### Framework

My [Framework](https://frame.work/) laptop. Ryzen 7840U. Used for laptop things. Coding, 3d printing, etc.

### Server

My home server. Xeon-2683v4 and Intel Arc A380. Runs lots of things. Mostly for torrenting media and storing files. Though it also runs AI things (on CPU unfortunately) and home assistant.

### WSL

My desktop, just on WSL. I use dual boot to run Windows and NixOS on it, but I still like to have my CLI tools set up in WSL.

## 📁 File Structure

The host directory should be set up like this. Each machine should follow the template outlined in \<hostname\>. \<hostname\>/default.nix is the entrypoint for each machine's configuration.

```
host
├─── README.md
├─── common
│   ├─── default.nix
│   ╰─── modules
│       ├─── default.nix
│       ╰─── ...
╰──── <hostname>
    ├─── default.nix
    ╰─── modules
        ├─── default.nix
        ├─── hardware-configuration.nix
        ├─── nix-configuration.nix
        ├─── programs
        │   ├─── default.nix
        │   ├─── <program-1>.nix
        │   ├─── <program-2>.nix
        │   ╰─── ...
        ├─── services
        │   ├─── default.nix
        │   ├─── <service-1>.nix
        │   ├─── <service-2>.nix
        │   ╰─── ...
        ╰─── environment
            ├─── default.nix
            ├─── environment-variables.nix
            ├─── system-packages.nix
            ╰─── ...
```

_Yes I wrote the tree by hand..._

## File Format

Files should generally be formatted like this. The keen eyed among you will notice this is the same way as [NixOS modules are written](https://nixos.wiki/wiki/NixOS_modules). One module defined per file.

```{nix}
{ /* Required inputs, ie: pkgs, config, lib, ... */ }:
{
  imports = [ /* imported modules go here */ ];

  options = { /* ovverides and things go here */ };

  config = { # Option definitions
    programs.foo = { # or services.foo, environment.foo , whatever.foo
      enable = true;

      settings = { /* foo options go here */ };
    };
  };
}
```
