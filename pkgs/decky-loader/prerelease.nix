{
  decky-loader,
  fetchFromGitHub,
  pnpm_9,
}:
decky-loader.overridePythonAttrs rec {
  pname = "decky-loader";
  version = "3.2.2-pre1";

  src = fetchFromGitHub {
    owner = "SteamDeckHomebrew";
    repo = "decky-loader";
    rev = "v${version}";
    hash = "sha256-0K4cs7Gk1gkWJB8lUYmKRmQZ9GklTJCjxAq0dsSuUrM=";
  };

  pnpmDeps = pnpm_9.fetchDeps {
    fetcherVersion = 3;
    inherit pname version src;
    sourceRoot = "${src.name}/frontend";
    hash = "sha256-iEkms4lGJo9Mryh1ruJ3Fz1TMVCoN0adHx9rYdnelmg=";
  };
}
