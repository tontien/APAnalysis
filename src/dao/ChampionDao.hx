package dao;

import php.Lib;

/**
 * Database interface for Champion Data
 * @author tontien - EUW
 */

class ChampionDao
{
	var bdd:Bdd;

	public function new(bd:Bdd) 
	{
		bdd = bd;
	}
	
	// Parsing functions
	public function insertChampion(id:Int, title:String, name:String, key:String, version:String)
	{
		bdd.getCnx().request("insert into Champion (championId, title, name, keyChampion, version) values (" + id + ",'" + title +"','" + name +"','" + key +"','" + version +"')");
	}
	
	public function insertChampionTag(id:String, tag:String)
	{
		bdd.getCnx().request("insert into Champion_tags (keyChampion, tag) values ('" + id + "','" + tag +"')");
	}
	
	// UI functions
	public function selectChampion()
	{
		return bdd.getCnx().request("select champion.keyChampion, dtw_champion11.name, dtw_champion11.winrate as winrate11, dtw_champion14.winrate as winrate14, dtw_champion14.winrate - dtw_champion11.winrate as winrate, dtw_champion11.game/98198*1000 as pickrate11, dtw_champion14.game/104237*1000 as pickrate14 from dtw_champion11, dtw_champion14, champion where dtw_champion11.name = dtw_champion14.name and dtw_champion11.name = champion.name group by dtw_champion11.name ORDER BY name  ASC");
	}
	
	public function selectAllTag()
	{
		return bdd.getCnx().request("select distinct champion_tags.tag as tag from champion_tags order by tag");
	}
	
	public function selectAllChampion()
	{
		return bdd.getCnx().request("select champion.name, champion.title, champion.keyChampion, champion_tags.tag as tag from champion, champion_tags where champion.name = champion_tags.keyChampion order by tag,name");
	}
	
	public function selectLane(champion:String)
	{
		return bdd.getCnx().request("select * from dtw_champion_role where name='"+champion+"' order by lane");
	}
	
	public function selectMode(champion:String)
	{
		return bdd.getCnx().request("select * from dtw_champion_mode where name='"+champion+"' order by queueType");
	}
	
	public function selectKDA(champion:String)
	{
		return bdd.getCnx().request("select * from dtw_champion_kda where name='"+champion+"' order by version");
	}
	
	public function selectItem_11(champion:String)
	{
		return bdd.getCnx().request("select item.item_id, item.name, dtw_item.version, sum(amount) as amount from dtw_item,item where dtw_item.name = item.name and keyChampion='"+champion+"' and dtw_item.version='5.11.0.270' and item.version='5.11.1' and item.name not like '%Enchantment%' group by dtw_item.name, dtw_item.version ORDER BY amount DESC LIMIT 0,7");
	}
	
	public function selectItem_14(champion:String)
	{
		return bdd.getCnx().request("select item.item_id, item.name, dtw_item.version, sum(amount) as amount from dtw_item,item where dtw_item.name = item.name and keyChampion='"+champion+"' and dtw_item.version='5.14.0.329' and item.version='5.14.1' and item.name not like '%Enchantment%' group by dtw_item.name, dtw_item.version ORDER BY amount DESC LIMIT 0,7");
	}
	
}
