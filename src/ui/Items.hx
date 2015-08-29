package ui;

import dao.ItemDao;
import dao.Bdd;
import php.Lib;

using StringTools;

/**
 * Items Page with all the items purchased during the games.
 * @author tontien - EUW
 */

class Items
{

	public function new() 
	{

	}
	
	// General function to display
	public function display()
	{
		return new Header().display(" - Items","")+

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
			  <li class="active"><a href="http://www.meilleursjeux.net/APAnalysis/items">Items</a></li>
			  <li><a href="http://www.meilleursjeux.net/APAnalysis/analysis">Analysis</a></li>
              <li><a href="http://www.meilleursjeux.net/APAnalysis/about">About</a></li>
            </ul>
          </div>
        </div>
      </nav>

      <div class="jumbotron">
        <h1>Items purchased per game</h1>
        <p>All of these data were not possible without having data about the items itself. You can find the items who were purchased a lot during the two patchs analysed. Find on this page
		the items who were built more after AP items change patch.</p>
      </div>
	  
        <div class="table-responsive">
            <table class="table table-hover">
              <thead>
                <tr>
                  <th></th>
                  <th>Item</th>
                  <th>Average 5.11</th>
                  <th>Average 5.14</th>
				  <th>Difference</th>
                </tr>
              </thead>
              <tbody>'
                +items()+
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
	
	public function items()
	{
		var bdd = new Bdd();
		var itemDao = new ItemDao(bdd);
		var resultsItems = itemDao.selectItems();
		
		var affichage = '';
        for (itemIterator in resultsItems)
		{
            affichage = affichage+'<tr class="info"><td><img src="http://ddragon.leagueoflegends.com/cdn/5.14.1/img/item/' + itemIterator.item_id + '.png" class="img-rounded" height="42" width="42" /></td><td>' + itemIterator.name +'</td><td>' + Math.round(itemIterator.item_11 * 100) / 100 + '</td><td>' + Math.round(itemIterator.item_14 * 100) / 100 + '</td><td>' + displayFont(Math.round(itemIterator.diff *100)) + '%</td></tr>';
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
	
}