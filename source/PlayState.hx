package;

import buttons.Cookie;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;

class PlayState extends FlxState
{
	var cookie:Cookie;
	var background:FlxSprite;
	var scoreText:FlxText;

	override public function create()
	{
		super.create();

		// background image
		background = new FlxSprite(0, 0);
		background.loadGraphic("assets/images/background.png");
		add(background);
		// the cookie
		cookie = new Cookie(150, 50);
		add(cookie);
		// text that displays the score
		scoreText = new FlxText(305, 450);
		scoreText.text = Std.string(cookie.score);
		scoreText.size = 50;
		add(scoreText);

	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		if (FlxG.mouse.overlaps(cookie))
		{
			cookie.scale.set(9, 9);
		}

		if (FlxG.mouse.overlaps(cookie) && FlxG.mouse.justPressed)
		{
			cookie.clickTheCookie();
			scoreText.text = Std.string(cookie.score);
		}

		if (FlxG.mouse.overlaps(cookie) && FlxG.mouse.pressed)
		{
			cookie.scale.set(7, 7);
		}

		if (!FlxG.mouse.overlaps(cookie))
		{
			cookie.scale.set(8, 8);
		}
	}
}
