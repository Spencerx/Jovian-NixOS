{
  inputplumber',
  fetchFromGitHub,
  rustPlatform,
}:
inputplumber'.overrideAttrs rec {
  version = "0.72.0";

  src = fetchFromGitHub {
    owner = "ShadowBlip";
    repo = "InputPlumber";
    tag = "v${version}";
    hash = "sha256-bzIrP6bUxEEgQ+lCKV3jpdyBNMAanCYXiMCr8ypUkUY=";
  };

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit src;
    hash = "sha256-DP4Qe9bzDkuE36RldYPYNeGrQWVqBewU5GUt8zw3GAA=";
  };
}
