package corona;
import corona.Display.ColorPaint;
import corona.Display.ShapeObject;
import corona.Graphics.AtlasIndex;
import corona.Graphics.ImageSheet;
import corona.Graphics.TextureResource;
import corona.Runtime.EventDispatcher;
import corona.System.DirectoryConstant;
import lua.Table;

@:native("display") 
extern class Display
{
	static var HiddenStatusBar(default, never): StatusBarMode;
	static var DefaultStatusBar(default, never): StatusBarMode;
	static var TranslucentStatusBar(default, never): StatusBarMode;
	static var DarkStatusBar(default, never): StatusBarMode;
	static var LightTransparentStatusBar(default, never): StatusBarMode;
	static var DarkTransparentStatusBar(default, never): StatusBarMode;
	
	static var actualContentHeight(default, never): Int;
	static var actualContentWidth(default, never): Int;
	static var contentCenterX(default, never): Int;
	static var contentCenterY(default, never): Int;
	static var contentHeight(default, never): Int;
	static var contentScaleX(default, never): Int;
	static var contentScaleY(default, never): Int;
	static var contentWidth(default, never): Int;
	//currentStage
	static var fps(default, never): Int;
	//display.imageSuffix
	static var pixelHeight(default, never): Int;
	static var pixelWidth(default, never): Int;
	static var safeActualContentWidth(default, never): Int;
	static var safeActualContentHeight(default, never): Int;
	static var safeScreenOriginX(default, never): Int;
	static var safeScreenOriginY(default, never): Int;
	static var screenOriginX(default, never): Int;
	static var screenOriginY(default, never): Int;
	static var statusBarHeight(default, never): Int;
	static var topStatusBarContentHeight(default, never): Int;
	static var viewableContentHeight(default, never): Int;
	static var viewableContentWidth(default, never): Int;
	
	//display.capture()
	//display.captureBounds()
	//display.captureScreen()
	//display.colorSample()
	public static function getCurrentStage(): CoronaStage;
	//display.getDefault()
	//display.getSafeAreaInsets()
	//display.loadRemoteImage()
	
	@:native("newCircle")
	public static function newCircle(xCenter: Float, yCenter: Float, radius: Float): ShapeObject;
	@:native("newCircle")
	public static function newCircleIn(parent: GroupObject, xCenter: Float, yCenter: Float, radius: Float): ShapeObject;
	
	@:native("newContainer")
	public static function newContainer(width: Int, height: Int): ContainerObject;
	@:native("newContainer")
	public static function newContainerIn(group: GroupObject, width: Int, height: Int): ContainerObject;
	
	public static function newEmbossedText(options: {
		?parent: GroupObject,
		text: String,
		?x: Float,
		?y: Float,
		?width:Float,
		?height:Float,
		//font,
		?fontSize: Float
	}): EmbossedTextObject;
	//display.newEmitter()
	public static function newGroup(): GroupObject;
	
	@:native("newImage")
	public static function newImage(filename: String): DisplayObject;
	
	@:native("newImage")
	public static function newImageIn(parent: GroupObject, filename: String): DisplayObject;
	
	@:native("newImage")
	public static function newImageFromSheet(sheet: ImageSheet, index: Int): DisplayObject;
	
	@:native("newImage")
	public static function newImageFromSheetIn(parent: GroupObject, sheet: ImageSheet, index: Int): DisplayObject;
	
	@:native("newImageRect")
	public static function newImageRect(
		filename: String,
		width: Float,
		height: Float
	): Null<ImageObject>;
	
	@:native("newImageRect")
	public static function newImageRectIn(
		parent: GroupObject,
		filename: String,
		width: Float,
		height: Float
	): Null<ImageObject>;
	
	@:native("newImageRect")
	public static function newImageRectFromSheet(
		sheet: ImageSheet,
		index: Int,
		width: Float,
		height: Float
	): Null<ImageObject>;
	
	@:native("newImageRect")
	public static function newImageRectFromSheetIn(
		parent: GroupObject,
		sheet: ImageSheet,
		index: AtlasIndex,
		width: Float,
		height: Float
	): Null<ImageObject>;
	
	@:native("newImageRect")
	public static function newImageRectFromDir(
		filename: String,
		baseDir: DirectoryConstant,
		width: Float,
		height: Float
	): Null<ImageObject>;
	
	@:native("newLine") public static function newLine(x1: Float, y1: Float, x2: Float, y2: Float): LineObject;
	@:native("newLine") public static function newLineIn(parent: GroupObject, x1: Float, y1: Float, x2: Float, y2: Float): LineObject;
	
	
	@:native("newMesh")
	public static function newMesh(x: Float, y: Float, options: MeshOptions): ShapeObject;
	@:native("newMesh")
	public static function newMeshIn(parent: GroupObject, x: Float, y: Float, options: MeshOptions): ShapeObject;
	//display.newPolygon()
	
	@:native("newRect")
	public static function newRect(x: Float, y: Float, width: Float, height: Float): ShapeObject;
	
	@:native("newRect")
	public static function newRectIn(parent: GroupObject, x: Float, y: Float, width: Float, height: Float): ShapeObject;
	
	//display.newRoundedRect()
	//display.newSnapshot()
	//display.newSprite()
	@:native("newText")
	public static function newText(options: {
		?parent: GroupObject,
		text: String,
		?x: Float,
		?y: Float,
		?width:Float,
		?height:Float,
		//font,
		?fontSize: Float,
		?align: TextAlign
	}): TextObject;
	//display.remove()
	//display.save()
	public static function setDefault<T>(key: DisplayKey<T>, value: T): Void;
	public static function setDrawMode(key: DrawModeKey, value: Bool): Void;
	public static function setStatusBar(mode: StatusBarMode): Void;
}

