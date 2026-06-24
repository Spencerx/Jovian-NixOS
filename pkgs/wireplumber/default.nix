{ wireplumber', fetchFromGitHub }:
wireplumber'.overrideAttrs(_: {
  version = "0.5.14-1.5";

  src = fetchFromGitHub {
    owner = "Jovian-Experiments";
    repo = "wireplumber";
    rev = "0.5.14-jupiter1.5";
    hash = "sha256-QztDvERePROv0G7KoqUvcOlSm7tKUseyM51MBbI/6k4=";
  };
})
