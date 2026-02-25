{ mangohud', fetchFromGitHub, stdenv, meson, git, cacert }:
let
  # This is kind of a horrible hack to allow wraps to work.
  # We may want this in nixpkgs? idk
  version = "0.8.3.rc1.r18";

  src = fetchFromGitHub {
    owner = "flightlessmango";
    repo = "mangohud";
    rev = "01b724d3e43f668babcbd70b550944bea4bdd524";
    hash = "sha256-aGrHjcEzir9vq+bbhY1lLX1qmrNMtasUnoKbd3HGAS0=";
  };

  mesonDeps = stdenv.mkDerivation {
    pname = "mangohud-meson-deps";
    inherit version src;

    nativeBuildInputs = [ meson git cacert ];

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
