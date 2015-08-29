package ui;

import dao.ItemDao;
import dao.Bdd;
import php.Lib;

using StringTools;

/**
 * Analysis Page to point the difference between the two patches.
 * @author tontien - EUW
 */

class Analysis
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
            <a class="navbar-brand" href="http://www.meilleursjeux.net/APAnalysis/">AP analysis</a>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li><a href="http://www.meilleursjeux.net/APAnalysis/champions">Champions</a></li>
			  <li><a href="http://www.meilleursjeux.net/APAnalysis/items">Items</a></li>
			  <li class="active"><a href="http://www.meilleursjeux.net/APAnalysis/analysis">Analysis</a></li>
              <li><a href="http://www.meilleursjeux.net/APAnalysis/about">About</a></li>
            </ul>
          </div>
        </div>
      </nav>

      <div class="jumbotron">
        <h1>Analysis</h1>
        <p>Everybody can understand that you cannot do a deep analysis with just numbers. I watend to provide some insight about the numbers which have been detected. You will find a lot 
		of data and each time a little comment about it. I hope it will give you more information about League of Legends game.</p>
      </div>
	  
          <div class="table-responsive">
			<h2>Introduction</h2>
				<p>One patch can change the game, one patch can change the meta. No patch is the same, that is the rule you need to understand about League of Legends. Of course, one patch
				can bring more changes, for example we can take the patch for preseasons. The requirement was to compare Patch 5.11 and Patch 5.14: even if there were a lot of changes between
				each pack, I will try to show you the biggest changes.</p>
			
			<h2>The data</h2>
				<h3>Games by patch</h3>
				<p>
				Data comes from the data set provided by Riot for the API contest challenge: 20244 games were analysed with 9820 games on Patch 5.11 and 10424 on Patch 5.14.
				These games were played on EUW server. You can learn about the choices made on <a href="http://www.meilleursjeux.net/APAnalysis/about"><u>About page</u></a>. To analyze the numbers, I needed a lot of games
				for both patches, as you probably know, you cannot do neither analysis or study on a small sample of data. The number is not exactly the same between the two but it is not
				relevant as most of the data will be showed as per game.</p>
				<img src="http://www.meilleursjeux.net/APAnalysis/bootstrap/graphs/00_total_games.jpg" class="img-thumbnail" />			
				
				<h3>Games by gamemode</h3>
				<p>Before I parse the data, I hesitate a moment about the games I wanted to retrieve because the common belief is that ranked games are more serious. People will try hard more
				in order to win but for all soloq players around here, you know it is not always the truth. Leaving the normal games aside would false the data, a lot of players are still
				playing only on normal games.</p>
				<img src="http://www.meilleursjeux.net/APAnalysis/bootstrap/graphs/00_total_games_mode.jpg" class="img-thumbnail" />
				
				<h3>The players</h3>
				<p>Do not trust everything you read, not all players are bronze (they are not Diamond smurfs either). These graphs are interesting because you can see the distribution
				among the players. Most of them are still unranked, just for information, these statistics are coming from the ranked games.</p>
				<img src="http://www.meilleursjeux.net/APAnalysis/bootstrap/graphs/00_players.jpg" class="img-thumbnail" />
			
			<h2>Global analysis</h2>
			<h3>Winrate Champion</h3>
			<p>I should have played Galio instead of Ryze...</p>
			
			<h3>The best champions</h3>
			
			<h4>Galio</h4>
			<p>The biggest increase winrate is Galio with +7.09%  which is quite impressive: a winrate superior at 60% is very rare because most of the champions are balanced between all
			of them (Hello to Ezreal, Rengar, Xin and all champions pre nerfs...). Galio winrate can be explained with the change on AP items as it is the only champion you can build on AP
			and still pretty strong due to his passive: the more magic resistance you have, the more AP you get.</p>
			
			<h4>Veigar</h4>
			<p>I can understand how veigar could be a strong pick after these changes, if you get enough AP in the early game you can OS your ennemy easily, the fight will be a 5v4 quickly.
			As some items are cheaper (rabadon i am talking to you), the burst come quicker</p>
			
			<h4>Nocturne</h4>
			<p>Good luck to have a real explanation on this one, we can say that his shield is still very strong, especially against AP champions. But yeah, the night can scare a lot of
			people</p>
			<img src="http://www.meilleursjeux.net/APAnalysis/bootstrap/graphs/00_winrate_positive.jpg" class="img-thumbnail" />
			
			<h3>The worst champions</h3>
			<h4>Ryze</h4>
			<p>The nerfs on Ryze did not help him at all, what can we say? Nobody likes to be root 100% the time, it does not provide a real 1v1 in the early game. Apparently the 
			modification on AP items was not a good change for him either.</p>
			
			<h4>Trundle</h4>
			<p>Trundle is pick a little more but his winrate drops a lot, Yellowstar, what have you done? One particular note, his winrate in bottom lane jumps from 1.46 to 19% whic is
			probably one of the biggest jump between those patchs. Besides that, he is probably not the best champion for his category, do no feed toplane guys please.</p>
			
			<h4>Quinn</h4>
			<p>One more chance to explain you that Quinn is not a very good champion, her pickare was up but unfortunately it does not help her winrate. Maybe if you get a lot of practice on
			it. I have heard that you need to play like 1000 games to master a champion.</p>
			<img src="http://www.meilleursjeux.net/APAnalysis/bootstrap/graphs/00_winrate_negative.jpg" class="img-thumbnail" />
			
			<h3>Items</h3>
			<p>New AP items, cheaper items and the conclusion is reached quite easy, you build more AP items. Rylai Crystal Scepter is back! A pretty strong item to be tanky, he has AP stats
			and	still have a strong CC. <br />
			Needessly Large Rod is bought a lot more especially because the items becomes cheaper and it is still the only item who can give the most AP you can buy in the shop.</p>
			<img src="http://www.meilleursjeux.net/APAnalysis/bootstrap/graphs/00_items_difference.jpg" class="img-thumbnail" />
				
			<h3>About the wards</h3>
			<p>As I said just before, you can afford easily AP items now: you do not need to wait 1600gold to buy the big item. In fact you can buy the AP items you want now, but that means
			less gold to ward. We can see clearly this change has a strong impact on vision. But you know, you still need to buy wards guys!</p>
			<img src="http://www.meilleursjeux.net/APAnalysis/bootstrap/graphs/00_wards.jpg" class="img-thumbnail" />
			<img src="http://www.meilleursjeux.net/APAnalysis/bootstrap/graphs/00_wards_placed.jpg" class="img-thumbnail" />
			
			<h3>Objectives Average</h3>
			<p>Objectives Average statistics is probably the strongest indicator to show that AP items did not change the core of the game. The objectives are almost the same, one thing
			we can highlight is that the games last less time in Patch 5.14 (which can also explain you have less objectives per game). </p>
			<table class="table table-hover table-bordered table-striped">
				<thead>
					<tr>
					  <th></th>
					  <th>Dragons</th>
					  <th>Barons</th>
					  <th>Towers</th>
					  <th>Inhibitors</th>
					  <th>Time</th>
					</tr>
				</thead>
				<tbody>
					<tr class="info">
						<td>Patch 5.11</td>
						<td>3.64</td>
						<td>0.79</td>
						<td>12.17</td>
						<td>2.31</td>
						<td>36.05</td>
					</tr>
					<tr class="info">
						<td>Patch 5.14</td>
						<td>3.56</td>
						<td>0.82</td>
						<td>12.17</td>
						<td>2.24</td>
						<td>35.33</td>
					</tr>
				</tbody>
            </table>
						
			<h3>Dragon kills</h3>
			<p>The average statistics did not change but if we go into deeper into the numbers, you can find this graph explaining the chance of winrate linked to the number of dragons killed.
			You know that only with 2 dragons you have already more chace to win. Just thanks a lot to the team who lost with 7 dragons, how is it possible, you had the buff!</p>
			<img src="http://www.meilleursjeux.net/APAnalysis/bootstrap/graphs/00_win_dragonkills.jpg" class="img-thumbnail" />
			
			<h3>Win with the first</h3>
			<p>The stats also did not change with the different patches but one thing you can notice: it is not lost at all if you did not get the first Baron. Unfortunately if you lost the
			inhibitor first, you have pretty good chance to loose the game, however all players already won a game that they thought they will loose at 95% . The story: always tryhard to win
			your games!</p>
			<img src="http://www.meilleursjeux.net/APAnalysis/bootstrap/graphs/00_win_first.jpg" class="img-thumbnail" />
			
			<h3>The metagame</h3>
			<h4><u>Champion Category</u></h4>
			<p> To have more details, it was impossible to do it only with the lanes, that\'s about that time we introduce the category idea for champion.
			According to Riot API, there are 5 categories: Assassin, Fighter, Mage, Marksman, Support, Tank. What I discover quickly is that one champion can be in several categories 
			(If we take Aatrox as example, he is flagged as Fighter and Tank. But for the propice of this study, I wanted to make it more simple so I assume that one Champion can be in only one 
			Category. I modify a little bit the tags coming from the API.<br /><br />
			But in order to do so, I create a little algorithm i will try to explain:</p>
			
			<img src="http://www.meilleursjeux.net/APAnalysis/bootstrap/graphs/00_algorithm_champion.jpg" class="img-thumbnail" /><br /><br />
			
			<p>I did change some champions manually because it would be weird to let the result given by the algorithm (Hello Assassin Karthus, we all know you are not even one, just a 
			fed mage who press R to steal all the kills!)</p>
			
			<h4>Pickrate</h4>
			<p>We can learn a lot about this graph. First, you can find a big difference between the winrate by lane and the winrate by category. After put one category for each of these 
			champions, you can determine the pickrate for all roles. What is funny is that Mage pickrate was not too big, you even lost some points. But there was a strategy orchestred 
			by the the others: If you want to beat AP, build Assassin, they will not to have time to burst you</p>
			<img src="http://www.meilleursjeux.net/APAnalysis/bootstrap/graphs/01_category_pickrate.jpg" class="img-thumbnail" />
			
			<h4>Winrate</h4>
			<p>Even if you pick less Ap champions as shown previously, it does not mean that you will loose the game. At patch 5.14, you win around 0.75 point for the winrate as a Mage.
			If you compare this with all games analysed, it is pretty impressive, the Mage champions were favorite during the games. Unfortunately, it was not a good time to play Support...</p>
			<img src="http://www.meilleursjeux.net/APAnalysis/bootstrap/graphs/01_category_winrate.jpg" class="img-thumbnail" />
			
			<h2>Wall of fame</h2>
			<p>I really like doing all of these reports, there was a lot of information indeed. Of course the major issue is to find something relevant and find a way to display it.
			Anyway we will finish with all of these numbers with a Wall of fame. Find about the different awards in League of Legends game.</p>
			<table class="table table-hover table-bordered table-striped">
				<thead>
					<tr>
					  <th>Champion</th>
					  <th>Award Category</th>
					  <th>Description</th>
					  <th>Number</th>
					  <th>Average</th>
					</tr>
				</thead>
				<tbody>
					<tr class="info">
						<td>Akali</td>
						<td>Most kills</td>
						<td>I will carry you</td>
						<td>10.84</td>
						<td>6.94</td>
					</tr>
					<tr class="info">
						<td>Yasuo</td>
						<td>Most deaths</td>
						<td>No I am not feeding</td>
						<td>8.89</td>
						<td>7.04</td>
					</tr>
					<tr class="info">
						<td>Janna</td>
						<td>Most assists</td>
						<td>Do you want my shield?</td>
						<td>16.94</td>
						<td>9.64</td>
					</tr>
					<tr class="info">
						<td>Janna</td>
						<td>Best KDA</td>
						<td>You cannot touch me</td>
						<td>3.59</td>
						<td>2.38</td>
					</tr>
					<tr class="info">
						<td>Master Yi</td>
						<td>Worst KDA</td>
						<td>Our jungler is bad</td>
						<td>1.83</td>
						<td>2.38</td>
					</tr>
					<tr class="info">
						<td>Soraka</td>
						<td>Lowest Level</td>
						<td>I need more XP guys</td>
						<td>14.12</td>
						<td>15.34</td>
					</tr>
					<tr class="info">
						<td>Master Yi</td>
						<td>Most Pentakills</td>
						<td>Let me penta, let me penta</td>
						<td>1.52%</td>
						<td>0.26%</td>
					</tr>
					<tr class="info">
						<td>Draven</td>
						<td>Gold earned</td>
						<td>My passive is better than yours</td>
						<td>14532</td>
						<td>12113</td>
					</tr>
					<tr class="info">
						<td>Lucian</td>
						<td>Most Creeps</td>
						<td>*Ping* *Ping* I need the wave</td>
						<td>207</td>
						<td>125</td>
					</tr>
					<tr class="info">
						<td>Janna</td>
						<td>Wards places</td>
						<td>You should consider myself as a support</td>
						<td>24</td>
						<td>9</td>
					</tr>
				</tbody>
            </table>
			
			<h2>The last but not the least</h2>
			<p>After a deep analysis, I notice you have 50% chance to win a game. I did not trust it right away, but after I have done the calculations several times, I reach the
			conclusion that it is possible to win. Improve on your game, do not flame and you will climb ! See you soon on the Summoner Rift summoners.</p>
			<img src="http://www.meilleursjeux.net/APAnalysis/bootstrap/graphs/00_win_chance.jpg" class="img-thumbnail" />
			
			
          </div>
    	'
	+return new Footer().display() +
	'
     </div>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="/bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>';
	}
	
}
