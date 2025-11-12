{ linux-firmware, fetchFromGitHub }:

linux-firmware.overrideAttrs(_: rec {
  version = "20251111.1";

  src = fetchFromGitHub {
    owner = "Jovian-Experiments";
    repo = "linux-firmware";
    rev = "jupiter-${version}";
    hash = "sha256-WSVExTVoB4x+Ca3iNsh/FRfix9NNTWqWMPFEdZKFw7g=";
  };
})
