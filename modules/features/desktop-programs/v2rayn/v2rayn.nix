{
  flake.nixosModules.desktop-programs = {
    pkgs,
    config,
    ...
  }: let
    user = config.preferences.user.name;

    xray = rec {
      version = "25.9.11";
      drv = pkgs.stdenvNoCC.mkDerivation {
        pname = "xray-bin";
        inherit version;

        src = pkgs.fetchzip {
          url = "https://github.com/XTLS/Xray-core/releases/download/v${version}/Xray-linux-64.zip";
          hash = "sha256-AXGQlTdmqarRClDC66ZfXRB/V1fnMoAbc/fLUOWuUCc=";
          stripRoot = false;
        };

        installPhase = ''
          mkdir -p $out
          cp xray $out/
        '';
      };
    };

    singBox = rec {
      version = "1.13.13";
      drv = pkgs.stdenvNoCC.mkDerivation {
        pname = "sing-box-bin";
        inherit version;

        src = pkgs.fetchurl {
          url = "https://github.com/SagerNet/sing-box/releases/download/v${version}/sing-box-${version}-linux-amd64.tar.gz";
          hash = "sha256-u5nKv0dpRiXbQh7heJjzbNwfnCy13s9lsSusjYQ36EI=";
        };

        installPhase = ''
          mkdir -p $out
          cp sing-box $out/
        '';
      };
    };

    v2raynConfigs = rec {
      mkFiles = dir:
        builtins.listToAttrs (
          builtins.map (f: {
            name = ".local/share/v2rayN/${dir}/${f}";
            value.source = "${drv}/${dir}/${f}";
          }) (builtins.attrNames (builtins.readDir (./configs + "/${dir}")))
        );
      drv = pkgs.stdenvNoCC.mkDerivation {
        pname = "v2rayn-configs";
        version = "1.0";

        src = ./configs;

        installPhase = ''
          mkdir -p $out/guiConfigs
          cp -r guiConfigs/* $out/guiConfigs/
        '';
      };
    };
  in {
    home-manager.users.${user}.home.file =
      {
        ".local/share/v2rayN/bin/xray/xray".source = "${xray.drv}/xray";

        ".local/share/v2rayN/bin/sing_box/sing-box".source = "${singBox.drv}/sing-box";
      }
      // v2raynConfigs.mkFiles "guiConfigs";

    environment.systemPackages = with pkgs; [
      v2rayn
    ];
  };
}
