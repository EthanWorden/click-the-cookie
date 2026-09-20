package buttons;

import flixel.FlxG;

class Farm extends BaseUpgrade
{
    public function new(x:Float, y:Float)
    {
		upgradeName = "Farm";
        basePrice = 1100;
		if (FlxG.save.data.farmOwned != null)
		{
			timesPurchased = FlxG.save.data.farmOwned;
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