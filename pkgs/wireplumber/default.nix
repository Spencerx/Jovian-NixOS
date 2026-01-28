{ wireplumber', fetchFromGitHub }:
wireplumber'.overrideAttrs(_: {
  version = "0.5.13-1.3";

  src = fetchFromGitHub {
    owner = "Jovian-Experiments";
    repo = "wireplumber";
    rev = "0.5.13-jupiter1.3";
    hash = "sha256-Ij/oY4yO1OGCmPuBt2ReZgZAkF28ghAMMTgOQ3BMLbI=";
  };
})
