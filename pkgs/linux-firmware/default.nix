{ linux-firmware, fetchFromGitHub }:

linux-firmware.overrideAttrs(_: rec {
  version = "20260504.1";

  src = fetchFromGitHub {
    owner = "Jovian-Experiments";
    repo = "linux-firmware";
    rev = "jupiter-${version}";
    hash = "sha256-G5S/m+iDdy/X+7CxthWygSK/rCD4RKtPKStnDKsS6vY=";
  };

  # clobber nixpkgs patches
  patches = [];
})
