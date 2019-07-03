package corona;
import lua.Table.AnyTable;

@:luaRequire("json")
extern class Json
{
	public static function decode(data: String): AnyTable;
	public static function encode(data: Dynamic, ?options: { ?indent: Bool } ): String;
}