let
  # users
  anderson = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMltYp0nSf+aRcpKo9hysa2kHTGOiguAMEVzpL6gMgHC anderson@framework";

  # machines
  server = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM0bEHtDoYFwcdeophpGYxHn15VyP6PGh4qzPfT5ThTb root@server";
  framework = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFaAsve5f1Jw/zrmGiHrjzi6NcZYtoMa6LQfB3DhsyK3 root@framework";
  desktop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPildc+k+Jku5GdH8/8+0K/OLz89uxYUOMCfH7jOWtcb root@framework";

  machines = [
    server
    framework
    desktop
  ];

  clients = [
    framework
    desktop
  ];

  users = [
    anderson
  ];
in
{
  #"anthropic-api-key.age".publicKeys = anderson;
  #"cloudflare-api-key.age".publicKeys = server;
  "samba-credentials.age".publicKeys = clients;
}
