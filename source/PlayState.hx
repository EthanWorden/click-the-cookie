package;

import buttons.Cookie;
import buttons.Cursor;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxTimer;

class PlayState extends FlxState
{
	var cookie:Cookie;
	var background:FlxSprite;
	var scoreText:FlxText;

	var cursorUpgrade:Cursor;

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

		cursorUpgrade = new Cursor(680, 0);
		cursorUpgrade.timesPurchased = 0;
		add(cursorUpgrade);

	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		// cookie controls
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
		updateScoreFromUpgrades();
	}

	public function updateScoreFromUpgrades()
	{
		for (i in 0...cursorUpgrade.timesPurchased)
		{
			var timer = new FlxTimer().start(10.0, function(timer:FlxTimer)
			{
				cookie.score = cookie.score + 1;
			});
		}
	}
}