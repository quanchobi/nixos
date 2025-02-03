# My Home Manager Configuration

## 🏡 Overview

This is my home-manager configuration. There are many like it, but this one is mine. This might get spun into its own repo sometime such that I can use it on other non NixOS machines.

## 📁 Organization

Files are organized like this:

```
home
├─── README.md
╰─── <user>
    ├─── default.nix
    ├─── cli
    │   ├─── default.nix
    │   ╰─── <cli modules>
    ╰─── gui
        ├─── default.nix
        ╰─── <gui modules>
```

### ⌨️ CLI

CLI modules are enabled for all machines. It provides a basic set of CLI tools that are useful to have on any system.

### 💻 GUI

GUI modules are only enabled on machines with GUIs enabled in their host configuration. This is done with a boolean defined in flake.nix.

```{nix}
{ lib, enableGui, ... }:
{
imports = [
  ./cli
] ++ (lib.optionals enableGui [ ./gui ]);
}
```

## 📝 Notes

**_HERE BE DRAGONS!_**

Use at your own peril.
