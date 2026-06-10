{
  inputplumber',
  fetchFromGitHub,
  rustPlatform,
}:
inputplumber'.overrideAttrs rec {
  version = "0.77.4";

  src = fetchFromGitHub {
    owner = "ShadowBlip";
    repo = "InputPlumber";
    tag = "v${version}";
    hash = "sha256-7yN89FEgQg+KeBrlCPbWIL8FE7abikdff9alZ9FMkqU=";
  };

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit src;
    hash = "sha256-BLIjerf5SYKhc3FB0lR3iWaD5+KXh3XmWy1ujwl8fVU=";
  };
}
