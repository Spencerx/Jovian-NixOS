{ wireplumber', fetchFromGitHub }:
wireplumber'.overrideAttrs(_: {
  version = "0.5.10";

  src = fetchFromGitHub {
    owner = "Jovian-Experiments";
    repo = "wireplumber";
    rev = "0.5.10-jupiter1.1";
    hash = "sha256-IY6TqtEhIxp/xybC/OmZJF+mNxzaJgLukkDImK/0x3w=";
  };
})
