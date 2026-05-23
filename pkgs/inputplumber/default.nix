{
  inputplumber',
  fetchFromGitHub,
  rustPlatform,
}:
inputplumber'.overrideAttrs rec {
  version = "0.77.2";

  src = fetchFromGitHub {
    owner = "ShadowBlip";
    repo = "InputPlumber";
    tag = "v${version}";
    hash = "sha256-QxGDmuRTZLHBqZ+S73CtNKdLg/XumutGSpTSz4sGFYQ=";
  };

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit src;
    hash = "sha256-EtCK/zYRW2LdZhPSrO6ydBXBQwIrkqaJmH+3XfwERTw=";
  };
}
