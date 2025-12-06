package mpac.objects;

import flixel.text.FlxText;
import flixel.sound.FlxSound;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;

class Declo extends FlxTypedSpriteGroup<FlxSprite>
{
	public var back:FlxSprite;
	public var mouth:FlxSprite;
	public var eyes:FlxSprite;

	public var dialogue:FlxText;

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

		dialogue = new FlxText();
		add(dialogue);

		shutUp();
	}

	public function setStates(?mouth_state:String, ?eye_state:String)
	{
		back.loadGraphic('assets/images/declo/back.png');
		if (mouth_state != null)
			mouth.loadGraphic('assets/images/declo/mouths/' + mouth_state + '.png');
		if (eye_state != null)
			eyes.loadGraphic('assets/images/declo/eyes/' + eye_state + '.png');
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		mouth.setPosition(back.x, back.y);
		eyes.setPosition(back.x, back.y);

		dialogue.setPosition(back.getGraphicMidpoint().x, back.getGraphicMidpoint().y - back.height * 2);
	}

	public var dialogue_anomaly:FlxSound = new FlxSound().loadStream('assets/sounds/anomaly_talk.wav');
	public var dialogue_declo:FlxSound = new FlxSound().loadStream('assets/sounds/declo_talk.wav');

	public function shutUp()
	{
		dialogue_anomaly.stop();
		dialogue_declo.stop();
		dialogue.visible = false;
	}

	public function speak(anomaly:Bool = false)
	{
		shutUp();

		if (anomaly)
			dialogue_declo.play();
		else
			dialogue_anomaly.play();
	}

	public function sayDialogue(say:String)
	{
		dialogue.text = say;
		dialogue.visible = false;
	}
}
