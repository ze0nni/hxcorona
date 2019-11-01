package corona;
import corona.Display.TextureWrap;
import corona.System.DirectoryConstant;


@:native("graphics") 
@:extern private private class NativeGraphics {
	static public function newTexture(params: LuaTable<Dynamic,Dynamic>): TextureResource { throw "macro"; }
	static public function newImageSheet(filename: String, params: LuaTable<Dynamic,Dynamic>): ImageSheet { throw "macro"; }
}

typedef SheetOptions = LuaTable<Dynamic,Dynamic>;

extern abstract AtlasIndex(Int) {
}

@:keep class Graphics
{
	//graphics.defineEffect()
	//graphics.getFontMetrics()
	static public function newImageSheet(filename: String, options: SheetOptions): ImageSheet {
		return NativeGraphics.newImageSheet(filename, options);
	}
	//graphics.newMask()
	//graphics.newOutline()
	//@:native("newTexture") 
	inline static public function newTexture(filename: String): TextureResource {
		return NativeGraphics.newTexture(
			LuaTable.create(
				{ type:TextureType.image,
				  filename:filename
				}
			)
		);
	}
	//graphics.releaseTextures()
}

@:enum abstract TextureType(String) {
	var image = "image";
	var canvas = "canvas";
}

@:extern class TextureResource {
	public var filename(default, null): String;
	public var baseDir(default, null): DirectoryConstant;
	public var type(default, null): TextureType;
	public var wrapX(default, null): TextureWrap;
	public var wrapY(default, null): TextureWrap;
	function releaseSelf(): Void { throw "extern"; }
}

extern class ImageSheet {
	
}