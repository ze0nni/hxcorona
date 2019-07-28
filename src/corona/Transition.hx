package corona;
import corona.Display.DisplayObject;
import corona.Easing.EasingFunction;

@:native("transition")
extern class Transition
{
	static function to(object: DisplayObject, args: TweenArgs): Transition;
	
	@:native("cancel")
	static function cancelTo(object: DisplayObject): Void;
	
	@:native("cancel")
	static function cancelTransition(object: Transition): Void;
}

extern abstract Callback(Void -> Void) from Void -> Void {
	//
}

typedef TweenArgs = {
	?time: Int,
	?delay: Int,
	?iterations: Int,
	?transition: EasingFunction,
	?x: Float,
	?y: Float,
	?width: Float,
	?height: Float,
	?alpha:Float,
	?xScale:Float,
	?yScale:Float,
	?onStart: Callback,
	?onComplete: Callback
}