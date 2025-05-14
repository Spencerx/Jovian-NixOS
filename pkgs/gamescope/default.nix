{ gamescope'
, fetchFromGitHub
}:

# NOTE: vendoring gamescope for the time being since we want to match the
#       version shipped by the vendor, ensuring feature level is equivalent.

# FIXME: remove hacks when https://github.com/NixOS/nixpkgs/pull/406993 makes it to channels
let
  stb = fetchFromGitHub {
    owner = "nothings";
    repo = "stb";
    rev = "af1a5bc352164740c1cc1354942b1c6b72eacb8a";
    hash = "sha256-GUoezek0deVQOc7PlNmD4vqN71jd1nU0oZQechorA2M=";
  };

  glm = fetchFromGitHub {
    owner = "g-truc";
    repo = "glm";
    rev = "0af55ccecd98d4e5a8d1fad7de25ba429d60e863";
    hash = "sha256-GnGyzNRpzuguc3yYbEFtYLvG+KiCtRAktiN+NvbOICE=";
  };
in
gamescope'.overrideAttrs(old: rec {
  version = "3.16.7";

  src = fetchFromGitHub {
    owner = "ValveSoftware";
    repo = "gamescope";
    rev = version;
    fetchSubmodules = true;
    hash = "sha256-q0yTOyu47tQXorFfnmRa4wrt0KRnyelLDmfcg4iwPfs=";
  };

  postUnpack = ''
    # Install meson wraps into the right place
    installWrap() {
      (
        cd "$sourceRoot/subprojects"
        cp -R --no-preserve=mode,ownership $2 $1
        cp -R --no-preserve=mode,ownership packagefiles/$1/* $1/
      )
    }

    installWrap stb ${stb}
    installWrap glm ${glm}
  '';
})
