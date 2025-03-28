{ fetchFromGitHub, lib, python3, frontend }:

let
  src = fetchFromGitHub {
    owner = "Comfy-Org";
    repo = "ComfyUI_frontend";
    fetchSubmodules = false;
    rev = "0752e8b98675e0f9fea02f6ab0e9c0154deb54fe";
    hash = "sha256-KHiVrK3RzIbPyy2YbttLXBacQD0SF5K01eols6CzrqA=";
  };
in
python3.pkgs.buildPythonPackage {
  pname = "comfyui-frontend-package";
  version = "1.14.5";

  format = "setuptools";

  src = "${src}/comfyui_frontend_package";

  postPatch = ''
    cp -r ${frontend}/share/comfyui/web ./comfyui_frontend_package/static
  '';

  meta = {
    license = lib.licenses.gpl3;
  };
}
