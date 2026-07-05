{
  flake.nixosModules.shell-programs = {
    pkgs,
    lib,
    ...
  }: let
    extracted = pkgs.fetchzip {
      url = "https://nightly.link/Eugeny/tabby/workflows/build/master/Linux%20AppImage%20%28amd64%29.zip";
      sha256 = "sha256-t4KYxYlWWMdd4gDPkuinzEfnfXvetCTRhKeU1niuPTE=";
    };

    src = "${extracted}/${
      builtins.head (builtins.attrNames (builtins.readDir extracted))
    }";

    extractedApp = pkgs.appimageTools.extractType2 {
      inherit src;
      pname = "tabby";
      version = "nightly";
    };

    tabby = pkgs.appimageTools.wrapType2 {
      inherit src;
      pname = "tabby";
      version = "nightly";

      meta = with lib; {
        description = "Tabby terminal";
        homepage = "https://tabby.sh";
        mainProgram = "tabby";
        platforms = platforms.linux;
      };

      extraInstallCommands = ''
        find ${extractedApp}

        install -Dm644 \
          ${extractedApp}/tabby.desktop \
          $out/share/applications/tabby.desktop

        install -Dm644 \
          ${extractedApp}/usr/share/icons/hicolor/512x512/apps/tabby.png \
          $out/share/icons/hicolor/512x512/apps/tabby.png

        substituteInPlace $out/share/applications/tabby.desktop \
          --replace-fail 'Exec=AppRun' 'Exec=tabby'
      '';
    };
  in {
    environment.systemPackages = [
      tabby
    ];
  };
}
