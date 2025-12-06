package dev.scripts;

import sys.FileSystem;
import haxe.crypto.Sha256;

class CreateHashFiles
{
	static var path:String = 'assets/data/hashes/';

	public static function main()
	{
		if (FileSystem.exists(path))
		{
			for (file in FileSystem.readDirectory(path))
				FileSystem.deleteFile(path + file);
		}

		FileSystem.createDirectory(path);
		var count:Int = Std.int(Math.random() * 50);
        var total_count = count;

		trace('Creating ' + total_count + ' hash files');

		while (count > 0)
		{
			var hash:String = Sha256.encode('h: ' + Math.random() * 900000000000);
			sys.io.File.saveContent(path + hash + '.hashfile', hash);

			count--;
		}
		var symbols = ' abcdefghijklmnopqrstuvwxyz1234567890';
		sys.io.File.saveContent(path + symbols.charAt(Std.int(Math.random() * symbols.length)) + '.hashfile', 'Anomaly is lose. Find and capture it.');
		
		trace('Finished creating hash files');
	}
}
