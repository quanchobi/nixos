{ pkgs, ... }:
{
  hardware.printers = {
  };
  services.printing.drivers = with pkgs; [
    gutenprint
    epson-escpr
    epson-escpr2
  ];
}
