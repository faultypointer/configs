{
    pkgs,
    inputs,
    lib,
    ...
}: {
    programs.firefox = {
	enable = true;
	package = pkgs.wrapFirefox pkgs.firefox-beta-unwrapped {
	    extraPolicies = {
		CaptivePortal = false;
		DisableFirefoxStudies = true;
		DisablePocket = true;
		DisableTelemetry = true;
		DisableFirefoxAccounts = false;
		NoDefaultBookmarks = true;
		OfferToSaveLogins = false;
		OfferToSaveLoginsDefault = false;
		PasswordManagerEnabled = false;
		FirefoxHome = {
		    Search = true;
		    Pocket = false;
		    Snippets = false;
		    TopSites = false;
		    Highlights = false;
		};
		UserMessaging = {
		    ExtensionRecommendations = false;
		    SkipOnboarding = true;
		};
	    };
	};

	profiles = {
	    default = {
		id = 0;
		name = "faultypointer";
		isDefault = true;

		extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
			ublock-origin
			bitwarden
			duckduckgo-privacy-essentials
			sidebery
			sponsorblock
			i-dont-care-about-cookies
			adaptive-tab-bar-colour
		];

		# http://kb.mozillazine.org/Category:Preferences
		settings = {
		    "browser.search.defaultenginename" = "duckduckgo";
		    "browser.shell.checkDefaultBrowser" = false;
		    "browser.shell.defaultBrowserCheckCount" = 1;
		    "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
		    "widget.use-xdg-desktop-portal.file-picker" = 1;
		    "widget.use-xdg-desktop-portal.mime-handler" = 1;
		    "browser.search.suggest.enabled" = false;
		    "browser.search.suggest.enabled.private" = false;
		    "browser.urlbar.suggest.searches" = false;
		    "browser.urlbar.showSearchSuggestionsFirst" = false;
		    "browser.sessionstore.enabled" = true;
		    "browser.sessionstore.resume_from_crash" = true;
		    "browser.sessionstore.resume_session_once" = true;
		    "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
		    "browser.tabs.drawInTitlebar" = true;
		    "svg.context-properties.content.enabled" = true;
		    "general.smoothScroll" = true;
		    "uc.tweak.hide-tabs-bar" = true;
		    "uc.tweak.hide-forward-button" = true;
		    "uc.tweak.rounded-corners" = true;
		    "uc.tweak.floating-tabs" = true;
		    "layout.css.color-mix.enabled" = true;
		    "layout.css.light-dark.enabled" = true;
		    "layout.css.has-selector.enabled" = true;
		    "media.ffmpeg.vaapi.enabled" = true;
		    "media.rdd-vpx.enabled" = true;
		    "browser.tabs.tabmanager.enabled" = false;
		    "full-screen-api.ignore-widgets" = false;
		    "browser.urlbar.suggest.engines" = false;
		    "browser.urlbar.suggest.openpage" = false;
		    "browser.urlbar.suggest.bookmark" = false;
		    "browser.urlbar.suggest.addons" = false;
		    "browser.urlbar.suggest.pocket" = false;
		    "browser.urlbar.suggest.topsites" = false;
		};

		userChrome = (builtins.readFile ./userChrome.css);
		userContent =(builtins.readFile ./userContent.css);

	    };

	};

    };
}
