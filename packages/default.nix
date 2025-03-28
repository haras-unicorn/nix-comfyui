{ callPackage, comfyui-frontend, comfyui-frontend-package }:

{
  check-pkgs =
    callPackage ./check-pkgs { };

  comfyui =
    callPackage ./comfyui {
      bwrapArgs = [ ];
      commandLineArgs = [ ];
      extensions = [ ];
      frontend = comfyui-frontend;
      prepopulatedStateFiles = [ ];
      stateDirs = [ ];
    };

  comfyui-frontend =
    callPackage ./comfyui-frontend { };

  comfyui-frontend-package =
    callPackage ./comfyui-frontend-package {
      frontend = comfyui-frontend;
    };

  comfyui-unwrapped =
    callPackage ./comfyui-unwrapped {
      frontend-package = comfyui-frontend-package;
    };

  krita-ai-diffusion =
    callPackage ./krita-ai-diffusion { };
}
