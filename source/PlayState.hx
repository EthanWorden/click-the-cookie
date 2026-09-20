package;

import buttons.Cookie;
import buttons.Cursor;
import buttons.Grandma;
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
	var grandmaUpgrade:Grandma;

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
		add(cursorUpgrade);

		grandmaUpgrade = new Grandma(680, 150);
		add(grandmaUpgrade);

		updateScoreFromUpgrades();

	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		saveGame();
		
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
		if (FlxG.mouse.overlaps(cursorUpgrade) && FlxG.mouse.justPressed && cookie.score >= cursorUpgrade.cost)
		{
			cookie.score = cookie.score - cursorUpgrade.cost;
			cursorUpgrade.buyUpgrade();
			scoreText.text = Std.string(cookie.score);
		}
		if (FlxG.mouse.overlaps(grandmaUpgrade) && FlxG.mouse.justPressed && cookie.score >= grandmaUpgrade.cost)
		{
			cookie.score = cookie.score - grandmaUpgrade.cost;
			cursorUpgrade.buyUpgrade();
			scoreText.text = Std.string(cookie.score);
		}
	}

	public function updateScoreFromUpgrades()
	{
		var cursorTimer = new FlxTimer().start(10.0, function(timer:FlxTimer)
		{
			for (i in 0...cursorUpgrade.timesPurchased)
			{
				cookie.score = cookie.score + 1;
			}
			scoreText.text = Std.string(cookie.score);
			updateScoreFromUpgrades();
		});
		var grandmaTimer = new FlxTimer().start(1.0, function(timer:FlxTimer)
		{
			for (i in 0...grandmaUpgrade.timesPurchased)
			{
				cookie.score = cookie.score + 1;
			}
			scoreText.text = Std.string(cookie.score);
			updateScoreFromUpgrades();
		});
	}
	public function saveGame()
	{
		FlxG.save.data.score = cookie.score;
		FlxG.save.data.cursorOwned = cursorUpgrade.timesPurchased;
		FlxG.save.data.grandmaOwned = grandmaUpgrade.timesPurchased;
		FlxG.save.flush();
	}
}