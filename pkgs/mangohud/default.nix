{ mangohud', fetchFromGitHub, stdenv, meson, git }:
let
  # This is kind of a horrible hack to allow wraps to work.
  # We may want this in nixpkgs? idk
  version = "0.8.3.rc1.r13";

  src = fetchFromGitHub {
    owner = "flightlessmango";
    repo = "mangohud";
    rev = "756ffcfdd7a688ecef5716891e84b43cb9c9cb15";
    hash = "sha256-ZhcJVhYXRTTouhOHB89QEwG4w7fYEdvigB3Q3zwNIJg=";
  };

  mesonDeps = stdenv.mkDerivation {
    pname = "mangohud-meson-deps";
    inherit version src;

    nativeBuildInputs = [ meson git ];

    buildCommand = ''
      runPhase unpackPhase
      MESON_PACKAGE_CACHE_DIR=$out meson subprojects download
    '';

    outputHash = "sha256-5Cy68E6yB5ZUkIpQbphrTgaphA0vZQ8Ue3aDrvGeehw=";
    outputHashAlgo = "sha256";
    outputHashMode = "recursive";
  };
in
mangohud'.overrideAttrs(old: {
  inherit version src;

  env.MESON_PACKAGE_CACHE_DIR = mesonDeps;
})
