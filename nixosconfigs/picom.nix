{ config, pkgs, lib, options,  ... }:
{
  services.picom = {
    enable = true;
    shadow = false;
    backend = "glx";
    fade = true;
    fadeDelta = 5;
    # menuOpacity = 0.7;
    opacityRules = [
      "80:class_g = 'kitty'"
      "70:class_g = 'alacritty'"
    ];
    settings.blur =
    { method = "gaussian";
      size = 10;
      deviation = 3.0;
    };   
  };
}