@:enum abstract TextAlign(String) {
	var left = "left";
	var center = "center";
	var right = "right";
}

extern class CoronaStage {
	function setFocus(object: DisplayObject): Void;
}

@:enum abstract TouchEventName(String) to String {
	var touch = "touch";
	var tap = "tap";
}

@:enum abstract TouchPhase(String) to String {
	var began = "began";
	var moved = "moved";
	var ended = "ended";
	var cancelled = "cancelled";
}

extern class TouchEvent {
	var target(default, null): Dynamic;
	
	var id(default, null): Int;
	var name(default, null): String;
	var phase(default, null): TouchPhase;
	var time(default, null): Int;
	var x(default, null): Float;
	var y(default, null): Float;
}

@:multiReturn extern class Coordinates {
    var x : Float;
    var y : Float;
}


extern class DisplayObject extends EventDispatcher<TouchEventName, TouchEvent> {
	var alpha(default, default): Float;
	var anchorX(default, default): Float;
	var anchorY(default, default): Float;
	var x(default, default): Float;
	var y(default, default): Float;
	var width(default, default): Float;
	var height(default, default): Float;
	var contentWidth(default, null): Float;
	var contentHeight(default, null): Float;
	var xScale(default, default): Float;
	var yScale(default, default): Float;
	var isHitTestable(default, default): Bool;
	var isVisible(default, default): Bool;
	
	var parent(default, never): GroupObject;
	
	var rotation(default, default): Float;
	
	public function contentToLocal(globalX: Float, globalY: Float): Coordinates;
	public function localToContent(localX: Float, localY: Float): Coordinates;
	
	public function removeSelf(): Void;
	
	public function toBack(): Void;
	
	public function toFront(): Void;
}

extern class ShapeObject extends DisplayObject {
	var fill(default, default): Paint;
	//object.path
	//object.stroke
}

extern class ImageObject extends ShapeObject {
	public function setFillColor(r:Float, g:Float, b:Float, ?a:Float): Void;
	public function setGrayFillColor(g:Float, ?a:Float): Void;
}

