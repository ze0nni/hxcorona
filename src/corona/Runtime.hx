package corona;

@:native("_G")
extern class Runtime
{
	@:native("Runtime")
	public static var instance(default, null): Runtime;
	
	function addEventListener<E,L>(eventName: RuntimeEvents<E, L>, listener: L): Void;
	function removeEventListener<E,L>(eventName: RuntimeEvents<E, L>, listener: L): Bool;
	//function dispatchEvent<RuntimeEvents<E, L>>(event: E): Void;
}

extern class EventDispatcher<T, E> {
	function addEventListener(eventName: T, listener: E->Bool): Void;
	function removeEventListener(eventName: T, listener: E->Bool): Bool;
	function dispatchEvent(event: E): Void;
}

@:enum abstract RuntimeEvents<E, L>(String) {
	var enterFrame: RuntimeEvents<EnterFrameEvent, EnterFrameEvent -> Void> = "enterFrame";
	var unhandledError: RuntimeEvents<UnhandledErrorEvent, UnhandledErrorEvent -> Bool> = "unhandledError";
	var accelerometer: RuntimeEvents<AccelerometerEvent, AccelerometerEvent -> Void> = "accelerometer";
}

typedef EnterFrameEvent = {
	var name(default, null): String;
	var time(default, null): Int;
}

typedef UnhandledErrorEvent = {
	var name(default, null): String;
	var errorMessage(default, null): String;
	var stackTrace(default, null): String;
}

typedef AccelerometerEvent = {
	var name(default, null): String;
	var isShake(default, null): Bool;
	var deltaTime(default, null): Int;
	//var device: InputDevice;
	var xGravity(default, null): Float;
	var yGravity(default, null): Float;
	var zGravity(default, null): Float;
	var xInstant(default, null): Float;
	var yInstant(default, null): Float;
	var zInstant(default, null): Float;
	var xRaw(default, null): Float;
	var yRaw(default, null): Float;
	var zRaw(default, null): Float;
}