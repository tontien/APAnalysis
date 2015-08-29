#AP Analysis

## Live website
The demo can be found at: [AP Analysis](http://www.meilleursjeux.net/APAnalysis)

## The project
AP Analysis is a tool where you can discover throught graphs and statistics the impact of the change on AP items. 
This project is divided in three parts:

1) Framework to parse the data .json files

2) Website creation

3) A deep analysis about this impact

More information on [About page](http://www.meilleursjeux.net/APAnalysis/about/)

## TODO List

* Compare all regions (parse the rest of the data)
* Use the timelines events (I will probably say the Mage have an advantage in the early game)
* Dig deeper into the use of AP items
* Create the interactive website (live)

# Build the project

## Technologies used

* Server Code: Haxe
* Database: Mysql
* Template Website: BootStrap
* Graphic Library: Chartjs

## Installation

### Database
In order to parse the data from json files, you need to create the database first. You can find at the root folder a SQL script "BDD_DDL_Script.sql". If you only want to run the website, only the dtw_tables can be imported. In this project, I choose to parse all data in development side and aggregate them in tables used by the website. (You will only also need to import the referential tables champions and items).

### Configuration

Your API key in constant/Constant.hx

    public static inline var API_KEY:String = "MORDE-IS-THE-KING";

Your database in dao/Bdd.hx

    // Syntax is PDO.open("mysql:dbname=database;host=server", "user", "password", "options");
    cnx = PDO.open("");

### Compile the project

    haxe  -cp src -php 'path_to_compile' -main Main

And then you can be able to your localhost server.
