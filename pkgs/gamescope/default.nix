{ 
  gamescope',
  fetchFromGitHub,
}:

# NOTE: vendoring gamescope for the time being since we want to match the
#       version shipped by the vendor, ensuring feature level is equivalent.

gamescope'.overrideAttrs(old: rec {
  version = "3.16.13";

  src = fetchFromGitHub {
    owner = "ValveSoftware";
    repo = "gamescope";
    rev = version;
    fetchSubmodules = true;
    hash = "sha256-P+paY8lE1twRet/WS8acqtI39vHN0ebZJA9EredcMpQ=";
  };

  postPatch = ''
    patchShebangs default_extras_install.sh
  '';
})
