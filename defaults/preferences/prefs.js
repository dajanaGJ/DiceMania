//pref("toolkit.defaultChromeURI", "chrome://application/content/angular/index.html");
pref("toolkit.defaultChromeURI", "chrome://application/content/index.xul");
pref("toolkit.defaultChromeFeatures", "chrome,centerscreen,resizable=1,dialog=no");

pref("toolkit.singletonWindowType", "root");

pref("network.http.use-cache", false);

// Enable jit (traceMonkey) for content and chrome
pref("javascript.options.jit.content", true);
pref("javascript.options.jit.chrome", true);

pref("intl.locale.matchOS", false);
pref("general.useragent.locale", "en");

//Project
pref("general.project", "application");

pref("gfx.canvas.azure.enabled", false);

// External
pref("network.protocol-handler.warn-external.http", false);
pref("network.protocol-handler.warn-external.https", false);

// Force websockets
pref("network.websocket.enabled", true);
pref("network.websocket.override-security-block", true);


//------------------------------------------------------------
// EXTENSIONS
pref("extensions.showMismatchUI", false);
pref("extensions.blocklist.url", "");
pref("extensions.getAddons.cache.enabled", true);
