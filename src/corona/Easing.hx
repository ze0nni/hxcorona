package corona;


abstract EasingFunction(Float -> Float -> Float -> Float -> Float) from (Float -> Float -> Float -> Float -> Float) {
	
}

@:native("easing") 
extern class Easing
{
	static var linear(default, never): EasingFunction;

	static var continuousLoop(default, never): EasingFunction;
	
	static var inSine(default, never): EasingFunction;
	
	static var outSine(default, never): EasingFunction;
	static var inOutSine(default, never): EasingFunction;
	static var outInSine(default, never): EasingFunction;

	static var inQuad(default, never): EasingFunction;
	static var outQuad(default, never): EasingFunction;
	static var inOutQuad(default, never): EasingFunction;
	static var outInQuad(default, never): EasingFunction;

	static var inCubic(default, never): EasingFunction;
	static var outCubic(default, never): EasingFunction;
	static var inOutCubic(default, never): EasingFunction;
	static var outInCubic(default, never): EasingFunction;

	static var inQuart(default, never): EasingFunction;
	static var outQuart(default, never): EasingFunction;
	static var inOutQuart(default, never): EasingFunction;
	static var outInQuart(default, never): EasingFunction;

	static var inQuint(default, never): EasingFunction;
	static var outQuint(default, never): EasingFunction;
	static var inOutQuint(default, never): EasingFunction;
	static var outInQuint(default, never): EasingFunction;

	static var inExpo(default, never): EasingFunction;
	static var outExpo(default, never): EasingFunction;
	static var inOutExpo(default, never): EasingFunction;
	static var outInExpo(default, never): EasingFunction;

	static var inCirc(default, never): EasingFunction;
	static var outCirc(default, never): EasingFunction;
	static var inOutCirc(default, never): EasingFunction;
	static var outInCirc(default, never): EasingFunction;

	static var inBack(default, never): EasingFunction;
	static var outBack(default, never): EasingFunction;
	static var inOutBack(default, never): EasingFunction;
	static var outInBack(default, never): EasingFunction;

	static var inElastic(default, never): EasingFunction;
	static var outElastic(default, never): EasingFunction;
	static var inOutElastic(default, never): EasingFunction;
	static var outInElastic(default, never): EasingFunction;

	static var inBounce(default, never): EasingFunction;
	static var outBounce(default, never): EasingFunction;
	static var inOutBounce(default, never): EasingFunction;
	static var outInBounce(default, never): EasingFunction;
}