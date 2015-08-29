import ui.*;
import php.Lib;
import haxe.web.Dispatch;

/**
 * ActionController: Used Dispatch function in order to display the right page according to the url website
 * @author tontien - EUW
 */

class ActionController
{
	static public inline var BASE_URL:String = "/APAnalysis/";

	public function new() 
	{
	}
	
	// Default page and Home
	public function doDefault(dispatcher:Dispatch)
	{
		Lib.print(new Home().display());
		
	}
	
	// Page Champions
	public function doChampions(dispatcher:Dispatch)
	{
		Lib.print(new Champions().display());
	}
	
	// Page About
	public function doAbout(dispatcher:Dispatch)
	{
		Lib.print(new About().display());
	}
	
	// Page Analysis
	public function doAnalysis(dispatcher:Dispatch)
	{
		Lib.print(new Analysis().display());
	}
	
	// Page Champion details
	public function doChampion(dispatcher:Dispatch, name:String)
	{
		Lib.print(new Champion().display());
	}
	
	// Page Items
	public function doItems(dispatcher:Dispatch)
	{
		Lib.print(new Items().display());
	}
	
}