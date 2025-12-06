package mpac.scenes;

import flixel.util.FlxTimer;
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

		declo.dialogue.color = FlxColor.WHITE;
		declo.sayDialogue('Hello there!');

		FlxTimer.wait(1, () ->
		{
			declo.sayDialogue('Welcome to the Lutihenx Terminal!');
		});
		FlxTimer.wait(1.5, () ->
		{
			declo.setStates(null, null, 'flicker');
			declo.sayDialogue('Please enjoy your time here!', true);
		});
		FlxTimer.wait(1.6, () ->
		{
			declo.setStates(null, null, 'regular');
			declo.sayDialogue('Please enjoy your time here!');
		});
	}
}
