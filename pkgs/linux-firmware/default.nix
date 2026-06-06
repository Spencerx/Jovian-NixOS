{ linux-firmware, fetchFromGitHub }:

linux-firmware.overrideAttrs(_: rec {
  version = "20260604.1";

  src = fetchFromGitHub {
    owner = "Jovian-Experiments";
    repo = "linux-firmware";
    rev = "jupiter-${version}";
    hash = "sha256-gDNRwj5u2+5mFcXzRfcFM2SCIjig7QDnMnsFezYSxfI=";
  };

  # clobber nixpkgs patches
  patches = [];
})
