package corona;
import corona.System.LuaEither;
import lua.NativeIterator;

@:native("io") 
extern class IO
{
	static function close(file:FileHandle):Void;
	//static function flush()
	//io.input()
	static function lines(file: String): NativeIterator<String>;
	static function open<F>(file: String, mode: FileMode<F>): LuaEither<F>;
	//io.output()
	//io.read()
	//io.tmpfile()
	//io.type()
	//io.write()

}

@:enum abstract FileMode<F>(String) {
	var r: FileMode<FileR> = "r";
	var w: FileMode<FileW> = "w";
	var a: FileMode<FileW> = "a";
	var rPlus: FileMode<FileRW> = "r+";
	var wPlus: FileMode<FileRW> = "w+";
	var aPlus:FileMode<FileRW> = "a+";
}

extern interface FileHandle {
	
}

extern interface FileR extends FileHandle {
	function lines(): NativeIterator<String>;
	function read<F>(fmt: ReadFmt<F>): F;
}

@:enum abstract ReadFmt<F>(String) {
	var line: ReadFmt<String> = "*l";
	var int: ReadFmt<Int> = "*n";
	var float: ReadFmt<Float> = "*n";
	var all: ReadFmt<String> = "*a";
}

extern interface FileW extends FileHandle {
	
}

extern interface FileRW extends FileR extends FileW {
	
}