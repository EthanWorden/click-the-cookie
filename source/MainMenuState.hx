package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import lime.app.Application;

class MainMenuState extends FlxState
{
	var menuBG:FlxSprite = new FlxSprite();
    var versionText:FlxText = new FlxText();
	var titleText:FlxText = new FlxText();
	var playButton:FlxButton;

    override public function create()
    {
        super.create();
		menuBG.loadGraphic("assets/images/menuBG.png");
		add(menuBG);
        versionText = new FlxText(5, FlxG.height - 20, 0, "v" + Application.current.meta.get("version"), 12);
		add(versionText);
		titleText.text = "Click the Cookie!";
		titleText.y = 25;
		titleText.x = 25;
		titleText.size = 50;
		add(titleText);
		playButton = new FlxButton(25, 150, "Play", playButtonClicked);
		add(playButton);
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);
    }
	function playButtonClicked()
	{
		FlxG.switchState(new PlayState());
	}
}