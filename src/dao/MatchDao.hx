package dao;

import sys.db.ResultSet;
import php.Lib;

/**
 * Database interface for Match Data
 * @author tontien - EUW
 */

class MatchDao
{
	var bdd:Bdd;
	
	public function new(bd:Bdd) 
	{
		bdd = bd;
	}
	
	// Check if the match is already in the database
	public function check(matchId:String)
	{
		var results:ResultSet = bdd.getCnx().request("select count(*) from Match where matchId=" + Std.parseFloat(matchId));
		return results.getResult(0);
	}
	
	// Parsing functions
	public function insertGeneral(mapId:Int, matchCreation:Int, matchDuration:Int, matchId:Int, matchMode:String, matchType:String, matchVersion:String, platformId:String, queueType:String, region:String, season:String)
	{
		bdd.getCnx().request("insert into Match (mapId, matchCreation, matchDuration, matchId, matchMode, matchType, matchVersion, platformId, queueType, region, season) values (" + mapId +"," + matchCreation +"," + matchDuration +"," + matchId +",'" + matchMode +"','" + matchType +"','" + matchVersion +"','" + platformId +"','" + queueType +"','" + region +"','" + season + "')");
	}
	
	public function insertPlayer(matchHistoryUri:String, profileIcon:Int, summonerId:Int, summonerName:String, participantId:Int, matchId:Int)
	{
		bdd.getCnx().request("insert into Player (matchHistoryUri, profileIcon, summonerId, summonerName, participantId, matchId) values ('" + matchHistoryUri +"'," + profileIcon +"," + summonerId +",'" + summonerName +"'," + participantId +"," + matchId + ")");
	}
	
	public function insertTeam(baronKills:Int, dominionVictoryScore:Int, dragonKills:Int, firstBaron:Bool, firstBlood:Bool, firstDragon:Bool, firstInhibitor:Bool, firstTower:Bool, inhibitorKills:Int, teamId:Int, towerKills:Int, vilemawKills:Int, winner:Bool, matchId:Int)
	{
		bdd.getCnx().request("insert into Team (baronKills, dominionVictoryScore, dragonKills, firstBaron, firstBlood, firstDragon, firstInhibitor, firstTower, inhibitorKills, teamId, towerKills, vilemawKills, winner, matchId) values (" + baronKills +"," + dominionVictoryScore +"," + dragonKills +"," + firstBaron +"," + firstBlood +"," + firstDragon +"," + firstInhibitor +"," + firstTower +"," + inhibitorKills +"," + teamId +"," + towerKills +"," + vilemawKills + "," + winner + "," + matchId + ")");
	}
	
	public function insertBan(championId:Int, pickTurn:Int, teamId:Int, matchId:Int)
	{
		bdd.getCnx().request("insert into Bannedchampion (championId, pickTurn, teamId, matchId) values (" + championId +"," + pickTurn +"," + teamId +"," + matchId + ")");
	}
	
	public function insertParticipant(championId:Int, highestAchievedSeasonTier:String, participantId:Int, spell1Id:Int, spell2Id:Int, teamId:Int, matchId:Int)
	{
		bdd.getCnx().request("insert into Participant (championId, highestAchievedSeasonTier, participantId, spell1Id, spell2Id, teamId, matchId) values (" + championId +",'" + highestAchievedSeasonTier +"'," + participantId +"," + spell1Id +"," + spell2Id +"," + teamId +"," + matchId + ")");
	}
	
	public function insertMastery(masteryId:Int, rank:Int, participantId:Int, matchId:Int)
	{
		bdd.getCnx().request("insert into Mastery (masteryId, rank, participantId, matchId) values (" + masteryId +"," + rank +"," + participantId +"," + matchId + ")");
	}
	
	public function insertRune(runeId:Int, rank:Int, participantId:Int, matchId:Int)
	{
		bdd.getCnx().request("insert into Rune (rank, runeId, participantId, matchId) values (" + rank +"," + runeId +"," + participantId +"," + matchId + ")");
	}
	
