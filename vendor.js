// Use LANG environment variable to choose locale
pref("intl.locale.matchOS", true);

// Disable application updates
pref("app.update.auto", false);
pref("app.update.enabled", false);

// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);

// Disable OpenH264 Decoder
pref("media.gmp-gmpopenh264.enabled", false);

// Don't disable our bundled extensions in the application directory
pref("extensions.autoDisableScopes", 11);
pref("extensions.shownSelectionUI", true);
