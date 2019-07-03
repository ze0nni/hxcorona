package corona;
import corona.Display.TextureWrap;
import corona.System.DirectoryConstant;
import lua.Table.AnyTable;

@:native("graphics") 
private extern private class NativeGraphics {
	static function newTexture(params: AnyTable): TextureResource;
	static function newImageSheet(filename: String, params: AnyTable): ImageSheet;
}

typedef SheetOptions = AnyTable;

extern abstract AtlasIndex(Int) {
}

class Graphics
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
			AnyTable.create(
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

extern class TextureResource {
	var filename(default, null): String;
	var baseDir(default, null): DirectoryConstant;
	var type(default, null): TextureType;
	var wrapX(default, null): TextureWrap;
	var wrapY(default, null): TextureWrap;
	function releaseSelf(): Void;
}

extern class ImageSheet {
	
}