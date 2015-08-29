package parser;

import constant.Constant;
import constant.TypeDef;
import dao.Bdd;
import dao.MatchDao;
import php.Lib;
import haxe.Http;

/**
 * Class to parse data coming from RiotGames API (Match)
 * @author tontien - EUW
 */
class Parser
{

	public function new() 
	{
		
	}
	
	public function parser(id:String)
	{
		var s = Http.requestUrl("https://" + Constant.EUW_SERVER +"/api/lol/euw/v2.2/match/" + id + "?api_key=" + Constant.API_KEY);
		var matchline:Match = haxe.Json.parse(s);
		
		var bdd = new Bdd();
		var matchdao = new MatchDao(bdd);
		
		if (Std.parseInt(matchdao.check(id))==0) {
			matchdao.insertGeneral(matchline.mapId, matchline.matchCreation, matchline.matchDuration, matchline.matchId, matchline.matchMode, matchline.matchType, matchline.matchVersion, matchline.platformId, matchline.queueType, matchline.region, matchline.season);
			
			for (participantIdentity in matchline.participantIdentities) {
				if (participantIdentity.player != null)
				{
					matchdao.insertPlayer(participantIdentity.player.matchHistoryUri, participantIdentity.player.profileIcon, participantIdentity.player.summonerId, participantIdentity.player.summonerName, participantIdentity.participantId, matchline.matchId);
				}
			}

			for (team in matchline.teams) {
				matchdao.insertTeam(team.baronKills, team.dominionVictoryScore, team.dragonKills, team.firstBaron, team.firstBlood, team.firstDragon, team.firstInhibitor, team.firstTower, team.inhibitorKills, team.teamId, team.towerKills, team.vilemawKills, team.winner, matchline.matchId);
				
				if (team.bans != null){
					for (ban in team.bans) {
						matchdao.insertBan(ban.championId, ban.pickTurn, team.teamId, matchline.matchId);
					}
				}
			}
			
			for (participant in matchline.participants) {
				matchdao.insertParticipant(participant.championId, participant.highestAchievedSeasonTier, participant.participantId, participant.spell1Id, participant.spell2Id, participant.teamId, matchline.matchId);
				
				if (participant.masteries != null)
				{
					for (mastery in participant.masteries) {
						matchdao.insertMastery(mastery.masteryId, mastery.rank, participant.participantId, matchline.matchId);
					}
				}
				
				if (participant.runes != null)
				{
					for (rune in participant.runes) {
						matchdao.insertRune(rune.runeId, rune.rank, participant.participantId, matchline.matchId);
					}
				}
				
				matchdao.insertStat(participant.stats.assists, participant.stats.champLevel, participant.stats.combatPlayerScore, participant.stats.deaths, participant.stats.doubleKills, participant.stats.firstBloodAssist, participant.stats.firstBloodKill, participant.stats.firstInhibitorAssist, participant.stats.firstInhibitorKill, participant.stats.firstTowerAssist, participant.stats.firstTowerKill, participant.stats.goldEarned, participant.stats.goldSpent, participant.stats.inhibitorKills, participant.stats.item0, participant.stats.item1, participant.stats.item2, participant.stats.item3, participant.stats.item4, participant.stats.item5, participant.stats.item6, participant.stats.killingSprees, participant.stats.kills, participant.stats.largestCriticalStrike, participant.stats.largestKillingSpree, participant.stats.largestMultiKill, participant.stats.magicDamageDealt, participant.stats.magicDamageDealtToChampions, participant.stats.magicDamageTaken, participant.stats.minionsKilled, participant.stats.neutralMinionsKilled, participant.stats.neutralMinionsKilledEnemyJungle, participant.stats.neutralMinionsKilledTeamJungle, participant.stats.nodeCapture, participant.stats.nodeCaptureAssist, participant.stats.nodeNeutralize, participant.stats.nodeNeutralizeAssist,  participant.stats.objectivePlayerScore, participant.stats.pentaKills, participant.stats.physicalDamageDealt, participant.stats.physicalDamageDealtToChampions, participant.stats.physicalDamageTaken, participant.stats.quadraKills, participant.stats.sightWardsBoughtInGame, participant.stats.teamObjective, participant.stats.totalDamageDealt, participant.stats.totalDamageDealtToChampions, participant.stats.totalDamageTaken, participant.stats.totalHeal, participant.stats.totalPlayerScore, participant.stats.totalScoreRank, participant.stats.totalTimeCrowdControlDealt, participant.stats.totalUnitsHealed, participant.stats.towerKills, participant.stats.tripleKills, participant.stats.trueDamageDealt, participant.stats.trueDamageDealtToChampions, participant.stats.trueDamageTaken, participant.stats.unrealKills, participant.stats.visionWardsBoughtInGame, participant.stats.wardsKilled, participant.stats.wardsPlaced, participant.stats.winner, participant.participantId, matchline.matchId);
				
				if (participant.timeline.creepsPerMinDeltas != null){
					matchdao.insertParticipantTimeline(participant.timeline.creepsPerMinDeltas.tenToTwenty, participant.timeline.creepsPerMinDeltas.thirtyToEnd, participant.timeline.creepsPerMinDeltas.twentyToThirty, participant.timeline.creepsPerMinDeltas.zeroToTen, "creepsPerMinDeltas", participant.timeline.lane, participant.timeline.role, participant.participantId, matchline.matchId);
				}
				
				if (participant.timeline.csDiffPerMinDeltas != null){
					matchdao.insertParticipantTimeline(participant.timeline.csDiffPerMinDeltas.tenToTwenty, participant.timeline.csDiffPerMinDeltas.thirtyToEnd, participant.timeline.csDiffPerMinDeltas.twentyToThirty, participant.timeline.csDiffPerMinDeltas.zeroToTen, "csDiffPerMinDeltas", participant.timeline.lane, participant.timeline.role, participant.participantId, matchline.matchId);
				}
				
				if (participant.timeline.damageTakenDiffPerMinDeltas != null){
					matchdao.insertParticipantTimeline(participant.timeline.damageTakenDiffPerMinDeltas.tenToTwenty, participant.timeline.damageTakenDiffPerMinDeltas.thirtyToEnd, participant.timeline.damageTakenDiffPerMinDeltas.twentyToThirty, participant.timeline.damageTakenDiffPerMinDeltas.zeroToTen, "damageTakenDiffPerMinDeltas", participant.timeline.lane, participant.timeline.role, participant.participantId, matchline.matchId);
				}
				
				if (participant.timeline.damageTakenPerMinDeltas != null){
					matchdao.insertParticipantTimeline(participant.timeline.damageTakenPerMinDeltas.tenToTwenty, participant.timeline.damageTakenPerMinDeltas.thirtyToEnd, participant.timeline.damageTakenPerMinDeltas.twentyToThirty, participant.timeline.damageTakenPerMinDeltas.zeroToTen, "damageTakenPerMinDeltas", participant.timeline.lane, participant.timeline.role, participant.participantId, matchline.matchId);
				}
				
				if (participant.timeline.goldPerMinDeltas != null){
					matchdao.insertParticipantTimeline(participant.timeline.goldPerMinDeltas.tenToTwenty, participant.timeline.goldPerMinDeltas.thirtyToEnd, participant.timeline.goldPerMinDeltas.twentyToThirty, participant.timeline.goldPerMinDeltas.zeroToTen, "goldPerMinDeltas", participant.timeline.lane, participant.timeline.role, participant.participantId, matchline.matchId);
				}
				
				if (participant.timeline.xpDiffPerMinDeltas != null){
					matchdao.insertParticipantTimeline(participant.timeline.xpDiffPerMinDeltas.tenToTwenty, participant.timeline.xpDiffPerMinDeltas.thirtyToEnd, participant.timeline.xpDiffPerMinDeltas.twentyToThirty, participant.timeline.xpDiffPerMinDeltas.zeroToTen, "xpDiffPerMinDeltas", participant.timeline.lane, participant.timeline.role, participant.participantId, matchline.matchId);
				}
				
				if (participant.timeline.xpPerMinDeltas != null){
					matchdao.insertParticipantTimeline(participant.timeline.xpPerMinDeltas.tenToTwenty, participant.timeline.xpPerMinDeltas.thirtyToEnd, participant.timeline.xpPerMinDeltas.twentyToThirty, participant.timeline.xpPerMinDeltas.zeroToTen, "xpPerMinDeltas", participant.timeline.lane, participant.timeline.role, participant.participantId, matchline.matchId);
				}
			}
		}
		
		
	}
	
	
	
}