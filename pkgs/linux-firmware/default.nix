{ linux-firmware, fetchFromGitHub }:

linux-firmware.overrideAttrs(_: rec {
  version = "20260216.1";

  src = fetchFromGitHub {
    owner = "Jovian-Experiments";
    repo = "linux-firmware";
    rev = "jupiter-${version}";
    hash = "sha256-0O46ZVW0rRn6wztyB8SJb6WxFd6pnak0Ri1YxkBSqyY=";
  };

  # clobber nixpkgs patches
  patches = [];
})
