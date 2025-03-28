{ buildNpmPackage, fetchFromGitHub }:

buildNpmPackage {
  name = "comfyui-frontend";
  version = "1.15.4";

  src = fetchFromGitHub {
    owner = "Comfy-Org";
    repo = "ComfyUI_frontend";
    fetchSubmodules = false;
    rev = "0752e8b98675e0f9fea02f6ab0e9c0154deb54fe";
    hash = "sha256-KHiVrK3RzIbPyy2YbttLXBacQD0SF5K01eols6CzrqA=";
  };

  npmDepsHash = "sha256-PvmaiavUjlKXqnPC9gTY+5kHk0z4zc6Pe456Cf+qpfY=";

  installPhase = ''
    runHook preInstall

    mkdir --parents $out/share/comfyui
    cp --archive dist $out/share/comfyui/web

    runHook postInstall
  '';
}
