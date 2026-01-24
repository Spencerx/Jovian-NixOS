{ wireplumber', fetchFromGitHub }:
wireplumber'.overrideAttrs(_: {
  version = "0.5.13-1.2";

  src = fetchFromGitHub {
    owner = "Jovian-Experiments";
    repo = "wireplumber";
    rev = "0.5.13-jupiter1.2";
    hash = "sha256-aw78d3in0g3UR/3NjVxwf0X0/fTyXe7FJsqnwx1/OUM=";
  };
})
