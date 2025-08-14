{ wireplumber', fetchFromGitHub }:
wireplumber'.overrideAttrs(_: {
  version = "0.5.10";

  src = fetchFromGitHub {
    owner = "Jovian-Experiments";
    repo = "wireplumber";
    rev = "0.5.10-jupiter1.2";
    hash = "sha256-FQdWwbA3/XmEKK1WrDvlcLHigMXJRT4g4ynd0Qb31RE=";
  };
})
