import parser.*;
import php.Lib;
import haxe.Http;
import sys.io.File;
import sys.io.FileInput;
import haxe.io.Eof;
import haxe.web.Dispatch;
import php.Web;
import haxe.web.Request;

using StringTools;

/**
 * Main function
 * @author tontien - EUW
 */

	
class Main 
{
	// You Main function
	static function main() 
	{
		//parse();
		display();
	}
	
	public function new()
    {
		
    }
	
	// Parse function (matchs, champions, items)
	public static function parse()
    {
		////////////////// Parsing Match Data ////////////////////
		
		var parser = new parser.Parser();
				
		var file:FileInput = File.read('/rsc/5.11/NORMAL_5X5/EUW.json');
		var file:FileInput = File.read('/rsc/5.14/NORMAL_5X5/EUW.json');
		
		var file:FileInput = File.read('/rsc/5.11/RANKED_SOLO/EUW.json');
		var file:FileInput = File.read('/rsc/5.14/RANKED_SOLO/EUW.json');
		
			var lineNum = 0;
			while( true )
			{
				try
				{
					var str = file.readLine();
					if (str != "[" && str != "]") {
						parser.parser(str.replace(", ", ""));
					}
					lineNum++;
				} 
				catch (Exception:Eof) { Lib.print(" "); }
				catch (unknown : Dynamic) { "Unknown exception : "+Std.string(unknown); } ;
			}
		
		////////////////// Parsing Item Data ////////////////////
		
		
		var parserItem = new ParserItem();
		parserItem.parserItem("5.14.1");
		
		
		////////////////// Parsing Champion Data ////////////////////
		
		
		var parserChampion = new ParserChampion();
		parserChampion.parserChampion("5.15.1");
		
    }
	
	// Display function for the interface
	public static function display()
	{
		var url = Request.getURI().split(ActionController.BASE_URL)[1];
		Dispatch.run(url, Request.getParams(), new ActionController());
	}
}