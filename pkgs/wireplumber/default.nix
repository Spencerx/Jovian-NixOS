{ wireplumber', fetchFromGitHub }:
wireplumber'.overrideAttrs(_: {
  version = "0.5.10-1.12";

  src = fetchFromGitHub {
    owner = "Jovian-Experiments";
    repo = "wireplumber";
    rev = "0.5.10-jupiter1.12";
    hash = "sha256-DmEu2ojSkf+8OY/SQm6kbuUgHM1GufPVZTjlZPiNpj0=";
  };
})
