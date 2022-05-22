class detailHeroes {
  int? matchId;
  int? startTime;
  int? duration;
  bool? radiantWin;
  int? leagueid;
  String? leagueName;
  bool? radiant;
  int? playerSlot;
  int? accountId;
  int? kills;
  int? deaths;
  int? assists;

  detailHeroes(
      {this.matchId,
        this.startTime,
        this.duration,
        this.radiantWin,
        this.leagueid,
        this.leagueName,
        this.radiant,
        this.playerSlot,
        this.accountId,
        this.kills,
        this.deaths,
        this.assists});

  detailHeroes.fromJson(Map<String, dynamic> json) {
    matchId = json['match_id'];
    startTime = json['start_time'];
    duration = json['duration'];
    radiantWin = json['radiant_win'];
    leagueid = json['leagueid'];
    leagueName = json['league_name'];
    radiant = json['radiant'];
    playerSlot = json['player_slot'];
    accountId = json['account_id'];
    kills = json['kills'];
    deaths = json['deaths'];
    assists = json['assists'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['match_id'] = this.matchId;
    data['start_time'] = this.startTime;
    data['duration'] = this.duration;
    data['radiant_win'] = this.radiantWin;
    data['leagueid'] = this.leagueid;
    data['league_name'] = this.leagueName;
    data['radiant'] = this.radiant;
    data['player_slot'] = this.playerSlot;
    data['account_id'] = this.accountId;
    data['kills'] = this.kills;
    data['deaths'] = this.deaths;
    data['assists'] = this.assists;
    return data;
  }
}
