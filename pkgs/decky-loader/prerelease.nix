{
  decky-loader,
  fetchFromGitHub,
  fetchPnpmDeps,
  pnpm_9,
}:
decky-loader.overridePythonAttrs rec {
  pname = "decky-loader";
  version = "3.2.2-pre3";

  src = fetchFromGitHub {
    owner = "SteamDeckHomebrew";
    repo = "decky-loader";
    rev = "v${version}";
    hash = "sha256-P3ac+JN0+l6g/5idFVEbxgtfTk9hsXeWHLaOFZMCy4c=";
  };

  pnpmDeps = fetchPnpmDeps {
    fetcherVersion = 3;
    inherit pname version src;
    pnpm = pnpm_9;
    sourceRoot = "${src.name}/frontend";
    hash = "sha256-jSjt1XgYweg2lgWgyHadQ8/fzXnYWbnXvtH4gG6GgDU=";
  };
}
