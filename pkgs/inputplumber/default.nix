{
  inputplumber',
  fetchFromGitHub,
  rustPlatform,
}:
inputplumber'.overrideAttrs rec {
  version = "0.76.1";

  src = fetchFromGitHub {
    owner = "ShadowBlip";
    repo = "InputPlumber";
    tag = "v${version}";
    hash = "sha256-SkW79i1jutVwty18bWXJEUijDunHukF3Sxqm0VwzMz0=";
  };

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit src;
    hash = "sha256-nHAdU/7JHPveOvUsXqdmUQtzET2Jv6T6PN83S7TwsIM=";
  };
}
