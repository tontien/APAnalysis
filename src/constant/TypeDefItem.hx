package constant;

/**
 * Definition JSON file (Item)
 * @author tontien - EUW
 */

typedef Item = {
	var basic:Int;
	var data:Map<String,BasicItem>;
	var type:String;
	var version:String;
}

typedef BasicItem = {
	var id:Int;
	var description:String;
	var name:String;
	var group:String;
}