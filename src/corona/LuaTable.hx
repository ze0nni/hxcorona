package corona;

#if macro

class LuaTable<A,B> {
	static public function create<A,B>(data: Dynamic): LuaTable<A, B> {
		throw "extern";
	}
}

#else 

import lua.Table;

typedef LuaTable<A,B> = lua.Table<A,B>

#end
