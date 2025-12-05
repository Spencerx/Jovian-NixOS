{ wireplumber', fetchFromGitHub }:
wireplumber'.overrideAttrs(_: {
  version = "0.5.10-1.10";

  src = fetchFromGitHub {
    owner = "Jovian-Experiments";
    repo = "wireplumber";
    rev = "0.5.10-jupiter1.10";
    hash = "sha256-IjCYxRTxAdsg6wkNbrIFYl6ZxJP2Q+7/VMssFk5vL6g=";
  };
})
