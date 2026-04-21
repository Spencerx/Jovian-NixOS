{ wireplumber', fetchFromGitHub }:
wireplumber'.overrideAttrs(_: {
  version = "0.5.14-1.2";

  src = fetchFromGitHub {
    owner = "Jovian-Experiments";
    repo = "wireplumber";
    rev = "0.5.14-jupiter1.2";
    hash = "sha256-uNzWqT206qc8Gh6znEg/9Zbu05MsCxSaix04QRQCAZ0=";
  };
})
