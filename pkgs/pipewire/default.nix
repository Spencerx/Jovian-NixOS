{ pipewire', fetchFromGitHub }:
pipewire'.overrideAttrs (_: {
  version = "1.6.4-1.8";

  src = fetchFromGitHub {
    owner = "Jovian-Experiments";
    repo = "pipewire";
    rev = "1.6.4-jupiter1.8";
    hash = "sha256-aj4L84Fz4PB+sSjHvrGUT6EOm/JmlERhNVRw5HFxMUA=";
  };
})
