package mpac.scenes;

import lime.app.Application;
import flixel.FlxState;

class Starting extends FlxState
{
	override function create()
	{
		super.create();

		Application.current.window.title = 'Material Phenomenon Anomaly Control';
	}
}
