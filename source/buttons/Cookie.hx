package buttons;

import flixel.FlxG;
import flixel.FlxSprite;

class Cookie extends FlxSprite
{
    public var score:Int = 0;
	public var scoreMultiplier:Int = 1;

    public function new(x:Float, y:Float)
    {
        super(x, y);

        loadGraphic("assets/images/cookie.png");

		scale.set(8, 8);
		updateHitbox();
		if (FlxG.save.data.score != null)
		{
			score = FlxG.save.data.score;
		}
		else
		{
			score = 0;
		}
    }

    override public function update(elaspsed:Float):Void 
    {
        super.update(elaspsed);
    }
	public function clickTheCookie()
	{
		score = score + (1 * scoreMultiplier);
		FlxG.sound.play("assets/sounds/click.ogg");
		// trace(Std.string(score));
	}
}