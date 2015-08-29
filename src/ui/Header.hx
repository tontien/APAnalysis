package ui;

/**
 * Header website. It's possible to handle meta balises for each page.
 * @author tontien - EUW
 */

class Header
{

	public function new() 
	{
		
	}
	
	// General function to display
	public function display(title:String, description:String)
	{	
		return '<!DOCTYPE html>
	<html lang="en">
	<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Tontien @EUW">
    <link rel="icon" href="../../favicon.ico">

    <title>AP analysis - League of Legends '
	+displayTitle(title)+
	'</title>

    <!-- Bootstrap core CSS -->
    <link href="http://www.meilleursjeux.net/APAnalysis/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="http://www.meilleursjeux.net/APAnalysis/bootstrap/css/customize.css" rel="stylesheet">
	
    <!-- Custom styles for this template -->
    <link href="starter-template.css" rel="stylesheet">
	
	<script src="http://www.meilleursjeux.net/APAnalysis/bootstrap/js/Chart.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>';
	}
	
	public function displayTitle(title:String)
	{
		if (title == null)
		{
			return "";
		}
		else
		{
			return title;
		}
	}
	
	public function displayDescription(description:String)
	{
		if (description == null)
		{
			return "";
		}
		else
		{
			return description;
		}
	}
	
}