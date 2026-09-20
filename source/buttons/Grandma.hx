package buttons;

import flixel.FlxG;

class Grandma extends BaseUpgrade
{
    public function new(x:Float, y:Float)
    {
		upgradeName = "Grandma";
        basePrice = 100;
		if (FlxG.save.data.grandmaOwned != null)
		{
			timesPurchased = FlxG.save.data.grandmaOwned;
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