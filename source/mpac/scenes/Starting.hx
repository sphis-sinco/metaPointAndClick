package mpac.scenes;

import polymod.fs.ZipFileSystem;
import polymod.fs.MemoryZipFileSystem;
import flixel.FlxState;
import flixel.FlxG;
import flixel.util.FlxTimer;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import lime.app.Application;

class Starting extends Scene
{
	public var logs:Array<String> = [
		'Lutihenx Terminal v3.4 — Initializing...'
	];

	public var terminal_text:FlxText;

	public var current_line:Int = 0;

	override public function new()
	{
		super('starting');

		for (file in new ZipFileSystem({}).readDirectory('assets/data/hashes/'))
			logs.push('Parsed hash: ' + file);
	}

	override function create()
	{
		super.create();

		Application.current.window.title = 'Material Phenomenon Anomaly Control';

		terminal_text = new FlxText();
		add(terminal_text);

		terminal_text.setPosition(2, 2);

		var i = 0;
		for (log in logs)
		{
			new FlxTimer().start(FlxG.random.float(0, 0.1) * i, t ->
			{
				addLine(current_line);

				terminal_text.applyMarkup(terminal_text.text, [
					new FlxTextFormatMarkerPair(new FlxTextFormat(FlxColor.RED, true, true), '<red>')
				]);

				current_line++;

				if (current_line >= logs.length)
				{
					info('Completed Starting Scene');
					FlxG.switchState(DesktopMain.new);
				}
			});

			i++;
		}
	}

	public function addLine(index:Int)
	{
		if (logs[index] == null)
			return;

		info('Adding line: ' + logs[index]);

		terminal_text.text += index + ' | ' + logs[index] + '\n';
	}
}
