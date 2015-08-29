package parser;

import constant.Constant;
import constant.TypeDefItem;
import dao.ItemDao;
import dao.Bdd;
import php.Lib;
import haxe.Http;

using StringTools;

/**
 * Class to parse data coming from RiotGames API (Item)
 * @author tontien - EUW
 */
class ParserItem
{

	public function new() 
	{
		
	}
	
	public function parserItem(version:String)
	{
		var s = Http.requestUrl("https://" + Constant.GLOBAL_SERVER +"/api/lol/static-data/euw/v1.2/item?version=" + version + "&api_key=" + Constant.API_KEY);
		
		var itemLine:Item = haxe.Json.parse(s);
		
		var bdd = new Bdd();
		var itemDao = new ItemDao(bdd);
		
		for (item in Reflect.fields(itemLine.data))
		{
			var basicItem:BasicItem = Reflect.field(itemLine.data, item);
			itemDao.insertItem(basicItem.id, basicItem.description.replace("'"," "), basicItem.name.replace("'"," "), basicItem.group.replace("'"," "), itemLine.version);
		}

	}
	
}