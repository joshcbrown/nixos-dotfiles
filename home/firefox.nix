{
  programs.firefox = {
    enable = true;
    profiles.default = {
      name = "default";
      isDefault = true;

      userChrome = ''
        /* Hide tab bar when only one tab is open */
        #tabbrowser-tabs {
          visibility: collapse !important;
        }

        /* Hide the titlebar */
        #titlebar {
          display: none !important;
        }

        #nav-bar {
          padding-top: 0px !important;
          padding-bottom: 0px !important;
          height: 32px !important;
        }

        .bookmark-item > .toolbarbutton-text {
          display: none !important;
        }


        #urlbar {
          border-radius: 8px !important;
          border: none !important;
        }
      '';

      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };
    };
  };
}
