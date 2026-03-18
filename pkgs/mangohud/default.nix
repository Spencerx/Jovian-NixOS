{ mangohud', fetchFromGitHub, stdenv, meson, git, cacert }:
let
  # This is kind of a horrible hack to allow wraps to work.
  # We may want this in nixpkgs? idk
  version = "0.8.3.rc1.r24";

  src = fetchFromGitHub {
    owner = "flightlessmango";
    repo = "mangohud";
    rev = "33c2c7ddbb72c15e19a42163d75424d5804f8ec8";
    hash = "sha256-sbu3Ms8cy4/s1N/JkF3UVR3/3mGk1OAed1AfTM2j1iE=";
  };

  mesonDeps = stdenv.mkDerivation {
    pname = "mangohud-meson-deps";
    inherit version src;

    nativeBuildInputs = [ meson git cacert ];

    buildCommand = ''
      runPhase unpackPhase
      MESON_PACKAGE_CACHE_DIR=$out meson subprojects download
      
      # no idea what those are, but meson sometimes fails to clean them up, ruining r11y
      rm -f $out/tmp*
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
