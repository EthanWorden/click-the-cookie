package buttons;

import flixel.FlxG;

class Cursor extends BaseUpgrade
{
    public function new(x:Float, y:Float)
    {
		upgradeName = "Cursor";
        basePrice = 15;
		if (FlxG.save.data.cursorOwned != null)
		{
			timesPurchased = FlxG.save.data.cursorOwned;
			cost = Std.int(basePrice * Math.pow(1.15, timesPurchased));
		}
		else
		{
			timesPurchased = 0;
			cost = basePrice;
		}
        
		super(x, y);
    }
}