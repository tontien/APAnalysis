package constant;

/**
 * Definition JSON file (Champion)
 * @author tontien - EUW
 */

typedef Champion = {
	var data:Map<String,BasicChampion>;
	var type:String;
	var version:String;
}

typedef BasicChampion = {
	var id:Int;
	var title:String;
	var name:String;
	var key:String;
	var tags:Array<String>;
}