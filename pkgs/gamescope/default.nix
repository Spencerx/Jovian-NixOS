{ 
  gamescope',
  fetchFromGitHub,
}:

# NOTE: vendoring gamescope for the time being since we want to match the
#       version shipped by the vendor, ensuring feature level is equivalent.

gamescope'.overrideAttrs(old: rec {
  version = "3.16.10";

  src = fetchFromGitHub {
    owner = "ValveSoftware";
    repo = "gamescope";
    rev = version;
    fetchSubmodules = true;
    hash = "sha256-MZhIsnSp2uGMQds5zEhF8WZgGNHDGH+3A2TGjB6Vn10=";
  };
})
