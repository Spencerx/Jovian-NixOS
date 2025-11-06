{ wireplumber', fetchFromGitHub }:
wireplumber'.overrideAttrs(_: {
  version = "0.5.10-1.9";

  src = fetchFromGitHub {
    owner = "Jovian-Experiments";
    repo = "wireplumber";
    rev = "0.5.10-jupiter1.9";
    hash = "sha256-kmu7R8/6S3P987/aFGjQNxKBbSo3gk3S7mb8aqdtP8E=";
  };
})
