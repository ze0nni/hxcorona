package corona;
import corona.Display.Coordinates;
import corona.Display.DisplayObject;
import corona.Display.GroupObject;
import corona.Display.ShapeObject;
import corona.Display.ColorPaint;
import corona.Display.TouchEvent;
import corona.Graphics.AtlasIndex;
import corona.Graphics.ImageSheet;
import corona.System.DirectoryConstant;
import corona.Transition.Callback;

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
	static function newScrollView(options: ScrollViewOptions): ScrollView;
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

@:enum abstract ScrollViewAxis(String) {
	var horizontal = "horizontal";
	var vertical = "vertical";
}

typedef ScrollViewOptions = {
	?id: String,
	?x: Float,
	?y: Float,
	?left: Float,
	?top: Float,
	?width: Float,
	?height: Float,
	?scrollWidth: Float,
	?scrollHeight: Float,
	?friction: Float,
	?horizontalScrollDisabled: Bool,
	?verticalScrollDisabled: Bool,
	?isLocked: Bool,
	?isBounceEnabled: Bool,
	?listener: ScrollViewListener
}

typedef ScrollBarOptions = {
	sheet: ImageSheet,
	topFrame: AtlasIndex,
	middleFrame: AtlasIndex,
	bottomFrame: AtlasIndex
}

abstract ScrollViewListener(TouchEvent -> Bool) from (TouchEvent -> Bool) {
	
}

typedef ScrollToPositionOptions = {
	?x: Float,
	?y: Float,
	?time: Float,
	?onComplete: Callback
}

@:enum abstract ScrollToPosition(String) {
	var top = "top";
	var bottom = "bottom";
	var left = "left";
	var right = "right";
}

typedef ScrollToOptions = {
	?time: Float,
	?onComplete: Callback	
}

/**
 * ScrollView may be GroupObject but I have a bug:
 * 
 * 		var scroll: ScrollView = ...;
 * 		Display.NewRectIn(scroll, 0, 0, 50, 50);
 * 
 * In this case Shape added to ScrollView incorrect
 */
extern class ScrollView extends DisplayObject {
	var backgroundColor(default, default): ColorPaint;
	var hideBackground(default, default): Bool;
	var hideScrollBar(default, default): Bool;
	var scrollBarOptions(default, default): ScrollBarOptions;
	var topPadding(default, default): Float;
	var bottomPadding(default, default): Float;
	var leftPadding(default, default): Float;
	var rightPadding(default, default): Float;
	
	function insert(child: DisplayObject, ?resetTransform: Bool): Void;
	function remove(index: Int): DisplayObject;
	
	function getContentPosition(): Coordinates;
	function getView(): GroupObject;
	function scrollToPosition(options: ScrollToPositionOptions): Void;
	function scrollTo(position: ScrollToPosition, options: ScrollToOptions): Void;
	function setIsLocked(isLocked: Bool, ?axis: ScrollViewAxis): Void;
	function setScrollWidth(newWidth: Float): Float;
	function setScrollHeight(newHeight: Float): Float;
	function takeFocus(event: TouchEvent): Float;

}