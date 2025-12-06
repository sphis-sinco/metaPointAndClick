package mpac.objects;

import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;

class Declo extends FlxTypedSpriteGroup<FlxSprite>
{
	public var back:FlxSprite;
	public var mouth:FlxSprite;
	public var eyes:FlxSprite;

	override public function new()
	{
		super();

		back = new FlxSprite();
		mouth = new FlxSprite();
		eyes = new FlxSprite();

		setStates('smile', 'happy-open');

		add(back);
		add(mouth);
		add(eyes);
	}

	public function setStates(?mouth_state:String, ?eye_state:String)
	{
		back.loadGraphic('assets/images/declo/back.png');
		if (mouth_state != null)
			mouth.loadGraphic('assets/images/declo/mouths/' + mouth_state + '.png');
		if (eye_state != null)
			eyes.loadGraphic('assets/images/declo/eyes/' + eye_state + '.png');
	}

    override function update(elapsed:Float) {
        super.update(elapsed);

        mouth.setPosition(back.x, back.y);
        eyes.setPosition(back.x, back.y);
    }
}
