{ config, pkgs, ... }:

with pkgs; {
  env = {
    LD_LIBRARY_PATH = "${config.devenv.profile}/lib";
  };

  packages = [
    git
    libyaml
    sqlite-interactive
  ];

  languages.ruby.enable = true;
  languages.ruby.versionFile = ./.ruby-version;
}
