package mpac.scenes;

import flixel.util.FlxColor;
import mpac.objects.Declo;

class DesktopMain extends Scene
{
	override public function new()
	{
		super('desktop_main');
	}

	public var declo:Declo;

	override function create()
	{
		super.create();

		declo = new Declo();
		add(declo);

		declo.screenCenter();
		declo.scale.set(2, 2);

        declo.setStates(null, 'happy-closed');

        declo.sayDialogue('Hey!!!');
        declo.dialogue.color = FlxColor.WHITE;
	}
}
