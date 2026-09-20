package buttons;

import flixel.FlxSprite;

class BaseUpgrade extends FlxSprite
{
    public var cost:Int;
    public var basePrice:Int;
    public var timesPurchased:Int;

    public function new(x:Float, y:Float)
    {
        super(x, y);
    }

    public function buyUpgrade()
    {
        timesPurchased = timesPurchased + 1;

        cost = Std.int(basePrice * Math.pow(1.15, timesPurchased));
    }
}