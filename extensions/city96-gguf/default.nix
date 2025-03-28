{ buildExtension, fetchFromGitHub, lib, python3 }:

buildExtension {
  name = "city96-gguf";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "city96";
    repo = "ComfyUI-GGUF";
    fetchSubmodules = false;
    rev = "bc5223b0e37e053dbec2ea5e5f52c2fd4b8f712a";
    hash = "sha256-wxOBFyxLkeJqDI5DuvqDP4MONCsipKyS5qx8PiEfmI0=";
  };

  propagatedBuildInputs = [
    python3.pkgs.gguf
    python3.pkgs.safetensors
    python3.pkgs.torch
    python3.pkgs.protobuf
    python3.pkgs.sentencepiece
    python3.pkgs.tqdm
  ];

  meta = {
    license = lib.licenses.asl20;
  };
}
