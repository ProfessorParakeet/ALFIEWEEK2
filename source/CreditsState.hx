package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.app.Application;

class CreditsState extends MusicBeatState
{
	override function create()
	{
		super.create();
		var credits:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('shared/credits'));
		add(credits);
		FlxG.camera.fade(FlxColor.BLACK, 1.5, true);
		trace("credits should happen");
	}

	override function update(elapsed:Float)
	{
		if (controls.ACCEPT)
		{
			FlxG.switchState(new MainMenuState());
		}
		super.update(elapsed);
	}
}