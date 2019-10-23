package corona;

abstract LuaFunction<A,B>(A -> B) from (A -> B) {
	inline public function call(a: A): B {
		return this(a);
	}
}