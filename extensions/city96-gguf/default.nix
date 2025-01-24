{ buildExtension, fetchFromGitHub, lib, python3 }:

buildExtension {
  name = "city96-gguf";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "city96";
    repo = "ComfyUI-GGUF";
    fetchSubmodules = false;
    rev = "5875c52f59baca3a9372d68c43a3775e21846fe0";
    hash = "sha256-3RqFfvXdn9sCIlctqa14c2fvluSmJCR+llfZo/MV64o=";
  };

  propagatedBuildInputs = [
    python3.pkgs.gguf
    python3.pkgs.numpy
    python3.pkgs.safetensors
    python3.pkgs.torch
    python3.pkgs.tqdm
  ];

  meta = {
    license = lib.licenses.asl20;
  };
}
