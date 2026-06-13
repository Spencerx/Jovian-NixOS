{
  inputplumber',
  fetchFromGitHub,
  rustPlatform,
}:
inputplumber'.overrideAttrs rec {
  version = "0.77.5";

  src = fetchFromGitHub {
    owner = "ShadowBlip";
    repo = "InputPlumber";
    tag = "v${version}";
    hash = "sha256-L6Ebyh4K4l+7LlVlgDRym9o+XsQPExC7xH1EBPwyLB4=";
  };

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit src;
    hash = "sha256-avwKy2AvgzT2IfRw/aMwllaYa4RLx7DJPxrgjHwBY1I=";
  };
}
