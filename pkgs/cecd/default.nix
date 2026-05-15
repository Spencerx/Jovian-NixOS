{
  lib,
  rustPlatform,
  fetchFromGitLab,
  replaceVars,
  coreutils,
  pkg-config,
  udev,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "cecd";
  version = "0.2.1";

  src = fetchFromGitLab {
    domain = "gitlab.steamos.cloud";
    owner = "holo";
    repo = "linux-cec";
    tag = "cecd-${finalAttrs.version}";
    hash = "sha256-OzNuwZmgfSt5w+OnYidObntz1adZQkZKDRewj/g16RA=";
  };

  cargoHash = "sha256-9H8uKX4Ht/xCB8VVO2nXNhyy1ZY0w6ruv0S9+qOMvoU=";

  # tests assume FHS paths
  doCheck = false;

  patches = [
    (replaceVars ./hardcode-paths.patch {
      coreutils = coreutils;
      out = null;
    })
  ];

  postPatch = ''
    substituteInPlace \
      cecd/src/config.rs \
      cecd/data/cecd.service \
      --replace-warn "@out@" "$out"
  '';

  strictDeps = true;

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    udev
  ];

  postInstall = ''
    # copied from vendor makefile, mostly
    install -d -m 755 $out/lib/udev/rules.d
    install -d -m 755 $out/share/systemd/user
    install -d -m 755 $out/share/dbus-1/services

    install -m 644 linux-cec/data/udev-rules.d/60-cec-uaccess.rules $out/lib/udev/rules.d
    install -m 644 cecd/data/udev-rules.d/60-cecd-uinput.rules $out/lib/udev/rules.d
    install -m 644 cecd/data/cecd.service $out/share/systemd/user
    install -m 644 cecd/data/com.steampowered.CecDaemon1.service $out/share/dbus-1/services
  '';

  meta = {
    description = "SteamOS HDMI-CEC daemon";
    license = lib.licenses.gpl2;
    mainProgram = "cecd";
  };
})
