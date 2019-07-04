package corona;
import corona.Display.DisplayObject;
import corona.Display.GroupObject;
import corona.Display.ShapeObject;
import corona.Display.ColorPaint;
import corona.Graphics.AtlasIndex;
import corona.Graphics.ImageSheet;
import corona.System.DirectoryConstant;

/**
 * ...
 * @author Onni
 */

 @:luaRequire("widget")
extern class Widget
{
	static function newButton(options: ButtonOptions): ButtonWidget;
	//widget.newPickerWheel()
	//widget.newProgressView()
	//widget.newScrollView()
	//widget.newSegmentedControl()
	//widget.newSlider()
	//widget.newSpinner()
	//widget.newStepper()
	//widget.newSwitch()
	//widget.newTabBar()
	//widget.newTableView()
	//widget.setTheme()
}

abstract LabelColor(Dynamic) {
	inline
	public function new (def: ColorPaint, over: ColorPaint) {
		this = {
			'default': def,
			'over': over
		}
	}
}

abstract ButtonOptions(Dynamic) {
	inline
	function new(source: Dynamic) {
		this = source;
	}
	
	@:from
	static
	inline
	public function fromFiles(source: ButtonOptionsFromFile) {
		return new ButtonOptions(source);
	}
	
	@:from
	static
	inline
	public function fromSheet (source: ButtonOptionsFromSheet) {
		return new ButtonOptions(source);
	}
	
	@:from
	static
	inline
	public function from9Slice(source: ButtonOptionsFrom9Slice) {
		return new ButtonOptions(source);
	}
}

private typedef ButtonOptionsBase = {
	?id: String,
	?left: Float,
	?top: Float,
	?width: Float,
	?height: Float,
	
	?isEnabled: Bool,
	?onPress: Void -> Void,
	?onRelease: Void -> Void,
	?onEvent : Void -> Void,
	
	?fontSize : Int,
	?label: String,
	
	?labelColor: LabelColor
}

typedef ButtonOptionsFromFile = {
	> ButtonOptionsBase,
	
	baseDir: DirectoryConstant,
	defaultFile: String,
    ?overFile: String
}

typedef ButtonOptionsFromSheet = {
	> ButtonOptionsBase,
	
	sheet: ImageSheet,
	defaultFrame: AtlasIndex,
	?overFrame: AtlasIndex
}

typedef ButtonOptionsFrom9Slice = {
	> ButtonOptionsBase,
	
	sheet: ImageSheet,
	topLeftFrame: AtlasIndex,
	topMiddleFrame: AtlasIndex,
	topRightFrame: AtlasIndex,
	middleLeftFrame: AtlasIndex,
	middleFrame: AtlasIndex,
	middleRightFrame: AtlasIndex,
	bottomLeftFrame: AtlasIndex,
	bottomMiddleFrame: AtlasIndex,
	bottomRightFrame: AtlasIndex,
	topLeftOverFrame: AtlasIndex,
	topMiddleOverFrame: AtlasIndex,
	topRightOverFrame: AtlasIndex,
	middleLeftOverFrame: AtlasIndex,
	middleOverFrame: AtlasIndex,
	middleRightOverFrame: AtlasIndex,
	bottomLeftOverFrame: AtlasIndex,
	bottomMiddleOverFrame: AtlasIndex,
	bottomRightOverFrame: AtlasIndex
}

extern class ButtonWidget extends DisplayObject {
	//object:setLabel()
	//object:getLabel()
	function setEnabled(value: Bool): Void;
	//object:setFillColor()
	//object:setStrokeColor()

}