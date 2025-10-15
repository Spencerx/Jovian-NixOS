{ wireplumber', fetchFromGitHub }:
wireplumber'.overrideAttrs(_: {
  version = "0.5.10-1.7";

  src = fetchFromGitHub {
    owner = "Jovian-Experiments";
    repo = "wireplumber";
    rev = "0.5.10-jupiter1.7";
    hash = "sha256-O0dNJqazN00DDtB6y8YKLJEwAFOL/b6m0WQvD3hpA14=";
  };
})
