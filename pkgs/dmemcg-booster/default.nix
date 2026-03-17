{
  rustPlatform,
  fetchFromGitLab,
  pkg-config,
  dbus,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "dmemcg-booster";
  version = "0.1.0";

  src = fetchFromGitLab {
    domain = "gitlab.steamos.cloud";
    owner = "holo";
    repo = "dmemcg-booster";
    tag = finalAttrs.version;
    hash = "sha256-ZEDctJF5+n45VrrscIbKT2ND0IKZvUSpZfC5ugraNhU=";
  };

  postPatch = ''
    substituteInPlace *.service \
      --replace-fail /usr/bin/dmemcg-booster $out/bin/dmemcg-booster
  '';

  cargoHash = "sha256-T0z191ssrkxJB/x3l6wvXJ70UMEmLBD9e2ZjNTBrk+Y=";

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    dbus
  ];

  postInstall = ''
    install -Dm644 dmemcg-booster-system.service "$out/lib/systemd/system/dmemcg-booster-system.service"
    install -Dm644 dmemcg-booster-user.service "$out/lib/systemd/user/dmemcg-booster-user.service"
  '';
})
