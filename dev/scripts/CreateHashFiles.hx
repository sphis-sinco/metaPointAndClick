package dev.scripts;

import sys.FileSystem;
import haxe.crypto.Sha256;

class CreateHashFiles
{
	static var path:String = '../../assets/data/hashes/';

	public static function main()
	{
		if (FileSystem.exists(path))
		{
			for (file in FileSystem.readDirectory(path))
				FileSystem.deleteFile(path + file);
		}

		FileSystem.createDirectory(path);
		var count:Int = Std.int(Math.random() * 500);
        var total_count = count;

		while (count > 0)
		{
			var hash:String = Sha256.encode('h: ' + Math.random() * 463);
			sys.io.File.saveContent(path + hash + '.hashfile', hash);
			trace(path + hash + '.hashfile' + ' (' + ((total_count - count) + 1) + '/' + (total_count) + ')');

			count--;
		}
		var alphabet = ' abcdefghijklmnopqrstuvwxyz';
		sys.io.File.saveContent(path + alphabet.charAt(Std.int(Math.random() * alphabet.length)) + '.hashfile', 'Anomaly is lose. Find and capture it.');
	}
}
