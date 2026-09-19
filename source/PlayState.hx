package;

import buttons.Cookie;
import flixel.FlxState;
import flixel.text.FlxText;

class PlayState extends FlxState
{
	var cookie:Cookie;


	override public function create()
	{
		super.create();

		cookie = new Cookie(0, 0);

		add(cookie);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
