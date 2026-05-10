{ wireplumber', fetchFromGitHub }:
wireplumber'.overrideAttrs(_: {
  version = "0.5.14-1.4";

  src = fetchFromGitHub {
    owner = "Jovian-Experiments";
    repo = "wireplumber";
    rev = "0.5.14-jupiter1.4";
    hash = "sha256-86PCp+BzwUvBdQb69stIhA442g/0M77/p65SqXAeOeg=";
  };
})
