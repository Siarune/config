{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    profiles.sia = {
      isDefault = true;

      settings = {
        "browser.ctrlTab.sortByRecentlyUsed" = true;
        "identity.fxaccounts.enabled" = true;
        "privacy.clearOnShutdown.history" = false;
        "privacy.clearOnShutdown.downloads" = false;
        "widget.use-xdg-desktop-portal.file-picker" = 1;

        ##Firefox UI Fix

        # userchrome.css usercontent.css activate
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

        # Fill SVG Color
        "svg.context-properties.content.enabled" = true;

        # Restore Compact Mode - 89 Above
        "browser.compactmode.show" = true;

        # about:home Search Bar - 89 Above
        "browser.newtabpage.activity-stream.improvesearch.handoffToAwesomebar" = false;

        # CSS's `:has()` selector #457 - 103 Above
        "layout.css.has-selector.enabled" = true;

        "userChrome.theme.non_native_menu" = true; # Native qt menu bar to follow theme
        "userChrome.tab.connect_to_window" = false; # Original, Photon
        "userChrome.tab.color_like_toolbar" = false; # Original, Photon
        "userChrome.tab.lepton_like_padding" = false; # Original
        "userChrome.tab.photon_like_padding" = false; # Photon
        "userChrome.tab.dynamic_separator" = true; # Original, Proton
        "userChrome.tab.static_separator" = false; # Photon
        "userChrome.tab.static_separator.selected_accent" = false; # Just option
        "userChrome.tab.bar_separator" = false; # Just option
        "userChrome.tab.newtab_button_like_tab" = false; # Original
        "userChrome.tab.newtab_button_smaller" = false; # Photon
        "userChrome.tab.newtab_button_proton" = true; # Proton

        "userChrome.icon.panel_full" = true; # Original, Proton
        "userChrome.icon.panel_photon" = false; # Photon

        # Original Only
        "userChrome.tab.box_shadow" = false;
        "userChrome.tab.bottom_rounded_corner" = false;
        # Photon Only
        "userChrome.tab.photon_like_contextline" = false;
        "userChrome.rounding.square_tab" = false;

        # == Theme Default Settings ===================================================
        # -- User Chrome --------------------------------------------------------------
        "userChrome.compatibility.theme" = true;
        "userChrome.compatibility.os" = true;

        "userChrome.theme.built_in_contrast" = true;
        "userChrome.theme.system_default" = true;
        "userChrome.theme.proton_color" = true;
        "userChrome.theme.proton_chrome" = true; # Need proton_color
        "userChrome.theme.fully_color" = true; # Need proton_color
        "userChrome.theme.fully_dark" = true; # Need proton_color

        "userChrome.decoration.cursor" = true;
        "userChrome.decoration.field_border" = true;
        "userChrome.decoration.download_panel" = true;
        "userChrome.decoration.animate" = true;

        "userChrome.padding.tabbar_width" = true;
        "userChrome.padding.tabbar_height" = true;
        "userChrome.padding.toolbar_button" = true;
        "userChrome.padding.navbar_width" = true;
        "userChrome.padding.urlbar" = true;
        "userChrome.padding.bookmarkbar" = true;
        "userChrome.padding.infobar" = true;
        "userChrome.padding.menu" = true;
        "userChrome.padding.bookmark_menu" = true;
        "userChrome.padding.global_menubar" = true;
        "userChrome.padding.panel" = true;
        "userChrome.padding.popup_panel" = true;

        "userChrome.tab.multi_selected" = true;
        "userChrome.tab.unloaded" = true;
        "userChrome.tab.letters_cleary" = true;
        "userChrome.tab.close_button_at_hover" = true;
        "userChrome.tab.sound_hide_label" = true;
        "userChrome.tab.sound_with_favicons" = true;
        "userChrome.tab.pip" = true;
        "userChrome.tab.container" = true;
        "userChrome.tab.crashed" = true;

        "userChrome.fullscreen.overlap" = true;
        "userChrome.fullscreen.show_bookmarkbar" = true;

        "userChrome.icon.library" = true;
        "userChrome.icon.panel" = true;
        "userChrome.icon.menu" = true;
        "userChrome.icon.context_menu" = true;
        "userChrome.icon.global_menu" = true;
        "userChrome.icon.global_menubar" = true;
        "userChrome.icon.1-25px_stroke" = true;

        # -- User Content -------------------------------------------------------------
        "userContent.player.ui" = true;
        "userContent.player.icon" = true;
        "userContent.player.noaudio" = true;
        "userContent.player.size" = true;
        "userContent.player.click_to_play" = true;
        "userContent.player.animate" = true;

        "userContent.newTab.full_icon" = true;
        "userContent.newTab.animate" = true;
        "userContent.newTab.pocket_to_last" = true;
        "userContent.newTab.searchbar" = true;

        "userContent.page.field_border" = true;
        "userContent.page.illustration" = true;
        "userContent.page.proton_color" = true;
        "userContent.page.dark_mode" = true; # Need proton_color
        "userContent.page.proton" = true; # Need proton_color

        # ** Useful Options ***********************************************************
        # Tab preview
        # https:#blog.nightly.mozilla.org/2024/02/06/a-preview-of-tab-previews-these-weeks-in-firefox-issue-153/
        "browser.tabs.cardPreview.enabled" = true;

        # Paste suggestion at urlbar
        # https:#blog.nightly.mozilla.org/2023/12/04/url-gonna-want-to-check-this-out-these-weeks-in-firefox-issue-150/
        "browser.urlbar.clipboard.featureGate" = true;
      };

      search.default = "Qwant";
      search.privateDefault = "Qwant";
      search.force = true;
      search.engines = {

        "Nix Packages" = {
          urls = [
            {
              template = "https:#search.nixos.org/packages";
              params = [
                {
                  name = "type";
                  value = "packages";
                }
                {
                  name = "query";
                  value = "{searchTerms}";
                }
              ];
            }
          ];

          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@np" ];
        };

        "Nix Options" = {
          urls = [
            {
              template = "https:#search.nixos.org/options";
              params = [
                {
                  name = "type";
                  value = "packages";
                }
                {
                  name = "query";
                  value = "{searchTerms}";
                }
              ];
            }
          ];

          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@no" ];
        };

        "Qwant" = {
          urls = [
            {
              template = "https:#qwant.com";
              params = [
                {
                  name = "q";
                  value = "{searchTerms}";
                }
                {
                  name = "t";
                  value = "web";
                }
              ];
            }
          ];

          # 			icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@qw" ];
        };
      };
    };

    policies = {
      #Peskyfox
      "extensions.getAddons.showPane" = false;
      "extensions.htmlaboutaddons.recommendations.enabled" = false;
      "browser.discovery.enabled" = false;
      "extensions.pocket.enabled" = false;
      "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
      "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
      "browser.newtabpage.activity-stream.feeds.topsites" = false;
      "browser.newtabpage.activity-stream.feeds.section.topstories" = false;

      "browser.shell.checkDefaultBrowser" = false;
      "browser.preferences.moreFromMozilla" = false;
      "browser.aboutConfig.showWarning" = false;
      "browser.aboutwelcome.enabled" = false;
      "browser.tabs.tabmanager.enabled" = false;
      # 		"browser.profiles.enabled" = true;

      "cookiebanners.service.mode" = 1;
      "cookiebanners.service.mode.privateBrowsing" = 1;

      "browser.urlbar.suggest.engines" = false;
      "browser.urlbar.suggest.calculator" = true;
      "browser.urlbar.unitConversion.enabled" = true;
      "browser.urlbar.trending.featureGate" = false;
      "browser.download.open_pdf_attachments_inline" = true;
      "layout.word_select.eat_space_to_next_word" = false;

      #Fastfox
      "gfx.canvas.accelerated.cache-items" = 4096;
      "gfx.canvas.accelerated.cache-size" = 512;
      "gfx.content.skia-font-cache-size" = 20;
      "browser.cache.jsbc_compression_level" = 3;
      "media.memory_cache_max_size" = 65536;
      "media.cache_readahead_limit" = 7200;
      "media.cache_resume_threshold" = 3600;
      "image.mem.decode_bytes_at_a_time" = 32768;
      "network.http.max-connections" = 1800;
      "network.http.max-persistent-connections-per-server" = 10;
      "network.http.max-urgent-start-excessive-connections-per-host" = 5;
      "network.http.pacing.requests.enabled" = false;
      "network.ssl_tokens_cache_capacity" = 10240;
      "network.dns.disablePrefetch" = true;
      "network.dns.disablePrefetchFromHTTPS" = true;
      "network.prefetch-next" = true;
      "network.predictor.enabled" = false;

      #Securefox
      "browser.contentblocking.category" = "strict";
      "urlclassifier.trackingSkipURLs" = "*.reddit.com, *.twitter.com, *.twimg.com, *.tiktok.com";
      "urlclassifier.features.socialtracking.skipURLs" = "*.instagram.com, *.twitter.com, *.twimg.com";
      "network.cookie.sameSite.noneRequiresSecure" = true;
      "browser.download.start_downloads_in_tmp_dir" = true;
      "browser.helperApps.deleteTempFileOnExit" = true;
      "browser.uitour.enabled" = false;
      "privacy.globalprivacycontrol.enabled" = true;
      "security.OCSP.enabled" = 0;
      "security.remote_settings.crlite_filters.enabled" = true;
      "security.pki.crlite_mode" = 2;
      "security.ssl.treat_unsafe_negotiation_as_broken" = true;
      "browser.xul.error_pages.expert_bad_cert" = true;
      "security.tls.enable_0rtt_data" = false;
      "browser.privatebrowsing.forceMediaMemoryCache" = true;
      "browser.sessionstore.interval" = 60000;
      # 		"privacy.history.custom" = true;
      "browser.urlbar.trimHttps" = true;
      "browser.urlbar.untrimOnUserInteraction.featureGate" = true;
      "security.insecure_connection_text.enabled" = true;
      "security.insecure_connection_text.pbmode.enabled" = true;
      # 		"browser.search.separatePrivateDefault.ui.enabled" = true;
      "browser.urlbar.update2.engineAliasRefresh" = true;
      "browser.search.suggest.enabled" = false;
      "browser.urlbar.suggest.searches" = false;
      "browser.urlbar.quicksuggest.enabled" = false;
      "browser.urlbar.suggest.quicksuggest.sponsored" = false;
      "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
      "browser.urlbar.groupLabels.enabled" = false;
      "browser.formfill.enable" = false;
      "network.IDN_show_punycode" = true;
      "dom.security.https_first" = true;
      "dom.security.https_only_mode_error_page_user_suggestions" = true;
      # 		"network.trr.mode" = 3;
      # 		"network.trr.uri" = "https:#xxxx/dns-query";
      "signon.formlessCapture.enabled" = false;
      "signon.privateBrowsingCapture.enabled" = false;
      "network.auth.subresource-http-auth-allow" = 1;
      "editor.truncate_user_pastes" = false;
      # 		"security.mixed_content.block_display_content" = true;
      "pdfjs.enableScripting" = false;
      "extensions.postDownloadThirdPartyPrompt" = false;
      "network.http.referer.XOriginTrimmingPolicy" = 2;
      "privacy.userContext.ui.enabled" = true;
      "media.peerconnection.ice.proxy_only_if_behind_proxy" = true;
      "media.peerconnection.ice.default_address_only" = true;
      "permissions.default.desktop-notification" = 2;
      "permissions.default.geo" = 2;
      "webchannel.allowObject.urlWhitelist" = "";

      ExtensionSettings =
        with builtins;
        let
          extension = shortId: uuid: {
            name = uuid;
            value = {
              install_url = "https:#addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
              installation_mode = "normal_installed";
              #             ExtensionUpdate = false;
            };
          };
        in
        listToAttrs [
          (extension "bitwarden" "{446900e4-71c2-419f-a6a7-df9c091e268b}")
          (extension "catppuccin-mocha-lavender-git" "{8446b178-c865-4f5c-8ccc-1d7887811ae3}")
          (extension "clearurls" "{74145f27-f039-47ce-a470-a662b129930a}")
          (extension "darkreader" "addon@darkreader.org")
          (extension "languagetool" "languagetool-webextension@languagetool.org")
          (extension "tampermonkey" "firefox@tampermonkey.net")
          (extension "ublock-origin" "uBlock0@raymondhill.net")
          #           (extension "keepassxc-browser" "keepassxc-browser@keepassxc.org")
        ];
    };
  };
}
