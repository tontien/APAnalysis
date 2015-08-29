package ui;

import dao.ChampionDao;
import dao.Bdd;
import php.Lib;

using StringTools;

/**
 * Champions Page with all champions sort by Category
 * @author tontien - EUW
 */

class Champions
{

	public function new() 
	{

	}
	
	// General function to display
	public function display()
	{
		return new Header().display(" - Champion","")+

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
              <li class="active"><a href="http://www.meilleursjeux.net/APAnalysis/champions">Champions</a></li>
			  <li><a href="http://www.meilleursjeux.net/APAnalysis/items">Items</a></li>
			  <li><a href="http://www.meilleursjeux.net/APAnalysis/analysis">Analysis</a></li>
              <li><a href="http://www.meilleursjeux.net/APAnalysis/about">About</a></li>
            </ul>
          </div>
        </div>
      </nav>

      <div class="jumbotron">
        <h1>Champions</h1>
        <p>Each champion belongs to one category among Assassin, Fighter, Mage, Marksman, Support and Tank. You can find more information about the category in the Analysis page.
		Click on one champion to have more details about his statistics (Winrate, KDA, Items...).
		</p>
      </div>
	  
          <div class="table-responsive">'
			+champion()+
          '</div>

    </div>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://www.meilleursjeux.net/APAnalysis/bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>';
	}
	
	public function champion()
	{
		var bdd = new Bdd();
		var championDao = new ChampionDao(bdd);
		var results_tags = championDao.selectAllTag();
		
		var affichage = '';
		for (s in results_tags)
		{
			affichage = affichage +'<h2 class="sub-header">' + s.tag +'</h2><table><tr>';
			var results = championDao.selectAllChampion();
			for (r in results)
			{
				if (s.tag == r.tag)
				{
					if (r.keyChampion == "Teemo" || r.keyChampion == "Lissandra" || r.keyChampion == "Varus" || r.keyChampion == "Volibear" || r.keyChampion == "Xerath")
					{
						affichage = affichage+'</tr><td width="75" height="75"><a href="http://www.meilleursjeux.net/APAnalysis/champion/' + r.keyChampion +'"><img src="http://ddragon.leagueoflegends.com/cdn/5.15.1/img/champion/' + r.keyChampion + '.png" class="img-rounded" height="58" width="58" /><br />' + r.keyChampion+'</a></td>';
					}
					else 
					{
						affichage = affichage+'<td width="75" height="75"><a href="http://www.meilleursjeux.net/APAnalysis/champion/' + r.keyChampion +'"><img src="http://ddragon.leagueoflegends.com/cdn/5.15.1/img/champion/' + r.keyChampion + '.png" class="img-rounded" height="58" width="58" /><br />' + r.keyChampion+'</a></td>';
					}
				
				}
			}
			affichage = affichage +'</tr></table>';
        }
		affichage = affichage +'<br /><br />'
	+return new Footer().display();
				
		return affichage;
	}
	
}