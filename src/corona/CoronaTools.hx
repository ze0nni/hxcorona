package corona;
import corona.Display.GroupObject;
import corona.Display.DisplayObject;

class CoronaTools 
{
	static public function childIndex(g: GroupObject, c: DisplayObject): Int {
		for (i in 0...g.numChildren) {
			if (c == childAt(g, i)) {
				return i;
			}
		}
		return -1;
	}
	
	static inline public function childAt(g: GroupObject, index: Int): Null<DisplayObject> {
		return untyped g[index];
	}
}