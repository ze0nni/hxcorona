package corona;
import corona.Display.ColorPaint;
import corona.Display.GradientDiretion;
import corona.Display.GradientPaint;
import corona.Display.Paint;

typedef SetFillColor = {
	function setFillColor(r: Float, g: Float, b: Float, ?a: Float): Void;
}

@:extern class Color
{
	inline static var ratio = 1.0 / 255;
	
	public inline static function rgb(color: Int, consumer: Float -> Float -> Float -> Void) {
		consumer(
			((color >> 16) & 0xff) * ratio,
			((color >> 8) & 0xff) * ratio,
			(color & 0xff) * ratio
		);
	}
	
	public inline static function setFillColor(
		color: Int,
		target: SetFillColor
	): Void {
		rgb(color, function(r, g, b) {
			target.setFillColor(r, g, b);
		});
	}
	
	public inline static function toRGB(color: Int): RGB {
		return color;
	}
}

@:extern abstract RGB(Int) from Int {
	
	@:extern inline public function new(color:Int) 
	{
		this = color;
	}
	
	@:extern public inline function iUnits<T>(consumer: Int -> Int -> Int -> T) {
		return consumer(
			((this >> 16) & 0xff),
			((this >> 8) & 0xff),
			(this & 0xff)
		);
	}
	
	inline static var ratio = 1.0 / 255;
	
	@:extern public inline function fUnits<T>(consumer: Float -> Float -> Float -> T) {
		return consumer(
			((this >> 16) & 0xff) * ratio,
			((this >> 8) & 0xff) * ratio,
			(this & 0xff) * ratio
		);
	}
	
	@:extern public inline function toColorPaint(): ColorPaint {
		return fUnits(function(r, g, b) {
			return Paint.color(r, g, b);
		});
	}
	
	@:extern inline public function setFillColor(
		target: SetFillColor
	): Void {
		new RGB(this).fUnits(function(r, g, b) {
			target.setFillColor(r, g, b);
		});
	}
}

@:extern abstract Gradient(Array<RGB>) {
	public inline function new(c1: RGB, c2: RGB) {
		this = [c1, c2];
	}
	
	inline public function color1(): RGB {
		return this[0];
	}
	
	inline public function color2(): RGB {
		return this[1];
	}
	
	@:extern public inline function toGradientPaint(direction: GradientDiretion): GradientPaint {
		return Paint.gradient(
			this[0].toColorPaint(),
			this[1].toColorPaint(),
			direction
		);
	}
}