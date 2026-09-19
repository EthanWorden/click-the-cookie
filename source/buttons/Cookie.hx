package buttons;

import flixel.FlxSprite;

class Cookie extends FlxSprite
{
    public var score:Int = 0;

    public function new(x:Float, y:Float)
    {
        super(x, y);

        loadGraphic("assets/images/cookie.png");

        score = 0;
    }

    override public function update(elaspsed:Float):Void 
    {
        super.update(elaspsed);
    }
}