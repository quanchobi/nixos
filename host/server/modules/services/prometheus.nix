{ config, ... }:
{
  # https://nixos.org/manual/nixos/stable/#module-services-prometheus-exporters
  services.prometheus = {
    enable = true;
    globalConfig = {
      scrape_interval = "10s";
    };
    scrapeConfigs = [
      {
        job_name = "node";
        static_configs = [
          {
            targets = [ "localhost:${toString config.services.prometheus.exporters.node.port}" ];
          }
        ];
      }
      {
        job_name = "smart";
        static_configs = [
          {
            targets = [ "localhost:${toString config.services.prometheus.exporters.smartctl.port}" ];
          }
        ];
      }
    ];
    exporters = {
      node = {
        enable = true;
        port = 9000;
        # https://github.com/NixOS/nixpkgs/blob/nixos-24.05/nixos/modules/services/monitoring/prometheus/exporters.nix
        enabledCollectors = [ "systemd" ];
        # /nix/store/zgsw0yx18v10xa58psanfabmg95nl2bb-node_exporter-1.8.1/bin/node_exporter  --help
        extraFlags = [
          "--collector.ethtool"
          "--collector.softirqs"
          "--collector.tcpstat"
          "--collector.wifi"
        ];
      };

      smartctl = {
        enable = true;
        devices = [
          # root
          "/dev/disk/by-id/nvme-Samsung_SSD_980_1TB_S64ANG0R519415E"
          # crypt
          "/dev/disk/by-id/ata-WDC_WD20EURX-63T0FY0_WD-WCC4M3KNXL10"
          "/dev/disk/by-id/ata-WDC_WD20EURX-25T0FY0_WD-WCC4M5LH7PA3"
          "/dev/disk/by-id/ata-WDC_WD20EURX-63T0FY0_WD-WCC4M2HURTD5"
          "/dev/disk/by-id/ata-WDC_WD20EURX-25T0FY0_WD-WCC4M3NTDC3J"
          # mirror
          "/dev/disk/by-id/ata-ST8000VN004-2M2101_WSD956HY"
          "/dev/disk/by-id/ata-ST8000VN0022-2EL112_ZA1HVM80"
        ];
      };
    };
  };

  services.smartd = {
    enable = true;
    devices = [
      # root
      {
        device = "/dev/disk/by-id/nvme-Samsung_SSD_980_1TB_S64ANG0R519415E"; # nvme0
      }

      # crypt
      {
        device = "/dev/disk/by-id/ata-WDC_WD20EURX-63T0FY0_WD-WCC4M3KNXL10"; # sdb
      }
      {
        device = "/dev/disk/by-id/ata-WDC_WD20EURX-25T0FY0_WD-WCC4M5LH7PA3"; # sdc
      }
      {
        device = "/dev/disk/by-id/ata-WDC_WD20EURX-63T0FY0_WD-WCC4M2HURTD5"; # sdd
      }
      {
        device = "/dev/disk/by-id/ata-WDC_WD20EURX-25T0FY0_WD-WCC4M3NTDC3J"; # sdf
      }

      # mirror
      {
        device = "/dev/disk/by-id/ata-ST8000VN004-2M2101_WSD956HY"; # sda
      }
      {
        device = "/dev/disk/by-id/ata-ST8000VN0022-2EL112_ZA1HVM80"; # sde
      }
    ];
  };
}