	public function insertStat(assists:Int, champLevel:Int, combatPlayerScore:Int, deaths:Int, doubleKills:Int, firstBloodAssist:Bool, firstBloodKill:Bool, firstInhibitorAssist:Bool, firstInhibitorKill:Bool, firstTowerAssist:Bool, firstTowerKill:Bool, goldEarned:Int, goldSpent:Int, inhibitorKills:Int, item0:Int, item1:Int, item2:Int, item3:Int, item4:Int, item5:Int, item6:Int, killingSprees:Int, kills:Int, largestCriticalStrike:Int, largestKillingSpree:Int, largestMultiKill:Int, magicDamageDealt:Int, magicDamageDealtToChampions:Int, magicDamageTaken:Int, minionsKilled:Int, neutralMinionsKilled:Int, neutralMinionsKilledEnemyJungle:Int, neutralMinionsKilledTeamJungle:Int, nodeCapture:Int, nodeCaptureAssist:Int, nodeNeutralize:Int, nodeNeutralizeAssist:Int, objectivePlayerScore:Int, pentaKills:Int, physicalDamageDealt:Int, physicalDamageDealtToChampions:Int, physicalDamageTaken:Int, quadraKills:Int, sightWardsBoughtInGame:Int, teamObjective:Int, totalDamageDealt:Int, totalDamageDealtToChampions:Int, totalDamageTaken:Int, totalHeal:Int, totalPlayerScore:Int, totalScoreRank:Int, totalTimeCrowdControlDealt:Int, totalUnitsHealed:Int, towerKills:Int, tripleKills:Int, trueDamageDealt:Int, trueDamageDealtToChampions:Int, trueDamageTaken:Int, unrealKills:Int, visionWardsBoughtInGame:Int, wardsKilled:Int, wardsPlaced:Int, winner:Int, participantId:Int, matchId:Int)
	{
		bdd.getCnx().request("insert into ParticipantStats (assists, champLevel, combatPlayerScore, deaths, doubleKills, firstBloodAssist, firstBloodKill, firstInhibitorAssist, firstInhibitorKill, firstTowerAssist, firstTowerKill, goldEarned, goldSpent, inhibitorKills, item0, item1, item2, item3, item4, item5, item6, killingSprees, kills, largestCriticalStrike, largestKillingSpree, largestMultiKill, magicDamageDealt, magicDamageDealtToChampions, magicDamageTaken, minionsKilled, neutralMinionsKilled, neutralMinionsKilledEnemyJungle, neutralMinionsKilledTeamJungle, nodeCapture, nodeCaptureAssist, nodeNeutralize, nodeNeutralizeAssist, objectivePlayerScore, pentaKills, physicalDamageDealt, physicalDamageDealtToChampions, physicalDamageTaken, quadraKills, sightWardsBoughtInGame, teamObjective, totalDamageDealt, totalDamageDealtToChampions, totalDamageTaken, totalHeal, totalPlayerScore, totalScoreRank, totalTimeCrowdControlDealt, totalUnitsHealed, towerKills, tripleKills, trueDamageDealt, trueDamageDealtToChampions, trueDamageTaken, unrealKills, visionWardsBoughtInGame, wardsKilled, wardsPlaced, winner, participantId, matchId) values (" + assists + "," + champLevel + "," + combatPlayerScore + "," + deaths + "," + doubleKills + "," + firstBloodAssist + "," + firstBloodKill + "," + firstInhibitorAssist + "," + firstInhibitorKill + "," + firstTowerAssist + "," + firstTowerKill + "," + goldEarned + "," + goldSpent + "," + inhibitorKills + "," + item0 + "," + item1 + "," + item2 + "," + item3 + "," + item4 + "," + item5 + "," + item6 + "," + killingSprees + "," + kills + "," + largestCriticalStrike + "," + largestKillingSpree + "," + largestMultiKill + "," + magicDamageDealt + "," + magicDamageDealtToChampions + "," + magicDamageTaken + "," + minionsKilled + "," + neutralMinionsKilled + "," + neutralMinionsKilledEnemyJungle + "," + neutralMinionsKilledTeamJungle + "," + nodeCapture + "," + nodeCaptureAssist + "," + nodeNeutralize + "," + nodeNeutralizeAssist + "," + objectivePlayerScore + "," + pentaKills + "," + physicalDamageDealt + "," + physicalDamageDealtToChampions + "," + physicalDamageTaken + "," + quadraKills + "," + sightWardsBoughtInGame + "," + teamObjective + "," + totalDamageDealt + "," + totalDamageDealtToChampions + "," + totalDamageTaken + "," + totalHeal + "," + totalPlayerScore + "," + totalScoreRank + "," + totalTimeCrowdControlDealt + "," + totalUnitsHealed + "," + towerKills + "," + tripleKills + "," + trueDamageDealt + "," + trueDamageDealtToChampions + "," + trueDamageTaken + "," + unrealKills + "," + visionWardsBoughtInGame + "," + wardsKilled + "," + wardsPlaced + "," + winner + "," + participantId + "," + matchId + ")");
	}
	
	public function insertParticipantTimeline(tenToTwenty:Int, thirtyToEnd:Int, twentyToThirty:Int, zeroToTen:Int, name:String, lane:String, role:String, participantId:Int, matchId:Int)
	{
		bdd.getCnx().request("insert into ParticipantTimeline (tenToTwenty, thirtyToEnd, twentyToThirty, zeroToTen, name, lane, role, participantId, matchId) values (" + tenToTwenty + "," + thirtyToEnd + "," + twentyToThirty + "," + zeroToTen + ",'" + name + "','" + lane + "','" + role + "'," + participantId + "," + matchId + ")");
	}
	
}
