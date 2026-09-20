package buttons;

import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class BaseUpgrade extends FlxSprite
{
    public var cost:Int;
    public var basePrice:Int;
    public var timesPurchased:Int;
	public var upgradeName:String;

    public function new(x:Float, y:Float)
    {
        super(x, y);
		makeGraphic(500, 150, FlxColor.GRAY);

		var upgradeText:FlxText = new FlxText();
		upgradeText.text = upgradeName;
		upgradeText.size = 50;
		stamp(upgradeText, 10, 10);

		var costText:FlxText = new FlxText();
		costText.text = "$" + Std.string(cost);
		costText.size = 50;
		stamp(costText, 300, 10);
    }

    public function buyUpgrade()
    {
        timesPurchased = timesPurchased + 1;

        cost = Std.int(basePrice * Math.pow(1.15, timesPurchased));
    }
}