package mpac.scenes;

import flixel.FlxState;

class Scene extends FlxState
{
	public var class_id:String;

	override public function new(id:String)
	{
		this.class_id = id;

		super();
	}

	public function log(data:Dynamic)
		data.log({
			class_id: this.class_id
		});

	public function error(data:Dynamic)
		data.error({
			class_id: this.class_id
		});

	public function warning(data:Dynamic)
		data.warning({
			class_id: this.class_id
		});
}
