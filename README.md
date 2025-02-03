# My NixOS Configuration

## Overview

This is my personal NixOS system configuration flake. There are many like it, but this one is mine. I don't do anything particularly special, but here is a list of other cool flakes to check out.

## Organization

The basic organization is something like this:

```
nixos
├─── README.md
├─── assets
│   ╰─── desktop.jpg
├─── home
│   ├─── default.nix
│   ╰─── <username>
│       ╰─── <user home-manager config>
├─── host
│   ├─── default.nix
│   ╰─── <hostname>
│       ╰─── <host machine config>
╰──── secrets
     ├─── secrets.nix
     ╰─── <program_secret.age>
```

### Assets

Contains assets for the system, such as a desktop background image or profile picture.

### Home

User environment definition via [home-manager](https://github.com/nix-community/home-manager). Currently only one user defined, since I am the only one using these machines.

### Host

Contains host machine configuration. Basically what would be in configuration.nix on a non-flake system.

### Secrets

Nix friendly secrets storage using [agenix](https://github.com/ryantm/agenix).

## Important Notes

### **_This Will Not Work On Your Machine_**

You're free to take and use modules as you please, but you should **not** try and use this as is for your own system. At the very least, you would need to change hardware-configuration.nix to get it working, but there are other modules that rely on having the same hardware as me to be functional.

## TODO?

- [] Make home-manager its own flake in its own repo. This lets me run it on non NixOS systems.

- [] Make Nixvim its own flake in its own repo. Like above, this lets me run it on non NixOS systems.

- [] Do more stuff with [agenix](https://github.com/ryantm/agenix). Right now I don't really have it set up.

- [] Set up Home Assistant on my server.

- [x] Have fun!
