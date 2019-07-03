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

typedef ButtonOptions = {
	?id: String,
	?left: Float, ?top: Float,
	?width: Float,
	?height: Float,
	
	?sheet: ImageSheet,
	?defaultFrame: AtlasIndex,
	?overFrame: AtlasIndex,
	
	?baseDir: DirectoryConstant,
	?defaultFile: String,
    ?overFile: String,

	
	?isEnabled: Bool,
	?onPress: Void -> Void,
	?onRelease: Void -> Void,
	?onEvent : Void -> Void,
	
	?fontSize : Int,
	?label: String,
	
	?labelColor: LabelColor
}

extern class ButtonWidget extends DisplayObject {
	//object:setLabel()
	//object:getLabel()
	function setEnabled(value: Bool): Void;
	//object:setFillColor()
	//object:setStrokeColor()

}