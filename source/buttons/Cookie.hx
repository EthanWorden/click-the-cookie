package buttons;

import flixel.FlxSprite;

class Cookie extends FlxSprite
{
    public var score:Int = 0;
	public var scoreMultiplier:Int = 1;

    public function new(x:Float, y:Float)
    {
        super(x, y);

		score = 0;

        loadGraphic("assets/images/cookie.png");

		scale.set(8, 8);
		updateHitbox();
    }

    override public function update(elaspsed:Float):Void 
    {
        super.update(elaspsed);
    }
	public function clickTheCookie()
	{
		score = score + (1 * scoreMultiplier);
		// trace(Std.string(score));
	}
}