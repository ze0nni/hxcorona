package corona;
import haxe.Constraints.Function;
import lua.Lua.LoadResult;
import lua.Table.AnyTable;

/**
 * ...
 * @author Onni
 */
@:native("_G")
extern class Corona
{
	public static function loadstring(source: String, id: String): LoadResult;
	public static function setfenv(f: Function, env: AnyTable): Void;
}