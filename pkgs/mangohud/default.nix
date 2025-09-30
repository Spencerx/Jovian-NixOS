{ mangohud', fetchFromGitHub }:
mangohud'.overrideAttrs {
  version = "0.8.1.r103";

  src = fetchFromGitHub {
    owner = "flightlessmango";
    repo = "mangohud";
    rev = "10479eb59aa6c1c92af9d2afca3e33c5a17d875b";
    hash = "sha256-9mylciDKXCYXHvAWco8ALLOeojGF5/h8Lp+c1dQfINg=";
  };
}
