{ config, pkgs, ... }:

with pkgs; {
  env = {
    LD_LIBRARY_PATH = "${config.devenv.profile}/lib";
  };

  packages = [
    git
    libyaml
    sqlite-interactive
    vips
    imagemagick
    ffmpeg
    openssl
    poppler
    poppler_utils
  ];

  languages.ruby.enable = true;
  languages.ruby.versionFile = ./.ruby-version;
}
