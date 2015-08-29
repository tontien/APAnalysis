package parser;

import constant.Constant;
import constant.TypeDefChampion;
import dao.ChampionDao;
import dao.Bdd;
import php.Lib;
import haxe.Http;

using StringTools;

/**
 * Class to parse data coming from RiotGames API (Champion)
 * @author tontien - EUW
 */
class ParserChampion
{

	public function new() 
	{
		
	}
	
	public function parserChampion(version:String)
	{
		var s = Http.requestUrl("https://" + Constant.GLOBAL_SERVER +"/api/lol/static-data/euw/v1.2/champion?champData=tags&version=" + version + "&api_key=" + Constant.API_KEY);
		
		var championLine:Champion = haxe.Json.parse(s);
		
		var bdd = new Bdd();
		var championDao = new ChampionDao(bdd);
		
		for (champion in Reflect.fields(championLine.data))
		{
			var basicChampion:BasicChampion = Reflect.field(championLine.data, champion);
			championDao.insertChampion(basicChampion.id, basicChampion.title.replace("'", " "), basicChampion.name.replace("'", " "), basicChampion.key.replace("'", " "), championLine.version);
			
			for (tag in basicChampion.tags) {
				championDao.insertChampionTag(basicChampion.name.replace("'", " "),tag);
			}
		}

	}
	
}