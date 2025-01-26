{ buildExtension, fetchFromGitHub, lib }:

buildExtension {
  name = "pythongosssss-custom-scripts";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "pythongosssss";
    repo = "ComfyUI-Custom-Scripts";
    fetchSubmodules = false;
    rev = "bc8922deff73f59311c05cef27b9d4caaf43e87b";
    hash = "sha256-mGpH2U4HLhORo6SdG6D6s0/NG3qhq4RZnLDNxDc5Aq0=";
  };

  meta = {
    license = lib.licenses.mit;
  };
}
