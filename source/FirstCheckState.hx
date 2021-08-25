package;

import lime.app.Application;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import MainVariables._variables;
#if windows
import Discord.DiscordClient;
#end

class FirstCheckState extends MusicBeatState
{

	override public function create()
	{
		FlxG.mouse.visible = false;

		#if windows
		DiscordClient.initialize();

		Application.current.onExit.add (function (exitCode) {
			DiscordClient.shutdown();
		 });
		#end

		PlayerSettings.init();
		ModifierVariables.modifierSetup();
		ModifierVariables.loadCurrent();

		super.create();
	}

	override public function update(elapsed:Float)
	{
		switch (_variables.firstTime)
		{
			case true:
				FlxG.switchState(new FirstTimeState()); // First time language setting
			case false:
				FlxG.switchState(new TitleState()); // First time language setting
		}
	}
}
