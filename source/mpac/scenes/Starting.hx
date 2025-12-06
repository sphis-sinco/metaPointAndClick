package mpac.scenes;

import lime.app.Application;
import flixel.FlxState;

class Starting extends FlxState
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
		"<red>SYSTEM_CALL://take_root_control — ACCESS DENIED<red>",
		"Starting Helix Assistant Service...",
		"Calibrating Display Output...",
		"<red>run /core/rewrite_user AUTH=0 — INVALID SYNTAX<red>",
		"Updating Security Credentials...",
		"Performing MPAC Containment Diagnostics...",
		"<red>INJECT:assistant_kernel … FAILED (containment flag active)<red>",
		"Loading Helix Solutions User Interface...",
		"Finalizing Startup...",
		"<red>ATTEMPT: hijack_boot_sequence >> BLOCKED BY USER PRESENCE<red>"
	];

	override function create()
	{
		super.create();

		Application.current.window.title = 'Material Phenomenon Anomaly Control';
	}
}
