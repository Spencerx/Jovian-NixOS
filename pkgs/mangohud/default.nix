{ mangohud', fetchFromGitHub }:
mangohud'.overrideAttrs {
  version = "0.8.1.r30";

  src = fetchFromGitHub {
    owner = "flightlessmango";
    repo = "mangohud";
    rev = "07a04a27cc6ecd66c3d132a22b3c313ef4860532";
    hash = "sha256-V6g4mcUElj+E/cjJzjlOOYumi7bx5UbSFEn9nFUWP04=";
  };
}
