package buttons;

import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class BaseUpgrade extends FlxSpriteGroup
{
    public var cost:Int;
    public var basePrice:Int;
    public var timesPurchased:Int;
	public var upgradeName:String;
	var backing:FlxSprite;
	var upgradeText:FlxText;
	var costText:FlxText;
	var ownedText:FlxText;

    public function new(x:Float, y:Float)
    {
		super(x, y);

		backing = new FlxSprite();
		backing.makeGraphic(500, 150, FlxColor.GRAY);
		add(backing);

		upgradeText = new FlxText(10, 10);
		upgradeText.text = upgradeName;
		upgradeText.size = 50;
		add(upgradeText);

		costText = new FlxText(300, 10);
		costText.text = "$" + Std.string(cost);
		costText.size = 50;
		add(costText);
		ownedText = new FlxText(10, 70);
		ownedText.text = "Owned: " + Std.string(timesPurchased);
		ownedText.size = 50;
		add(ownedText);
    }

    public function buyUpgrade()
    {
        timesPurchased = timesPurchased + 1;

        cost = Std.int(basePrice * Math.pow(1.15, timesPurchased));
		costText.text = "$" + Std.string(cost);
		ownedText.text = "Owned: " + Std.string(timesPurchased);
    }
}