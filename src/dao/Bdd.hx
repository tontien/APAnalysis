package dao;

import php.db.PDO;
import sys.db.Connection;

/**
 * Database creation with Mysql
 * @author tontien - EUW
 */
class Bdd
{
	
	public var cnx:Connection;

	public function new() 
	{
		cnx = PDO.open("");
	}
	
	public function close(){
		cnx.close();
	}
		    
	public function getCnx(){
		return cnx;
	}
	
}