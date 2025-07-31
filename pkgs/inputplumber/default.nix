{
  inputplumber',
  fetchFromGitHub,
  rustPlatform,
}:
inputplumber'.overrideAttrs rec {
  version = "0.60.8";

  src = fetchFromGitHub {
    owner = "ShadowBlip";
    repo = "InputPlumber";
    tag = "v${version}";
    hash = "sha256-k3SkjLjtCRionDwi2S/pZ40ShKgbsbQhBuLAs3Kd458=";
  };

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit src;
    hash = "sha256-i9mFQ12z3YE6Kb89Tt27reG1Y3rUmzTkAlT4Zd8rgXg=";
  };
}
