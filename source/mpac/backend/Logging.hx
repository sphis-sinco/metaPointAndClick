package mpac.backend;

import flixel.FlxG;

class Logging
{
	public static function info(data:Dynamic)
	{
		#if FEATURE_TRACES
		trace(data);
		#end
		FlxG.log.add(data);
	}
}
