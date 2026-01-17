{ wireplumber', fetchFromGitHub }:
wireplumber'.overrideAttrs(_: {
  version = "0.5.13-1.1";

  src = fetchFromGitHub {
    owner = "Jovian-Experiments";
    repo = "wireplumber";
    rev = "0.5.13-jupiter1.1";
    hash = "sha256-Zuq4U9tmls6rQ5K9drqcEJfDFPdx9Jisx4WoKyB2rrY=";
  };
})
