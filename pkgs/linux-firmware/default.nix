{ linux-firmware, fetchFromGitHub }:

linux-firmware.overrideAttrs(_: rec {
  version = "20260610.1";

  src = fetchFromGitHub {
    owner = "Jovian-Experiments";
    repo = "linux-firmware";
    rev = "jupiter-${version}";
    hash = "sha256-PbNUw9tLQLrWNFb9Pr5ajXviqZm5X6E8NCLogFulYY4=";
  };

  # clobber nixpkgs patches
  patches = [];
})
