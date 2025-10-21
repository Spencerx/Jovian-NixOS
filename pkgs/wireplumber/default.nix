{ wireplumber', fetchFromGitHub }:
wireplumber'.overrideAttrs(_: {
  version = "0.5.10-1.8";

  src = fetchFromGitHub {
    owner = "Jovian-Experiments";
    repo = "wireplumber";
    rev = "0.5.10-jupiter1.8";
    hash = "sha256-WU3LEaRVV28BWiF8TJdmU9USj8KCAKxH5emODvjr7wE=";
  };
})
