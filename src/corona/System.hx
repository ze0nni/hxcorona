package corona;

@:multiReturn extern class LuaEither<R> {
	var result(default, null) : R;
    var error(default, null) : String;
}

@:native("system") 
extern class System
{
	static var ApplicationSupportDirectory(default, null): DirectoryConstant;
	static var CachesDirectory(default, null): DirectoryConstant;
	static var DocumentsDirectory(default, null): DirectoryConstant;
	static var ResourceDirectory(default, null): DirectoryConstant;
	static var TemporaryDirectory(default, null): DirectoryConstant;
	
	//system.activate()
	//system.cancelNotification()
	//system.canOpenURL()
	//system.deactivate()
	//system.getIdleTimer()
	public static function getInfo<R>(property: SystemProperty<R>): R;
	//system.getInputDevices()
	@:native("getPreference") 
	public static function getPreference<N, R>(category: PreferenceCategory<N, R>, name: N): R;
	@:native("setPreferences") 
	public static function setPreferences(category: PreferenceCategory<String, String>, preferences: LuaTable<String, String>): Void;
	@:native("deletePreferences") 
	public static function deletePreferences(category: PreferenceCategory<String, String>, preferences: LuaTable<Int, String>): Void;
	//system.getTimer()
	//system.hasEventSource()
	//system.newEventDispatcher()
	//system.openURL()
	public static function pathForFile(name: String, ?baseDir: DirectoryConstant):String;
	//system.scheduleNotification()
	public static function setAccelerometerInterval(frequency: Float): Void;
	//system.setGyroscopeInterval()
	//system.setIdleTimer()
	//system.setLocationAccuracy()
	//system.setLocationThreshold()
	//system.setTapDelay()
	//system.vibrate()
}

@:enum abstract PreferenceCategory<P, R>(String) {
	var app: PreferenceCategory<String, String> = "app";
	var locale: PreferenceCategory<LocalePreference, String> = "locale";
	var ui: PreferenceCategory<UiPreference, String> = "ui";
}

@:enum abstract SystemProperty<R>(String) {
	var appName: SystemProperty<String> = "appName";
	var appVersionString: SystemProperty<String> = "appVersionString";
	var architectureInfo: SystemProperty<String> = "architectureInfo";//TODO: ArchitectureInfo as enum
	var build: SystemProperty<String> = "build";
	var bundleID: SystemProperty<String> = "bundleID";
	var deviceID: SystemProperty<String> = "deviceID";
	var environment: SystemProperty<SystemEnvironment> = "environment";
	
	var maxTextureSize: SystemProperty<Int> = "maxTextureSize";
	var textureMemoryUsed: SystemProperty<Int> = "textureMemoryUsed";
	
	var manufacturer: SystemProperty<String> = "manufacturer";
	
	var model: SystemProperty<String> = "model";
	var name: SystemProperty<String> = "name";
	
	var platform: SystemProperty<SystemPlatform> = "platform";
	var platformVersion: SystemProperty<String> = "platformVersion";
	
	var targetAppStore: SystemProperty<SystemTargetAppStore> = "targetAppStore";
	
	var androidApiLevel: SystemProperty<Int> = "androidApiLevel";
	var androidAppVersionCode: SystemProperty<Int> = "androidAppVersionCode";
	var androidAppPackageName: SystemProperty<String> = "androidAppPackageName";
	//androidGrantedAppPermissions
	//androidDeniedAppPermissions
	//grantedAppPermissions
	//deniedAppPermissions
	//androidDisplayApproximateDpi
	//androidDisplayDensityName
	//androidDisplayWidthInInches
	//androidDisplayHeightInInches
	//androidDisplayXDpi
	//androidDisplayYDpi
	
	var iosIdentifierForVendor: SystemProperty<String> = "iosIdentifierForVendor";
	
	var gpuSupportsHighPrecisionFragmentShaders: SystemProperty<Bool> = "gpuSupportsHighPrecisionFragmentShaders";
	var GL_VENDOR: SystemProperty<String> = "GL_VENDOR";
	var GL_RENDERER: SystemProperty<String> = "GL_RENDERER";
	var GL_VERSION: SystemProperty<String> = "GL_VERSION";
	var GL_SHADING_LANGUAGE_VERSION: SystemProperty<String> = "GL_SHADING_LANGUAGE_VERSION";
	var GL_EXTENSIONS: SystemProperty<String> = "GL_EXTENSIONS";
}

@:enum abstract SystemEnvironment(String) to String {
	var simulator  = "simulator";
	var device   = "device";
}

@:enum abstract SystemPlatform(String) to String {
	var android = "android";
	var ios = "ios";
	var macos = "macos";
	var tvos = "tvos";
	var win32 = "win32";
}

@:enum abstract SystemTargetAppStore(String) to String {
	var apple = "apple";
	var amazon = "amazon";
	var google = "google";
	var windows = "windows";
	var none = "none";
}

@:enum abstract LocalePreference(String) {
	var country = "country";
	var identifier = "identifier";
	var language = "language";
}

@:enum abstract UiPreference(String) {
	var ui = "ui";
}

extern class DirectoryConstant {
	//
}