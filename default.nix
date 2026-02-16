{ config, lib, ... }: {
options.apps.neovim.enable = lib.mkEnableOption "Neovim";

config = lib.mkIf config.apps.neovim.enable {

    home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink ../nvim;

};}
