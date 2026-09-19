package;

import buttons.Cookie;
import flixel.FlxG;
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
		if (FlxG.mouse.overlaps(cookie))
		{
			cookie.scale.set(12, 12);
		}

		if (FlxG.mouse.overlaps(cookie) && FlxG.mouse.justPressed)
		{
			cookie.scale.set(8, 8);
			cookie.clickTheCookie();
		}

		if (!FlxG.mouse.overlaps(cookie))
		{
			cookie.scale.set(10, 10);
		}
	}
}
