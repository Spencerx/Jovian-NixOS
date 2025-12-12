{
  inputplumber',
  fetchFromGitHub,
  rustPlatform,
}:
inputplumber'.overrideAttrs rec {
  version = "0.69.0";

  src = fetchFromGitHub {
    owner = "ShadowBlip";
    repo = "InputPlumber";
    tag = "v${version}";
    hash = "sha256-bjaralA94aHmtobmCUx3vNbJWzZxZYQJT/J/MCopNi4=";
  };

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit src;
    hash = "sha256-QGBZJtky5FD6VcRNmks7hAs+uZWaRuzMTJyjybX2/BU=";
  };
}
