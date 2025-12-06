package mpac.backend;

import flixel.FlxG;

typedef PrintDataWithType =
{
	> PrintData,
	type:String,
}

typedef PrintData =
{
	?class_id:String
}

class Logging
{
	static function log(data:Dynamic, ?print_data:PrintDataWithType)
	{
		var log:String = '';

		if (print_data != null)
		{
			log += '[' + print_data.type.toUpperCase();

			if (print_data.class_id != null)
				log += ' | ' + print_data.class_id;

			log += '] :';
		}

		log += data;

		#if CONSOLE_LOGS
		Sys.println(log);
		#end

		FlxG.log.add(log);
	}

	public static function logTypeBase(type:String, ?data:Dynamic, ?print_data:PrintData)
	{
		log(data, {
			type: type,
			class_id: print_data.class_id
		});
	}

	public static function info(data:Dynamic, ?print_data:PrintData)
		logTypeBase("info", data, print_data);

	public static function error(data:Dynamic, ?print_data:PrintData)
		logTypeBase("error", data, print_data);

	public static function warning(data:Dynamic, ?print_data:PrintData)
		logTypeBase("warning", data, print_data);
}
