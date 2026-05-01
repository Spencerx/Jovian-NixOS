{ wireplumber', fetchFromGitHub }:
wireplumber'.overrideAttrs(_: {
  version = "0.5.14-1.3";

  src = fetchFromGitHub {
    owner = "Jovian-Experiments";
    repo = "wireplumber";
    rev = "0.5.14-jupiter1.3";
    hash = "sha256-LBq3+ZzxDriXrDqtrhl7I6684u216oA0gVhF9MQNcog=";
  };
})
