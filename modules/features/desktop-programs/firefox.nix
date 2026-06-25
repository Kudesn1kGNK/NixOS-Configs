{
  flake.nixosModules.desktop-programs = {...}: {
    programs.firefox = {
      enable = true;

      languagePacks = ["en-US" "ru"];

      preferences = {
        "privacy.resistFingerprinting" = true;
      };

      policies = {
        AppAutoUpdate = false;
        BackgroundAppUpdate = false;

        # Feature Disabling
        DisableFirefoxStudies = true;
        DisableFirefoxAccounts = true;
        DisableFirefoxScreenshots = true;
        DisableForgetButton = true;
        DisableMasterPasswordCreation = true;
        DisableProfileImport = true;
        DisableProfileRefresh = true;
        DisableSetDesktopBackground = true;
        DisablePocket = true;
        DisableTelemetry = true;
        DisableFormHistory = true;
        DisablePasswordReveal = true;

        BlockAboutConfig = false;
        BlockAboutProfiles = true;
        BlockAboutSupport = true;

        DisplayMenuBar = "never";
        DontCheckDefaultBrowser = true;
        HardwareAcceleration = false;
        OfferToSaveLogins = false;

        # Extensions
        ExtensionSettings = let
          moz = short: "https://addons.mozilla.org/firefox/downloads/latest/${short}/latest.xpi";
        in {
          "*".installation_mode = "blocked";

          "uBlock0@raymondhill.net" = {
            install_url = moz "ublock-origin";
            installation_mode = "force_installed";
            updates_disabled = true;
          };
        };
      };
    };
  };
}
