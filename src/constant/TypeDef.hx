package constant;

/**
 * Definition JSON file (Match)
 * @author tontien - EUW
 */

typedef Match = {
	var mapId:Int;
	var matchCreation:Int;
	var matchDuration:Int;
	var matchId:Int;
	var matchMode:String;
	var matchType:String;
	var matchVersion:String;
	var platformId:String;
	var queueType:String;
	var region:String;
	var season:String;
	var participantIdentities:Array<ParticipantIdentity>;
	var participants:Array<Participant>;
	var teams:Array<Team>;
}

typedef ParticipantIdentity = {
	var participantId:Int;
	var player:Player;
}

typedef Participant = {
	var championId:Int;
	var highestAchievedSeasonTier:String;
	var participantId:Int;
	var spell1Id:Int;
	var spell2Id:Int;
	var teamId:Int;
	var masteries:Array<Mastery>;
	var runes:Array<Rune>;
	var stats:ParticipantStats;
	var timeline:ParticipantTimeline;
}

typedef Team = {
	var baronKills:Int;
	var dominionVictoryScore:Int;
	var dragonKills:Int;
	var firstBaron:Bool;
	var firstBlood:Bool;
	var firstDragon:Bool;
	var firstInhibitor:Bool;
	var firstTower:Bool;
	var inhibitorKills:Int;
	var teamId:Int;
	var towerKills:Int;
	var vilemawKills:Int;
	var winner:Bool;
	var bans:Array<BannedChampion>;	
}

typedef Mastery = {
	var masteryId:Int;
	var rank:Int;
}

typedef Rune = {
	var rank:Int;
	var runeId:Int;
}

typedef Player = {
	var matchHistoryUri:String;
	var profileIcon:Int;
	var summonerId:Int;
	var summonerName:String;
}

typedef BannedChampion  = {
	var championId:Int;
	var pickTurn:Int;
}

typedef ParticipantStats = {
	var assists:Int;
	var champLevel:Int;
	var combatPlayerScore:Int;
	var deaths:Int;
	var doubleKills:Int;
	var firstBloodAssist:Bool;
	var firstBloodKill:Bool;
	var firstInhibitorAssist:Bool;
	var firstInhibitorKill:Bool;
	var firstTowerAssist:Bool;
	var firstTowerKill:Bool;
	var goldEarned:Int;
	var goldSpent:Int;
	var inhibitorKills:Int;
	var item0:Int;
	var item1:Int;
	var item2:Int;
	var item3:Int;
	var item4:Int;
	var item5:Int;
	var item6:Int;
	var killingSprees:Int;
	var kills:Int;
	var largestCriticalStrike:Int;
	var largestKillingSpree:Int;
	var largestMultiKill:Int;
	var magicDamageDealt:Int;
	var magicDamageDealtToChampions:Int;
	var magicDamageTaken:Int;
	var minionsKilled:Int;
	var neutralMinionsKilled:Int;
	var neutralMinionsKilledEnemyJungle:Int;
	var neutralMinionsKilledTeamJungle:Int;
	var nodeCapture:Int;
	var nodeCaptureAssist:Int;
	var nodeNeutralize:Int;
	var nodeNeutralizeAssist:Int;
	var objectivePlayerScore:Int;
	var pentaKills:Int;
	var physicalDamageDealt:Int;
	var physicalDamageDealtToChampions:Int;
	var physicalDamageTaken:Int;
	var quadraKills:Int;
	var sightWardsBoughtInGame:Int;
	var teamObjective:Int;
	var totalDamageDealt:Int;
	var totalDamageDealtToChampions:Int;
	var totalDamageTaken:Int;
	var totalHeal:Int;
	var totalPlayerScore:Int;
	var totalScoreRank:Int;
	var totalTimeCrowdControlDealt:Int;
	var totalUnitsHealed:Int;
	var towerKills:Int;
	var tripleKills:Int;
	var trueDamageDealt:Int;
	var trueDamageDealtToChampions:Int;
	var trueDamageTaken:Int;
	var unrealKills:Int;
	var visionWardsBoughtInGame:Int;
	var wardsKilled:Int;
	var wardsPlaced:Int;
	var winner:Int;
}

typedef ParticipantTimeline = {
	var creepsPerMinDeltas:ParticipantTimelineData;
	var csDiffPerMinDeltas:ParticipantTimelineData;
	var damageTakenDiffPerMinDeltas:ParticipantTimelineData;
	var damageTakenPerMinDeltas:ParticipantTimelineData;
	var goldPerMinDeltas:ParticipantTimelineData;
	var lane:String;
	var role:String;
	var xpPerMinDeltas:ParticipantTimelineData;
	var xpDiffPerMinDeltas:ParticipantTimelineData;	
}

typedef ParticipantTimelineData = {
	var tenToTwenty:Int;
	var thirtyToEnd:Int;
	var twentyToThirty:Int;
	var zeroToTen:Int;
}