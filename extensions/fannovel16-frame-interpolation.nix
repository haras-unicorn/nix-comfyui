{ buildExtension, fetchFromGitHub, lib, python3 }:

buildExtension {
  name = "fannovel16-frame-interpolation";

  src = fetchFromGitHub {
    owner = "Fannovel16";
    repo = "ComfyUI-Frame-Interpolation";
    fetchSubmodules = false;
    rev = "483dfe64465369e077d351ed2f1acbf7dc046864";
    hash = "sha256-EyuWpnuGhlfq0Y51BJEvcF8grOhTT+RuItPouwS7cAI=";
  };

  propagatedBuildInputs = [
    python3.pkgs.cupy-cuda12x
    python3.pkgs.einops
    python3.pkgs.kornia
    python3.pkgs.numpy
    python3.pkgs.opencv-python
    python3.pkgs.packaging
    python3.pkgs.pillow
    python3.pkgs.pyyaml
    python3.pkgs.requests
    python3.pkgs.scipy
    python3.pkgs.torch
    python3.pkgs.torchvision
    python3.pkgs.tqdm
  ];

  prePatch = ''
    substituteInPlace vfi_utils.py \
      --replace-fail \
        'return os.path.abspath(os.path.join(os.path.dirname(__file__), config["ckpts_path"], model_type))' \
        'import folder_paths; return os.path.abspath(os.path.join(folder_paths.models_dir, "frame_interpolation", model_type))'

    find -type f -name "*.py" | while IFS= read -r filename; do
      substituteInPlace "$filename" \
        --replace-quiet \
          'CATEGORY = "ComfyUI-Frame-Interpolation' \
          'CATEGORY = "frame_interpolation'
    done
  '';

  passthru = {
    check-pkgs.ignoredModuleNames = [
      "^mysql(\\..+)?$"
      "^pyunpack$"
      "^taichi(\\..+)?$"
      "^vapoursynth$"
      "^vfi_models(\\..+)?$"
      "^vfi_utils$"
    ];
  };

  meta = {
    license = lib.licenses.mit;
  };
}
