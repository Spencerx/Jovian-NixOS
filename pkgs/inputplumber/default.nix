{
  inputplumber',
  fetchFromGitHub,
  rustPlatform,
}:
inputplumber'.overrideAttrs rec {
  version = "0.57.0";

  src = fetchFromGitHub {
    owner = "ShadowBlip";
    repo = "InputPlumber";
    tag = "v${version}";
    hash = "sha256-s6MEQI53kgsgTQN9Ye+Q0MjdKvNXK8kVkZEdQ6OxoxA=";
  };

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit src;
    hash = "sha256-lKi+iX8+GOU3RSzwpgjXq3mjCw+tLt0WWxVic1zzpo0=";
  };
}
