package ui;

import dao.ChampionDao;
import dao.Bdd;
import php.Lib;
import php.Web;
import haxe.web.Dispatch;

using StringTools;

/**
 * Champion Page detail with statistics for the champion selected for both patches
 * @author tontien - EUW
 */

class Champion
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
		var results = championDao.selectAllChampion();
		var affichage = "";
		
		var champion = Web.getURI().substring(20, 50).replace("/", "");
		
		// Winrate Lane Data Generation
		var resultLane = championDao.selectLane(champion);
		var lane_11_role = new Array();
		var lane_14_role = new Array();
		var lane_11_number = new Array();
		var lane_14_number = new Array();
		var totallane_11 = 0;
		var totallane_14 = 0;
		
		var i = 0;
		
		for (LaneIterator in resultLane)
		{
			
			if (LaneIterator.version == "5.11.0.270")
			{
				lane_11_role.insert(i, LaneIterator.lane);
				lane_11_number.insert(i, LaneIterator.amount);
				totallane_11 = totallane_11 + LaneIterator.amount;
			}
			else
			{
				lane_14_role.insert(i, LaneIterator.lane);
				lane_14_number.insert(i, LaneIterator.amount);
				totallane_14 = totallane_14 + LaneIterator.amount;
			}
			i = i + 1;
		}
		
		if (lane_11_role.length == 0)
		{
			lane_11_role = [null, null, null, null];
			lane_11_number = [null, null, null, null];
			totallane_11 = 1;
		}
		if (lane_14_role.length == 0)
		{
			lane_14_role = [null, null, null, null];
			lane_14_number = [null, null, null, null];
			totallane_14 = 1;
		}
		
		// Winrate GameMode Data Generation
		var resultMode = championDao.selectMode(champion);
		var mode_11 = "";
		var mode_14 = "";
		
		for (ModeIterator in resultMode)
		{
			if (ModeIterator.version == "5.11.0.270")
			{
				mode_11 = mode_11 + Math.round(ModeIterator.amount*100)/100+",";
			}
			else
			{
				mode_14 = mode_14 + Math.round(ModeIterator.amount*100)/100+",";
			}
		}
		
		// KDA Data Generation
		var resultatKda = championDao.selectKDA(champion);
		var kda_11 = "";
		var kda_14 = "";
		
		for (KdaIterator in resultatKda)
		{
			if (KdaIterator.version == "5.11.0.270")
			{
				kda_11 = kda_11 + Math.round(KdaIterator.kills*100)/100 + "," +Math.round(KdaIterator.deaths*100)/100 + "," +Math.round(KdaIterator.assists*100)/100  + "," +Math.round(KdaIterator.wardsPlaced*100)/100;
			}
			else
			{
				kda_14 = kda_14 + Math.round(KdaIterator.kills*100)/100 + "," +Math.round(KdaIterator.deaths*100)/100 + "," +Math.round(KdaIterator.assists*100)/100  + "," +Math.round(KdaIterator.wardsPlaced*100)/100;
			}
		}
		
		// Item Data Generation
		var resultItem_11 = championDao.selectItem_11(champion);
		var resultItem_14 = championDao.selectItem_14(champion);
		
		// Displaying results
		for (r in results)
		{
			if (r.keyChampion == champion)
			{
				affichage = affichage+'<h2 class="sub-header">' +r.keyChampion +" "+ r.title +'</h2>
				
				<p align="center"><img src="http://ddragon.leagueoflegends.com/cdn/img/champion/splash/' + r.keyChampion + '_'+Math.round(Math.random())+'.jpg" width="100%"/></p>
				
				<h3>Winrate by lane</h3>
				
				<table align="center"><tr>
				<td><canvas id="lane_11" width="300" height="200"></canvas><br /><br />Patch 5.11</td>
				<td><div id="legendLane11"></div></td>
				<td><canvas id="lane_14" width="300" height="200"></canvas><br /><br />Patch 5.14</td>
				<td><div id="legendLane14"></div></td>
				</tr></table>
				
				<script>
				
				var lane_11_data = [
					{
						value: '+ Math.round(lane_11_number[0]/totallane_11*100*100)/100+',
						color:"#F7464A",
						highlight: "#FF5A5E",
						label: "'+ lane_11_role[0]+'",
					},
					{
						value: '+ Math.round(lane_11_number[1]/totallane_11*100*100)/100+',
						color: "#46BFBD",
						highlight: "#5AD3D1",
						label: "'+ lane_11_role[1]+'",
					},
					{
						value: '+ Math.round(lane_11_number[2]/totallane_11*100*100)/100+',
						color: "#FDB45C",
						highlight: "#FFC870",
						label: "'+ lane_11_role[2]+'",
					},
					{
						value: '+ Math.round(lane_11_number[3]/totallane_11*100*100)/100+',
						color: "#5da4c7",
						highlight: "#68b5db",
						label: "'+ lane_11_role[3]+'",
					}
				]
				
				var lane_14_data = [
					{
						value: '+ Math.round(lane_14_number[0]/totallane_14*100*100)/100+',
						color:"#F7464A",
						highlight: "#FF5A5E",
						label: "'+ lane_14_role[0]+'",
					},
					{
						value: '+ Math.round(lane_14_number[1]/totallane_14*100*100)/100+',
						color: "#46BFBD",
						highlight: "#5AD3D1",
						label: "'+ lane_14_role[1]+'",
					},
					{
						value: '+ Math.round(lane_14_number[2]/totallane_14*100*100)/100+',
						color: "#FDB45C",
						highlight: "#FFC870",
						label: "'+ lane_14_role[2]+'",
					},
					{
						value: '+ Math.round(lane_14_number[3]/totallane_14*100*100)/100+',
						color: "#5da4c7",
						highlight: "#68b5db",
						label: "'+ lane_14_role[3]+'",
					}
				]
				
				var lane_11 = document.getElementById("lane_11").getContext("2d");
				var Chart11 = new Chart(lane_11).Doughnut(lane_11_data, { segmentShowStroke : true, legendTemplate : \'<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<segments.length; i++){%><li><div class=\"comm-how\"><%=segments[i].value%>%</div><span style=\"background-color:<%=segments[i].fillColor%>\"></span><%if(segments[i].label){%><%=segments[i].label%><%}%></li><%}%></ul>\'} );
				document.getElementById("legendLane11").innerHTML = Chart11.generateLegend();
				
				var lane_14 = document.getElementById("lane_14").getContext("2d");
				var Chart14 = new Chart(lane_14).Doughnut(lane_14_data, { segmentShowStroke : true, legendTemplate : \'<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<segments.length; i++){%><li><div class=\"comm-how\"><%=segments[i].value%>%</div><span style=\"background-color:<%=segments[i].fillColor%>\"></span><%if(segments[i].label){%><%=segments[i].label%><%}%></li><%}%></ul>\'} );
				document.getElementById("legendLane14").innerHTML = Chart14.generateLegend();
				
				</script>
				
				<h3>Winrate by GameMode</h3>
				
				<table align="center"><tr>
				<td><canvas id="mode" width="600" height="400"></canvas></td>
				<td><div id="legendMode"></div></td>
				</tr></table>
				
				<script>
				
					var mode_data = {
						    labels: ["NORMAL_5x5_BLIND", "NORMAL_5x5_DRAFT", "RANKED_SOLO_5x5"],
							datasets: [
								{
									label: "Patch 5.11",
									fillColor: "rgba(220,220,220,0.5)",
									strokeColor: "rgba(220,220,220,0.8)",
									highlightFill: "rgba(220,220,220,0.75)",
									highlightStroke: "rgba(220,220,220,1)",
									data : ['+ mode_11.substr(0,-1)+']
								},
								{
									label: "Patch 5.14",
									fillColor: "rgba(151,187,205,0.5)",
									strokeColor: "rgba(151,187,205,0.8)",
									highlightFill: "rgba(151,187,205,0.75)",
									highlightStroke: "rgba(151,187,205,1)",
									data : ['+ mode_14.substr(0,-1)+']
								}
							]
						};

					var mode = document.getElementById("mode").getContext("2d");
					var ChartMode = new Chart(mode).Bar(mode_data, { barShowStroke : true} );
					document.getElementById("legendMode").innerHTML = ChartMode.generateLegend();
						
				</script>
				
				<h3>KDA</h3>
				
				<table align="center"><tr>
				<td><canvas id="kda" width="600" height="400"></canvas></td>
				<td><div id="legendKda"></div></td>
				</tr></table>
				
				<script>
				
					var data = {
						labels: ["Kills", "Deaths", "Assists","Wards Placed"],
						datasets: [
							{
								label: "Patch 5.11",
								fillColor: "rgba(220,220,220,0.2)",
								strokeColor: "rgba(220,220,220,1)",
								pointColor: "rgba(220,220,220,1)",
								pointStrokeColor: "#fff",
								pointHighlightFill: "#fff",
								pointHighlightStroke: "rgba(220,220,220,1)",
								data: ['+ kda_11+']
							},
							{
								label: "Patch 5.14",
								fillColor: "rgba(151,187,205,0.2)",
								strokeColor: "rgba(151,187,205,1)",
								pointColor: "rgba(151,187,205,1)",
								pointStrokeColor: "#fff",
								pointHighlightFill: "#fff",
								pointHighlightStroke: "rgba(151,187,205,1)",
								data: ['+ kda_14+']
							}
						]
					};


					var kda = document.getElementById("kda").getContext("2d");
					var RadarChart = new Chart(kda).Radar(data);
					document.getElementById("legendKda").innerHTML = RadarChart.generateLegend();
						
				</script>
				
				<h3>Items 5.11</h3><table><tr>';
				
				for (resultIterator_11 in resultItem_11)
				{
					affichage = affichage +'<td width="200"><img src="http://ddragon.leagueoflegends.com/cdn/5.11.1/img/item/'+resultIterator_11.item_id+'.png" /><br />' + resultIterator_11.name +'<br /></td>';
				}
				
				affichage = affichage + '</tr></table><h3>Items 5.14</h3><table><tr>';
				
				for (resultIterator_14 in resultItem_14)
				{
					affichage = affichage +'<td width="200"><img src="http://ddragon.leagueoflegends.com/cdn/5.14.1/img/item/'+resultIterator_14.item_id+'.png" /><br />' + resultIterator_14.name +'<br /></td>';
				}
				
				affichage = affichage + '</tr></table><br /><br />'+return new Footer().display();
				
			}
		}
		
		
		
		if (affichage == "")
		{
			Dispatch.run("/", new Map(), new ActionController());
		}
		
		return affichage;
	}
	
}