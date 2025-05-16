{
  rustPlatform,
  fetchFromGitHub,
  replaceVars,
  jupiter-hw-support,
  jovian-stubs,
  steamos-polkit-helpers,
  steamdeck-firmware,
  jupiter-dock-updater-bin,
  iwd,
  trace-cmd,
  iw,
  pkg-config,
  udev,
}:
rustPlatform.buildRustPackage rec {
  pname = "steamos-manager";
  version = "25.5.1";

  src = fetchFromGitHub {
    owner = "Jovian-Experiments";
    repo = "steamos-manager";
    rev = "v${version}";
    hash = "sha256-agIo9XxrFjrG6hsezaAYx2v4BtfX1Nzmm5FcBXAnTGA=";
  };

  cargoHash = "sha256-F0KhdviwpoNqygoUqqb/f7oKgB7vADsqPztAoyZie6k=";

  # tests assume Steam Deck hardware and FHS paths
  doCheck = false;

  patches = [ 
    (replaceVars ./hardcode-paths.patch
    {
      stubs = jovian-stubs;
      steamDeckFirmware = steamdeck-firmware;
      jupiterDockUpdaterBin = jupiter-dock-updater-bin;
      hwsupport = jupiter-hw-support;
      polkitHelpers = steamos-polkit-helpers;
      iwd = iwd;
      traceCmd = trace-cmd;
      iw = iw;
      out = null;
    })
    # FIXME: build steamos-log-submitter and reenable this maybe?
    ./disable-ftrace.patch
  ];

  postPatch = ''
    substituteInPlace \
      src/daemon/{root,user}.rs \
      src/platform.rs \
      data/*/*.service \
      --replace-fail "@out@" "$out"
  '';

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ udev ];

  installPhase = ''
    runHook preInstall

    make DESTDIR=$out install
    mv $out/usr/* $out/
    rm -r $out/usr/

    runHook postInstall
  '';
}