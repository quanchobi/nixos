let
  # users
  anderson = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMltYp0nSf+aRcpKo9hysa2kHTGOiguAMEVzpL6gMgHC anderson@framework";

  anderson-server = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMYuGbAyqysSfEU6ar8msEQSHOKr8Jbf4NadMQqkTKqS anderson@server";

  # machines
  server_ed25519 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM0bEHtDoYFwcdeophpGYxHn15VyP6PGh4qzPfT5ThTb root@server";
  server_rsa = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDRDqueFwqnr470a5iM1kTBSMyDYT8sOj2m+Df+4EQ9ObV8tZuRqGpGzI5Q+iHw/H11kLpL/Jjj6hI2SQC+u6eajfCXgwP/LANPUFRMkfm+bxjq4F849WbhN2gFpszdI+MFM0SUpel8NSqT6ub7yJatUTD7a4sYKOpQDZ5TCG1bAIrwl1YcU5w248ZVZObsBS1YTyUjVjp5oa3mbFLdhBEzEpnKXpL7l1yvFqToINCaaB58f5CnOAl3p1dtGdFW8kGR4/tMHxAoeeeoCCfx1PUA4yHxtM/ggxZR3yuQacDiEkVJ7ZX8xYwzqp836316AeX1L46lUmr3pZGOQUECGMPdQ2O7vBntyy0km4ybMHXDSehcAs8kYrEmpocTjrFmMYHftc/RttLUQz97roT6cTo14nFp6OiRsiKBd0hobHPMNcUu/kEcK/pJeKcfHwx4SS/UHYzDU3u80Z5vNkhGxKNBNlzBu+HJIq1SHLtbS24qNEc3p42iogKCliWJDCAlKyQmxwe2kxbvFmCx/qwymPzXCHaeR8Y5eXhiIL9v937NUz5A4wWc0K/XHNmlDkbo/JmtolXm3QZ+DX3LlSnd0CkEMmzedmbe8ZvUCa12vpH/kw/19AkTSGV8PlGH5FBPtxpDInMVLDjc1IAV0LjlULEXq7boDuLn44/sDgB5xHK2jw== root@server";
  framework = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFaAsve5f1Jw/zrmGiHrjzi6NcZYtoMa6LQfB3DhsyK3 root@framework";
  desktop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPildc+k+Jku5GdH8/8+0K/OLz89uxYUOMCfH7jOWtcb root@framework";

  server = [
    server_ed25519
    server_rsa
  ];

  clients = [
    framework
    desktop
    anderson
  ];

  users = [
    anderson
  ];
in
{
  #"anthropic-api-key.age".publicKeys = anderson;
  #"cloudflare-api-key.age".publicKeys = server;
  "samba-credentials.age".publicKeys = clients;
  "deluge-credentials.age".publicKeys = server ++ [ anderson-server ];
  "transmission-credentials.age".publicKeys = server ++ [ anderson-server ];
}
