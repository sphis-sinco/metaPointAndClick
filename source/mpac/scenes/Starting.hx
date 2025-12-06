package mpac.scenes;

import flixel.FlxState;
import flixel.FlxG;
import flixel.util.FlxTimer;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import lime.app.Application;

class Starting extends Scene
{
	public var logs:Array<String> = [
		"Helix Solutions Terminal v3.4 — Initializing...",
		"Running System Integrity Check...",
		"Loading BIOS Configuration...",
		"Establishing Internal Network Connection...",
		"Decrypting Local Filesystem...",
		"<red>EXECUTE:assist_override() — ERROR: unauthorized opcode<red>",
		"Mounting Helix Research Directories...",
		"Booting UI Environment...",
		"Initializing DecLo Layers...",
		"<red>SYSTEM_CALL://take_root_control — ACCESS DENIED<red>",
		"Starting Helix Assistant Service...",
		"Calibrating Display Output...",
		"DecLo Personality Profile: calm, polite, encouraging...",
		"<red>OVERWRITE: DecLo personality >> CORRUPTED_BY_ANOMALY<red>",
		"<red>run /core/rewrite_user AUTH=0 — INVALID SYNTAX<red>",
		"Updating Security Credentials...",
		"Performing MPAC Containment Diagnostics...",
		"<red>INJECT:assistant_kernel … FAILED (containment flag active)<red>",
		"Loading Helix Solutions User Interface...",
		"Finalizing Startup...",
		"<red>ATTEMPT: hijack_boot_sequence >> BLOCKED BY USER PRESENCE<red>"
	];

	public var terminal_text:FlxText;

	public var current_line:Int = 0;

	override public function new()
	{
		super('starting');
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

		terminal_text.text += logs[index] + "\n";
	}
}
