{
  rustPlatform,
  fetchFromGitHub,
  lm_sensors,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "vpower";
  version = "1.5.7";

  src = fetchFromGitHub {
    owner = "Jovian-Experiments";
    repo = "vpower";
    tag = finalAttrs.version;
    hash = "sha256-GmDyi/PSuxWsCAs3mVCBJu/6dEzTlkgGKXzBe4r+xvk=";
  };

  postPatch = ''
    substituteInPlace vpower.service \
      --replace-fail /usr/lib/vpower $out/bin/vpower
  '';

  cargoHash = "sha256-mk02dEOYY1FWOU/77UomxZH6s6NZieO6j8v7/MXV6MQ=";

  buildInputs = [
    lm_sensors
  ];

  postInstall = ''
    install -Dm644 vpower.service "$out/lib/systemd/system/vpower.service"
  '';
})
