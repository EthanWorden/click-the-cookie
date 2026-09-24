package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import lime.app.Application;

class MainMenuState extends FlxState
{
    var versionText:FlxText = new FlxText();

    override public function create()
    {
        super.create();
        versionText = new FlxText(5, FlxG.height - 20, 0, "v" + Application.current.meta.get("version"), 12);
		add(versionText);
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);
    }
}