package buttons;

import flixel.util.FlxTimer;

class Cursor extends BaseUpgrade
{
    public function new(x:Float, y:Float)
    {
        super(x, y);
        basePrice = 15;
        cost = basePrice;
        timesPurchased = 0;
    }
}