{ stdenv, fetchFromGitHub }:
stdenv.mkDerivation {
  pname = "noisetorch-ladspa";
  version = "0.12.2-unstable-2025-01-13";

  src = fetchFromGitHub {
    owner = "noisetorch";
    repo = "NoiseTorch";
    rev = "6d895f35d32a6a7dd5f472f596ccfb6cfeac5c08";
    fetchSubmodules = true;
    hash = "sha256-rYEHucRAmOXCQywoyWzj8Sy6nKtRvjxeryiEV2ZMeq0=";
  };

  sourceRoot = "source/c/ladspa";

  installPhase = ''
    install -Dm555 rnnoise_ladspa.so $out/lib/ladspa/rnnoise_ladspa.so
  '';
}
