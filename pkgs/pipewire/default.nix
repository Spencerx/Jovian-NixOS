{ pipewire', fetchFromGitHub }:
pipewire'.overrideAttrs (_: {
  version = "1.6.4-1.5";

  src = fetchFromGitHub {
    owner = "Jovian-Experiments";
    repo = "pipewire";
    rev = "1.6.4-jupiter1.5";
    hash = "sha256-gSuS+kd9TKNU0K+DXkn9cyV+BuLOc6UYHV+gQwsSxNA=";
  };
})
