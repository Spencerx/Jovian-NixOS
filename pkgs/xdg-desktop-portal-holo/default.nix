{
  stdenv,
  fetchFromGitHub,
  meson,
  ninja,
  pkg-config,
  glib,
  dbus,
  fontconfig,
  systemd,
  xdg-desktop-portal,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "xdg-desktop-portal-holo";
  version = "0.1.10.0ae41c9";

  src = fetchFromGitHub {
    owner = "Jovian-Experiments";
    repo = "xdg-desktop-portal-holo";
    rev = "0ae41c9ee1e237e68d69cc92017e6a33f5323b5f";
    hash = "sha256-TufBacq2tCpaiG/EZ1T6Yz7H4w5WOxbyq08VKSiL6lw=";
  };

  strictDeps = true;

  nativeBuildInputs = [
    meson
    ninja
    pkg-config
    glib
  ];

  buildInputs = [
    dbus
    fontconfig
    glib
    systemd
    xdg-desktop-portal
  ];
})
