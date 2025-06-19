{ wireplumber', fetchFromGitHub }:
wireplumber'.overrideAttrs(_: {
  version = "0.5.7";

  src = fetchFromGitHub {
    owner = "Jovian-Experiments";
    repo = "wireplumber";
    rev = "0.5.7-jupiter1.3";
    hash = "sha256-tJ7Egie2IVtZkNCb0/R9vaKlwgYiVHJ7Cb/TN8v9gN8=";
  };
})
