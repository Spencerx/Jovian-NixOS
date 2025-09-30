{ wireplumber', fetchFromGitHub }:
wireplumber'.overrideAttrs(_: {
  version = "0.5.10-1.6";

  src = fetchFromGitHub {
    owner = "Jovian-Experiments";
    repo = "wireplumber";
    rev = "0.5.10-jupiter1.6";
    hash = "sha256-H+fcrM30oQz3+2huvzoMic8M0fUzUVdM/Rn9QwfACsk=";
  };
})
