let
  #framework = "";
  #desktop = "";
  #server = "";
  anderson = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMltYp0nSf+aRcpKo9hysa2kHTGOiguAMEVzpL6gMgHC anderson@framework";
in
{
  "anthropic-api-key.age".publicKeys = [ anderson ];
  "cloudflare-dns-challenge-key.age".publicKeys = [ anderson ];
}