abstract Paint(Dynamic)
	from ColorPaint
	from BitmapPaint
	from CompositePaint
	from GradientPaint
{
	public var scaleX(never, set): Float;
	function set_scaleX(v) {
		untyped this.scaleX = v;
		return v;
	}
	
	public var scaleY(never, set): Float;
	function set_scaleY(v) {
		untyped this.scaleY = v;
		return v;
	}
	
	inline public static function color(r: Float, g: Float, b:Float, ?a: Float = 1): ColorPaint {
		return Table.create([r, g, b, a]);
	}
	
	inline public static function gradient(color1: ColorPaint, color2:ColorPaint, direction: GradientDiretion): GradientPaint {
		return {
			type: GradientPaintType.gradient,
			color1 : color1,
			color2 : color2,
			direction : direction
		}
	}
	
	inline public static function bitmap(texture: TextureResource): BitmapPaint {
		return {
			type: BitmapPaintType.image,
			filename: texture.filename,
			baseDir: texture.baseDir
		}
	}
}

typedef ColorPaint = Table<Int, Float>;

@:enum abstract BitmapPaintType(String) { var image = "image"; }
typedef BitmapPaint = {
	type: BitmapPaintType,
	filename: String,
	baseDir: DirectoryConstant
}

@:enum abstract CompositePaintType(String) { var composite = "composite"; }
typedef CompositePaint = {
	type: CompositePaintType,
	paint1: BitmapPaint,
	paint2: BitmapPaint
}

@:enum abstract GradientPaintType(String) { var gradient = "gradient"; }
typedef GradientPaint = {
	type: GradientPaintType,
	color1: ColorPaint,
	color2: ColorPaint,
	direction: Null<GradientDiretion>

}

abstract GradientDiretion(Dynamic)
	from GradientDiretionConst
	from Float {
}

@:enum abstract GradientDiretionConst(String) {
	var down = "down";
	var up = "up";
	var left = "left";
	var right = "right";
}

typedef MeshOptions = {
	vertices: Table<Int,Float>,
	?parent: GroupObject,
	?mode : MeshMode,
	?indices: Table<Int,Float>,
	?zeroBasedIndices: Bool,
	?uvs: Table<Int,Float>
};

@:enum abstract MeshMode(String) {
	var triangles = "triangles";
	var strip = "strip";
	var fan = "fan";
	var indexed = "indexed";
}

extern class GroupObject extends DisplayObject {
	@:native("insert")
	function insert(child: DisplayObject, ?resetTransform: Bool): Void;
	
	@:native("insert")
	function insertAt(index: Int, child: DisplayObject, ?resetTransform: Bool): Void;
	
	function remove(index: Int): DisplayObject;
}

extern class ContainerObject extends GroupObject {
	function translate(x: Float, y: Float): Void;
}

extern class LineObject extends DisplayObject {
	var strokeWidth(default, default): Float;
	
	function append(x: Float, y: Float): Void;
	function setStrokeColor(r: Float, g: Float, b: Float, a: Float = 1): Void;
}

extern class TextObject extends DisplayObject {
	var size(default, default): Float;
	var text(default, default): String;
	var baselineOffset(default, default): Float;
	
	@:native("setFillColor")
	function setFillColorGray(gray: Float, ?alpha: Float): Void;
	
	@:native("setFillColor")
	function setFillColor(r: Float, g: Float, b: Float, ?alpha: Float): Void;
	
	//@:native("setFillColor")
	//function setFillGradient(gradient: Gradient): Void;
}

extern class EmbossedTextObject extends TextObject {
	function setEmbossColor(colorTable: {
		?highlight: { r: Float, g: Float, b: Float },
		?shadow: { r: Float, g: Float, b: Float }
	}):Void;
}

@:enum abstract DrawModeKey(String) {
	var normal = "default";
	var wireframe = "wireframe";
}

abstract StatusBarMode(Dynamic) {
	
}

@:enum abstract DisplayKey<T>(String) {
	var anchorX: DisplayKey<Float> = "anchorX";
	var anchorY: DisplayKey<Float> = "anchorY";
	var textureWrapX: DisplayKey<TextureWrap> = "textureWrapX";
	var textureWrapY: DisplayKey<TextureWrap> = "textureWrapY";
}

@:enum abstract TextureWrap(String) {
	var clampToEdge = "clampToEdge";
	var repeat = "repeat";
	var mirroredRepeat = "mirroredRepeat";
}