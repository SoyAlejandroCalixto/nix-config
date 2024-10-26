{ ... }:
{
  boot.extraModprobeConfig = ''
    options nvidia_drm modeset=1 fbdev=1
  '';
}