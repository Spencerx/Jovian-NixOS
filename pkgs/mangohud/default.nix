{ mangohud', fetchFromGitHub, fetchpatch }:
mangohud'.overrideAttrs(old: {
  version = "0.8.1.r103";

  src = fetchFromGitHub {
    owner = "flightlessmango";
    repo = "mangohud";
    rev = "10479eb59aa6c1c92af9d2afca3e33c5a17d875b";
    hash = "sha256-9mylciDKXCYXHvAWco8ALLOeojGF5/h8Lp+c1dQfINg=";
  };

  # cherry-picked in jupiter-main
  patches = old.patches or [] ++ [
    (fetchpatch {
      url = "https://github.com/flightlessmango/MangoHud/commit/ff6e5954ea7e340d9bb4509754babf0db1b7c431.diff";
      hash = "sha256-PWMw0hOtUBzfezdDue3s4h+BNsNQvZmKbWLZfn9xO18=";
    })
  ];
})
