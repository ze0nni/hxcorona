package corona;

abstract LuaProducer<A>(Void -> A) from (Void -> A) {
	inline public function call(): A {
		return this();
	}
}

abstract LuaConsumer<A>(A -> Void) from (A -> Void) {
	inline public function call(a: A): Void {
		return this(a);
	}
}

abstract LuaBiConsumer<A,B>(A -> B -> Void) from (A -> B -> Void) {
	inline public function call(a: A, b: B): Void {
		return this(a, b);
	}
}

abstract LuaFunction<A,B>(A -> B) from (A -> B) {
	inline public function call(a: A): B {
		return this(a);
	}
}

abstract LuaBiFunction<A,B,C>(A -> B -> C) from (A -> B -> C) {
	inline public function call(a: A, b: B): C {
		return this(a, b);
	}
}