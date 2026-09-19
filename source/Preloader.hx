package;

import flixel.system.FlxBasePreloader;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;

@:bitmap("assets/images/preloader.png") class PreloaderImage extends BitmapData {}

class Preloader extends FlxBasePreloader
{
    public function new(MinDisplayTime:Float = 0)
    {
        super(2);
    }

    override public function create() 
    {
        super.create();

        var image = new Sprite();
        image.addChild(new Bitmap(new PreloaderImage(0, 0)));
        addChild(image);
    }
}