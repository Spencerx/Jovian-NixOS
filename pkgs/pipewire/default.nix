{ pipewire', fetchFromGitHub }:
pipewire'.overrideAttrs (_: {
  version = "1.6.4-1.7";

  src = fetchFromGitHub {
    owner = "Jovian-Experiments";
    repo = "pipewire";
    rev = "1.6.4-jupiter1.7";
    hash = "sha256-t0d3XwafwV7XxDkSZ57guVV0gqo6GA0jnU3pj1JBfJs=";
  };
})
