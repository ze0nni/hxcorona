package corona;

@:native("native")
extern class Native
{
	public static function showAlert(title: String, message: String): Void;
}