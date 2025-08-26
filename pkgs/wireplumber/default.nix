{ wireplumber', fetchFromGitHub }:
wireplumber'.overrideAttrs(_: {
  version = "0.5.10-1.4";

  src = fetchFromGitHub {
    owner = "Jovian-Experiments";
    repo = "wireplumber";
    rev = "0.5.10-jupiter1.4";
    hash = "sha256-7kvOB/NnBKkfn4nI8lWYCRWpZAwtTei9keDX2qSyY+k=";
  };
})
