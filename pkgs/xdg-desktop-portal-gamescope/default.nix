{
  stdenv,
  fetchFromGitHub,
  meson,
  ninja,
  pkg-config,
  rustc,
  cargo,
  rustPlatform,
  systemd,
  dbus,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "xdg-desktop-portal-gamescope";
  version = "0.1.23.bfbf0e3";

  src = fetchFromGitHub {
    owner = "Jovian-Experiments";
    repo = "xdg-desktop-portal-gamescope";
    rev = "bfbf0e3aa2082d2b38bb87de7d0b2f077f98d8d8";
    hash = "sha256-gwChB/kiwiG0k2t/TKSMozKsPDCNwpFNPXVgONNJZVA=";
  };

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit (finalAttrs) src;
    hash = "sha256-ItvqbuWh/JNQVqlIB1gFW0Q4YBGg7mdZfxqTPCYryUE=";
  };

  env.PKG_CONFIG_DBUS_1_SESSION_BUS_SERVICES_DIR = "${placeholder "out"}/share/dbus-1/services";

  nativeBuildInputs = [
    meson
    ninja
    pkg-config
    rustc
    cargo
    rustPlatform.cargoSetupHook
  ];

  buildInputs = [
    systemd
    dbus
  ];
})
