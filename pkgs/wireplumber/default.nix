{ wireplumber', fetchFromGitHub }:
wireplumber'.overrideAttrs(_: {
  version = "0.5.10-1.11";

  src = fetchFromGitHub {
    owner = "Jovian-Experiments";
    repo = "wireplumber";
    rev = "0.5.10-jupiter1.11";
    hash = "sha256-CVszelAdEO926aWpLy+SF+z2PyxPG2ubENNR9RFO/t0=";
  };
})
