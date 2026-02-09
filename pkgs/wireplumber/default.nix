{ wireplumber', fetchFromGitHub }:
wireplumber'.overrideAttrs(_: {
  version = "0.5.13-1.4";

  src = fetchFromGitHub {
    owner = "Jovian-Experiments";
    repo = "wireplumber";
    rev = "0.5.13-jupiter1.4";
    hash = "sha256-s8Xps7DxdGiLcgUsw8yGmkZqG1qeGX2o35V3i1do/so=";
  };
})
