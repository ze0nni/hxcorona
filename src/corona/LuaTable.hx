package corona;

#if macro
extern class LuaTable<A,B> {
	static public function create<A,B>(data: Dynamic): LuaTable<A, B>;
}
#else 

import lua.Table;

typedef LuaTable<A,B> = lua.Table<A,B>

#end
