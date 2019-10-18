package corona;

#if !macro
import lua.Table;
#end

#if macro
typedef Table<A,B> = { };
#end

@:luaRequire("json")
extern class Json
{
	public static function decode(data: String): Table<Dynamic, Dynamic>;
	public static function encode(data: Dynamic, ?options: { ?indent: Bool } ): String;
}