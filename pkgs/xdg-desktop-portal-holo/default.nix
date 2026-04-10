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
  version = "0.1.18.5ad92bf";

  src = fetchFromGitHub {
    owner = "Jovian-Experiments";
    repo = "xdg-desktop-portal-holo";
    rev = "5ad92bfab460cd8ea536831789c43590b3a7a71c";
    hash = "sha256-p5JXH6uR6XQW8B45M+ndAqHLXBWSbQrWzfaSWeZhT90=";
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
