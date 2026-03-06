{
  stdenv,
  fetchFromGitLab,
  linuxConsoleTools,
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "inputattach-cec-units";
  version = "1";

  src = fetchFromGitLab {
    domain = "gitlab.steamos.cloud";
    owner = "holo";
    repo = "inputattach-cec-units";
    tag = "v${finalAttrs.version}";
    hash = "sha256-dLz+wZCqNP23Jg8cJH622SqlE7nb7tMkC+icYRHil8U=";
  };

  postPatch = ''
    substituteInPlace *.service \
      --replace-fail /usr/bin/inputattach ${linuxConsoleTools}/bin/inputattach
  '';

  dontBuild = true;

  installPhase = ''
    runHook preInstall

    install -d -m 755 $out/lib/udev/rules.d
    install -d -m 755 $out/lib/systemd/system

    install -m 644 60-inputattach-cec.rules $out/lib/udev/rules.d
    install -m 644 *.service $out/lib/systemd/system

    runHook postInstall
  '';
})
