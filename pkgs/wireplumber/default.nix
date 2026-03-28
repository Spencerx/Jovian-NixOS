{ wireplumber', fetchFromGitHub }:
wireplumber'.overrideAttrs(_: {
  version = "0.5.14-1.1";

  src = fetchFromGitHub {
    owner = "Jovian-Experiments";
    repo = "wireplumber";
    rev = "0.5.14-jupiter1.1";
    hash = "sha256-k2PPXbLWLWajBgknd5ypSlilmO+M73pNMbDxBsgzIFM=";
  };
})
