{ wireplumber', fetchFromGitHub }:
wireplumber'.overrideAttrs(_: {
  version = "0.5.7";

  src = fetchFromGitHub {
    owner = "Jovian-Experiments";
    repo = "wireplumber";
    rev = "0.5.7-jupiter1.6";
    hash = "sha256-Cs/gzOfmxm4wDYrjLsO4KDjQ3zC9kc8g8wg0XZyqaaM=";
  };
})
