package;

import flixel.FlxState;
import flixel.text.FlxText;

class PlayState extends FlxState
{
	var hello:String = "Hello World!";

	override public function create()
	{
		super.create();

		var helloText:FlxText = new FlxText();
		helloText.text = hello;
		add(helloText);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
