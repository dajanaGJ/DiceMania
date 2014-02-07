/****************************** WINDOWS ******************************/
function getRealRootWindow() {
    return Components.classes["@mozilla.org/appshell/window-mediator;1"]
        .getService(Components.interfaces.nsIWindowMediator)
        .getMostRecentWindow("root");
}

/** Quit the application */
function quitApp() {
    var appStartup = Components.classes["@mozilla.org/toolkit/app-startup;1"]
        .getService(Components.interfaces.nsIAppStartup);
    appStartup.quit(Components.interfaces.nsIAppStartup.eAttemptQuit);
}

/** Restart application*/
function restartApp() {
    /*	var time = (currentTime() / 1000) - 5;
     prefs.setCharPref("general.last_program_running_time", '' + time);
     */
    var appStartup = Components.classes["@mozilla.org/toolkit/app-startup;1"]
        .getService(Components.interfaces.nsIAppStartup);
    appStartup.quit(Components.interfaces.nsIAppStartup.eRestart |
        Components.interfaces.nsIAppStartup.eAttemptQuit);
}