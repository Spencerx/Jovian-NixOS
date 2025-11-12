{ mangohud', fetchFromGitHub }:
mangohud'.overrideAttrs(old: {
  version = "0.8.2.rc1.r4";

  src = fetchFromGitHub {
    owner = "flightlessmango";
    repo = "mangohud";
    rev = "1c0e8525bf105646b0ac2d002d13e481a4b6f270";
    hash = "sha256-sHYy555wJfZSdhtMOC5UtfLf6gPGeuxSKDX8HH3ZOw8=";
  };
})
