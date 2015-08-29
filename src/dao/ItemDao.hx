package dao;

import php.Lib;

/**
 * Database interface for Item Data
 * @author tontien - EUW
 */

class ItemDao
{
	var bdd:Bdd;

	public function new(bd:Bdd) 
	{
		bdd = bd;
	}
	
	// Parsing functions
	public function insertItem(id:Int, description:String, name:String, group:String, version:String)
	{
		bdd.getCnx().request("insert into Item (item_id, description, name, group_item, version) values (" + id + ",'" + description +"','" + name +"','" + group +"','" + version +"')");
	}
	
	// UI functions
	public function selectItems()
	{
		return bdd.getCnx().request("SELECT item.item_id, dtw_item14.name, dtw_item11.amount as item_11, dtw_item14.amount as item_14, (dtw_item14.amount-dtw_item11.amount)/dtw_item14.amount as diff FROM dtw_item11, dtw_item14, item where dtw_item11.name = dtw_item14.name and item.name = dtw_item14.name and item.version='5.14.1' HAVING dtw_item11.amount > 0.1 order by diff desc");
	}
	
}
