package ui;

import dao.ItemDao;
import dao.Bdd;
import php.Lib;

using StringTools;

/**
 * About Page to learn more about the project, the author and the technologies used.
 * @author tontien - EUW
 */

class About
{

	public function new() 
	{

	}
	
	// General function to display
	public function display()
	{
		return new Header().display(" - Analysis","")+

  '<body>

    <div class="container">

      <nav class="navbar navbar-inverse">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="http://www.meilleursjeux.net/APAnalysis">AP analysis</a>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li><a href="http://www.meilleursjeux.net/APAnalysis/champions">Champions</a></li>
			  <li><a href="http://www.meilleursjeux.net/APAnalysis/items">Items</a></li>
			  <li><a href="http://www.meilleursjeux.net/APAnalysis/analysis">Analysis</a></li>
              <li class="active"><a href="http://www.meilleursjeux.net/APAnalysis/about">About</a></li>
            </ul>
          </div>
        </div>
      </nav>

      <div class="jumbotron">
        <h1>More about this project</h1>
        <p>Find more information about the project, the different steps involved during this process, how the project evolved and especially which technologies were used on this website. 
		As you may know, all the source of this project can be find on GitHub. Finally, you will able to read some part about me if you are interested (see you on EUW server guys!)</p>
      </div>
	  
      <div class="table-responsive">
		<h2>The project</h2>
		<p>
		This procject has been created during August 2015 for Riot API Challenge. The goal is to provide analysis following the subject:</p>
		<blockquote>Given two data sets of match IDs, one before the AP Item changes and another one after, create a piece of software to demonstrate changes in AP Item usage.
		<footer><u><a href="https://developer.riotgames.com/discussion/announcements/show/2lxEyIcE" target=_"blank">More about the context</a></u></footer></blockquote>
		
		<p>The project could be divided in three different subjects</p>
		
		<h3>Parsing the data</h3>
		<p>It was the first time that I use the Riot API, the first challenge was to parse all games from the .json files. I neeeded a server programmation to realize it and at this
		time I thought about Haxe code. I discover it a few years ago when I make the publicity of a website specialized in online games playable via a browser (you can google it by searching
		Motion Twin). Anyway back then, I wanted to try haxe but did not have the time. It was the best opportunity to try it (and learn it by the way). I also knew it will be possible
		to do the client side with the php compiler.<br /><br />
		
		I did use some time to analyse the API and parse all the games in order to have all data in MySql Database. I did not look for another type, I knew it was convenient and already
		use it as it is the most common database for the websites. I had to do a choice about the data itself, I knew i could not have the time to parse the entire data sets provided by 
		Riot games. Finally i choose to parse EUW data (some of the normal games, some of ranked games) for both patches.</p>
		
		<h3>Create the website</h3>
		
		<p>Once I got all information in my database, I needed to create the website. I have a pretty good idea for what I wanted to show: the champions, some statistics, the items...
		I decided to use Bootstrap for the graphic chart, I was never good for the Css type of things, always prefer the back end development that is why this framework helps me a lot 
		and save my time. For the rest of the pages, I search for a tool where I could draw some graphs and I felt in love with ChartJs. Maybe you can find other libraries in Javascript 
		which could do the same better but it was the final choice.</p>
		
		<h3>Deep into the analysis</h3>
		<p>During the creation of the website, I figure that I found other statistics which would be difficult to present on the site. I mean you need some coherence in the different pages,
		so I decided to create another page called "Analysis". What I wanted to show is that of course the change of AP items impacts the game, but it was not on only one dimension (Champion
		winrate) but on several dimensions (Essbase if you hear me). Finally, I think I realize at this point how rich League of Legends can be and how many things you can do. </p>
		
		<h2>About me</h2>
		<p>First and foremost, I am a french (Renekton, i am french) guy who is passionnate by League of Legends. At this moment I am a project manager in a bank company, but still
		in the technical side. I did not have the chance to participate to the contest earlier this year but when I saw the announcement about the second, I jump into it as I always wanted
		to take a look about the API but did not have time before.<br />
		I started on the Internet creating the Webiste <u><a href="http://www.meilleursjeux.net" target="_blank">Meilleurs Jeux</a></u> (It is in french sorry!). One thing I really love is
		this game, in fact I played League of Legends since 2010 (Loved old old Mordekaiser ^^ ), these two ideas combined will give this prototype about the analysis on AP items. Anyway, if
		you have any question you can find me on EUW server :)
		</p>
			
		<h2>Technologies used</h2>
		<dl class="dl-horizontal">
			<dt>Server Code</dt>
			<dd>Haxe</dd>
			<dt>Database</dt>
			<dd>Mysql</dd>
			<dt>Template Website</dt>
			<dd>BootStrap</dd>
			<dt>Graphic Library</dt>
			<dd>Chartjs</dd>
		</dl>  
      </div>
    	'
	+return new Footer().display() +
	'
     </div>
	



    <!-- Bootstrap core JavaScript
    ================================================== -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://www.meilleursjeux.net/APAnalysis/bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>';
	}
	
}