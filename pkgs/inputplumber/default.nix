{
  inputplumber',
  fetchFromGitHub,
  rustPlatform,
}:
inputplumber'.overrideAttrs rec {
  version = "0.61.0";

  src = fetchFromGitHub {
    owner = "ShadowBlip";
    repo = "InputPlumber";
    tag = "v${version}";
    hash = "sha256-LVEwlpWbbQQ8snYE+jVdxFnEatDoNr1jWZ9w7BONWmU=";
  };

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit src;
    hash = "sha256-RsmsSGfS2e/ekHhZz4pQQuXQlf27y0ZtnoEx0z8uznc=";
  };
}
