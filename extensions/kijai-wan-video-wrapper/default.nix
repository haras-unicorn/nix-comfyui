{ buildExtension, fetchFromGitHub, lib, python3 }:

buildExtension {
  name = "kijai-wan-video-wrapper";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "kijai";
    repo = "ComfyUI-WanVideoWrapper";
    fetchSubmodules = false;
    rev = "8fbf92ae93019c442c7d2c5e018e1a609569a494";
    hash = "sha256-rj4Q4zd5E+GbOvBNzBXMmF6wNm/6NRn5o4+DKlo1UKc=";
  };

  propagatedBuildInputs = [
    python3.pkgs.ftfy
    python3.pkgs.accelerate
    python3.pkgs.einops
    python3.pkgs.diffusers
    python3.pkgs.sentencepiece
    python3.pkgs.protobuf
  ];

  meta = {
    license = lib.licenses.asl20;
  };
}
