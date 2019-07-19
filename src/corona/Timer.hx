package corona;

abstract TimerId(Dynamic) { }

abstract TimerListener(Void -> Void) from (Void -> Void) { }

@:native("timer") 
extern class Timer
{
	static function cancel(timerId: TimerId): Float;
	static function pause(timerId: TimerId): Float;
	
	static function performWithDelay(delay: Float, listener: TimerListener): TimerId;
	
	@:native("performWithDelay") 
	static function performWithDelayRepeat(delay: Float, listener: TimerListener, iterations: Int): TimerId;
	
	static function resume(timerId: TimerId): Float;
	
	static var allowIterationsWithinFrame(default, default): Bool;

}