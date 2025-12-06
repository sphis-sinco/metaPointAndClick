package;

import mpac.scenes.Starting;
import flixel.FlxG;
import flixel.FlxState;

class Init extends FlxState
{
	override public function create()
	{
		super.create();

		'leaving'.info({
			class_id: 'init'
		});
		FlxG.switchState(Starting.new);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
