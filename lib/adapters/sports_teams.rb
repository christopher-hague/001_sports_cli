class Adapters::TeamStats
  @@url = "https://www.mysportsfeeds.com/api/feed/sample/pull/nba/2015-2016-regular/overall_team_standings.json?"

  def fetch_team_data
    # going to the url passed as the arg and copying it as a string
    result = RestClient.get(@@url)
    hash = JSON.parse(result)
  end

  def create_team(val)
    team = Team.new do |t|
      t.name = val["team"]["Name"]
      t.city = val["team"]["City"]
      t.wins = val["stats"]["Wins"]["#text"]
      t.losses = val["stats"]["Losses"]["#text"]
      t.win_pct = val["stats"]["WinPct"]["#text"]
      t.pts = val["stats"]["Pts"]["#text"]
      t.ppg = val["stats"]["PtsPerGame"]["#text"]
      t.fg_pct = val["stats"]["FgPct"]["#text"]
      t.fg_3pt_pct = val["stats"]["Fg3PtPct"]["#text"]
      t.reb = val["stats"]["Reb"]["#text"]
      t.reb_pg = val["stats"]["RebPerGame"]["#text"]
      t.off_reb = val["stats"]["OffReb"]["#text"]
      t.off_reb_pg = val["stats"]["OffRebPerGame"]["#text"]
      t.ast = val["stats"]["Ast"]["#text"]
      t.ast_pg = val["stats"]["AstPerGame"]["#text"]
      t.tov = val["stats"]["Tov"]["#text"]
      t.tov_pg = val["stats"]["TovPerGame"]["#text"]
      t.stl = val["stats"]["Stl"]["#text"]
      t.stl_pg = val["stats"]["StlPerGame"]["#text"]
    end
  end

  def seed_db
    teams = fetch_team_data["overallteamstandings"]["teamstandingsentry"]
    teams.each do |val|
      t = create_team(val)
      Team.find_or_create_by(t.attributes)
    end
  end

end

Adapters::TeamStats.new.seed_db
