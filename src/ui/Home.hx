package ui;

import dao.ChampionDao;
import dao.Bdd;

using StringTools;

/**
 * Home Page: A table to put the winrate and pickrate for each champions following the patches
 * @author tontien - EUW
 */

class Home
{

	public function new() 
	{

	}
	
	// General function to display
	public function display()
	{
		return new Header().display(null,"")+

  '<body>

    <div class="container">

      <nav class="navbar navbar-inverse">
        <div class="container-fluid">
          <div class="navbar-header">
            <a class="navbar-brand" href="http://www.meilleursjeux.net/APAnalysis">AP analysis</a>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li><a href="http://www.meilleursjeux.net/APAnalysis/champions">Champions</a></li>
			  <li><a href="http://www.meilleursjeux.net/APAnalysis/items">Items</a></li>
			  <li><a href="http://www.meilleursjeux.net/APAnalysis/analysis">Analysis</a></li>
              <li><a href="http://www.meilleursjeux.net/APAnalysis/about">About</a></li>
            </ul>
          </div>
        </div>
      </nav>

      <div class="jumbotron">
        <h1>AP analysis</h1>
        <p>Learn more information about the impact of AP items change. You will see the difference between two patches: 5.11 and 5.14. A lot of statistics for each champion, the impact
		for each AP item and then a deep study of the data analysed.</p>
      </div>
	  
          <div class="table-responsive">
            <table class="table table-hover table-bordered table-striped">
              <thead>
                <tr>
                  <th></th>
                  <th>Champion</th>
                  <th>Winrate (5.11)</th>
                  <th>Winrate (5.14)</th>
				  <th>Winrate difference</th>
				  <th>Pickrate (5.11)</th>
				  <th>Pickrate (5.14)</th>
				  <th>Pickrate difference</th>
                </tr>
              </thead>
              <tbody>'
                +champion()+
				'</tbody>
            </table>
			'
	+return new Footer().display() +
	'
          </div>

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
		var results = championDao.selectChampion();
		
		var affichage = '';
        for (r in results)
		{
            affichage = affichage+displayLine(Math.round(r.winrate * 100) / 100)+'<td><a href="http://www.meilleursjeux.net/APAnalysis/champion/' + r.keyChampion +'"><img src="http://ddragon.leagueoflegends.com/cdn/5.15.1/img/champion/' + r.keyChampion + '.png" class="img-rounded" height="42" width="42" /></a></td><td><a href="http://www.meilleursjeux.net/APAnalysis/champion/' + r.keyChampion +'">' + r.name+'</a> </td><td>' + Math.round(r.winrate11 * 100) / 100 + '%</td><td>' + Math.round(r.winrate14 * 100) / 100 + '%</td><td>' + displayFont(Math.round(r.winrate * 100) / 100) + '</td><td>' + Math.round(r.pickrate11 * 100) / 100 + '%</td><td>' + Math.round(r.pickrate14 * 100) / 100 + '%</td><td>' + Math.round((r.pickrate14 - r.pickrate11)*100)/100 + '</td></tr>';
        }
		
		return affichage;
	}
	
	public function displayFont(i:Float)
	{
		if (i > 0)
		{
			return '<font color="#347d7b"><strong>'+i+'</strong></font>';
		} 
		else 
		{
			return '<font color="#af1e2c"><strong>'+i+'</strong></font>';
		}
	}
	
	public function displayLine(i:Float)
	{
		if (i > 0)
		{
			return '<tr class="success">';
		} 
		else 
		{
			return '<tr class="danger">';
		}
	}
	
}