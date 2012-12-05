@file = "#{Rails.root}/public/data.xml"  # To initialize xml file to object

@data = Nokogiri::XML(open(@file))  # To read xml file

# START ---------------- Teams creation  -------------
# To insert visiting-team into database

@data.search("//visiting-team").each do |i|
  @team = Team.new  # To initialize new object for visiting-team
  @team.type_team = 'visiting-team'

  i.search('.//team-info').each do |ti|
    @team.location = ti.attribute('location').value
    @team.name = ti.attribute('name').value
    @team.alias = ti.attribute('alias').value
    @team.display_name = ti.attribute('display-name').value
  end

  i.search('.//team').each do |t|
    @team.primary_color = t.attribute('primary-color').value
    @team.shorts_color = t.attribute('shorts-color').value
  end

  i.search('.//record').each do |r|
    @team.wins = r.attribute('wins').value
    @team.ties = r.attribute('ties').value
    @team.losses = r.attribute('losses').value
    @team.pct = r.attribute('pct').value
  end

  i.search('.//linescore').each do |l|
    @team.linescore_score = l.attribute('score').value
    @team.linescore_shots = l.attribute('shots').value
  end

  i.search('.//linescore/half').each do |h|
    @team.half_half = h.attribute('half').value
    @team.half_score = h.attribute('score').value
    @team.half_shots = h.attribute('shots').value
  end

  i.search('.//formation').each do |f|
    @team.formation = f.attribute('formation').value
  end

  @team.save # To save visiting-team
end

# To insert home-team into database

@data.search("//home-team").each do |j|
  @team = Team.new  # To initialize new object for home-team
  @team.type_team = 'home-team'

  j.search('.//team-info').each do |ti|
    @team.location = ti.attribute('location').value
    @team.name = ti.attribute('name').value
    @team.alias = ti.attribute('alias').value
    @team.display_name = ti.attribute('display-name').value
  end

  j.search('.//team').each do |t|
    @team.primary_color = t.attribute('primary-color').value
    @team.shorts_color = t.attribute('shorts-color').value
  end

  j.search('.//record').each do |r|
    @team.wins = r.attribute('wins').value
    @team.ties = r.attribute('ties').value
    @team.losses = r.attribute('losses').value
    @team.pct = r.attribute('pct').value
  end

  j.search('.//linescore').each do |l|
    @team.linescore_score = l.attribute('score').value
    @team.linescore_shots = l.attribute('shots').value
  end

  j.search('.//linescore/half').each do |h|
    @team.half_half = h.attribute('half').value
    @team.half_score = h.attribute('score').value
    @team.half_shots = h.attribute('shots').value
  end

  j.search('.//formation').each do |f|
    @team.formation = f.attribute('formation').value
  end

  @team.save   # To save home-team
end

# END ---------------- Teams creation  -------------

# START ---------------- Players creation  -------------

@data.search("//players").each do |i|
  if i.attribute('team').value == 'visitors'
    @team = Team.find_by_type_team("visiting-team")
    @vt = i.search(".//player")

    @vt.each do |j|
      @player = @team.players.new  # To initialize new object for visiting-team's player
      j.search(".//name").each do |name|
        @player.first_name = name.attribute('first-name').value
        @player.last_name = name.attribute('last-name').value
        @player.shirt_name = name.attribute('shirt-name').value
        @player.full_first = name.attribute('full-first').value
        @player.full_last = name.attribute('full-last').value
      end
      j.search(".//player-position").each do |pp|
        @player.position_english = pp.attribute('english').value
        @player.position_spanish = pp.attribute('spanish').value
      end
      j.search(".//player-number").each do |pn|
        @player.number = pn.attribute('number').value
      end
      j.search(".//goals").each do |goal|
        @player.goals = goal.attribute('goals').value
      end
      j.search(".//assists").each do |assist|
        @player.assists = assist.attribute('assists').value
      end
      j.search(".//shots").each do |shot|
        @player.shots = shot.attribute('shots').value
      end
      j.search(".//shots-on-goal").each do |sog|
        @player.on_goal_shots = sog.attribute('shots').value
      end
      j.search(".//crosses").each do |crs|
        @player.crosses = crs.attribute('crosses').value
      end
      j.search(".//penalty-kicks").each do |pk|
        @player.penalty_kicks_shots = pk.attribute('shots').value
        @player.penalty_kicks_goals = pk.attribute('goals').value
      end
      j.search(".//fouls").each do |fl|
        @player.foul_committed = fl.attribute('committed').value
        @player.foul_suffered = fl.attribute('suffered').value
      end
      j.search(".//offsides").each do |of|
        @player.offsides = of.attribute('offsides').value
      end
      j.search(".//corner-kicks").each do |ck|
        @player.corner_kicks = ck.attribute('corner-kicks').value
      end
      j.search(".//goal-mouth-blocks").each do |gmb|
        @player.goal_mouth_blocks = gmb.attribute('blocks').value
      end
      j.search(".//yellow-cards").each do |yc|
        @player.yellow_cards = yc.attribute('yellow-cards').value
      end
      j.search(".//red-cards").each do |rc|
        @player.red_cards = rc.attribute('red-cards').value
      end
      j.search(".//starter").each do |st|
        @player.starter = st.attribute('starter').value
        @player.formation = st.attribute('formation').value
      end
      j.search(".//touches").each do |tc|
        @player.touch_total = tc.attribute('total').value
        @player.touch_passes = tc.attribute('passes').value
        @player.touch_interceptions = tc.attribute('interceptions').value
        @player.touch_blocks = tc.attribute('blocks').value
      end
      j.search(".//tackles").each do |tcl|
        @player.tackles = tcl.attribute('tackles').value
      end
      j.search(".//average-position").each do |avg_po|
        @player.aveg_pos_location = avg_po.attribute('location').value
      end
      @player.save   # To save visiting-team's player
    end

  end

  if i.attribute('team').value == 'home'
    @team = Team.find_by_type_team("home-team")
    @ht = i.search(".//player")
    @ht.each do |j|
      @player = @team.players.new  # To initialize new object for home-team's player
      j.search(".//name").each do |name|
        @player.first_name = name.attribute('first-name').value
        @player.last_name = name.attribute('last-name').value
        @player.shirt_name = name.attribute('shirt-name').value
        @player.full_first = name.attribute('full-first').value
        @player.full_last = name.attribute('full-last').value
      end
      j.search(".//player-position").each do |pp|
        @player.position_english = pp.attribute('english').value
        @player.position_spanish = pp.attribute('spanish').value
      end
      j.search(".//player-number").each do |pn|
        @player.number = pn.attribute('number').value
      end
      j.search(".//goals").each do |goal|
        @player.goals = goal.attribute('goals').value
      end
      j.search(".//assists").each do |assist|
        @player.assists = assist.attribute('assists').value
      end
      j.search(".//shots").each do |shot|
        @player.shots = shot.attribute('shots').value
      end
      j.search(".//shots-on-goal").each do |sog|
        @player.on_goal_shots = sog.attribute('shots').value
      end
      j.search(".//crosses").each do |crs|
        @player.crosses = crs.attribute('crosses').value
      end
      j.search(".//penalty-kicks").each do |pk|
        @player.penalty_kicks_shots = pk.attribute('shots').value
        @player.penalty_kicks_goals = pk.attribute('goals').value
      end
      j.search(".//fouls").each do |fl|
        @player.foul_committed = fl.attribute('committed').value
        @player.foul_suffered = fl.attribute('suffered').value
      end
      j.search(".//offsides").each do |of|
        @player.offsides = of.attribute('offsides').value
      end
      j.search(".//corner-kicks").each do |ck|
        @player.corner_kicks = ck.attribute('corner-kicks').value
      end
      j.search(".//goal-mouth-blocks").each do |gmb|
        @player.goal_mouth_blocks = gmb.attribute('blocks').value
      end
      j.search(".//yellow-cards").each do |yc|
        @player.yellow_cards = yc.attribute('yellow-cards').value
      end
      j.search(".//red-cards").each do |rc|
        @player.red_cards = rc.attribute('red-cards').value
      end
      j.search(".//starter").each do |st|
        @player.starter = st.attribute('starter').value
        @player.formation = st.attribute('formation').value
      end
      j.search(".//touches").each do |tc|
        @player.touch_total = tc.attribute('total').value
        @player.touch_passes = tc.attribute('passes').value
        @player.touch_interceptions = tc.attribute('interceptions').value
        @player.touch_blocks = tc.attribute('blocks').value
      end
      j.search(".//tackles").each do |tcl|
        @player.tackles = tcl.attribute('tackles').value
      end
      j.search(".//average-position").each do |avg_po|
        @player.aveg_pos_location = avg_po.attribute('location').value
      end
      @player.save   # To save home-team's player
    end

  end

end

# END ---------------- Players creation  -------------

# START ---------------- Players creation of who are on bench -------------

@data.search("//bench").each do |i|
  if i.attribute('team').value == 'visitors'
    @team = Team.find_by_type_team("visiting-team")
    @vtb = i.search(".//player")
    @vtb.each do |j|
      @player = @team.players.new   # To initialize visiting-team's player who is on bench
      @player.bench = true
      j.search(".//name").each do |name|
        @player.first_name = name.attribute('first-name').value
        @player.last_name = name.attribute('last-name').value
        @player.shirt_name = name.attribute('shirt-name').value
        @player.full_first = name.attribute('full-first').value
        @player.full_last = name.attribute('full-last').value
      end
      j.search(".//player-position").each do |pp|
        @player.position_english = pp.attribute('english').value
        @player.position_spanish = pp.attribute('spanish').value
      end
      j.search(".//player-number").each do |pn|
        @player.number = pn.attribute('number').value
      end
      @player.save   # To save visiting-team's player who is on bench
    end
  end

  if i.attribute('team').value == 'home'
    @team = Team.find_by_type_team("home-team")
    @htb = i.search(".//player")
    @htb.each do |j|
      @player = @team.players.new   # To initialize home-team's player who is on bench
      @player.bench = true
      j.search(".//name").each do |name|
        @player.first_name = name.attribute('first-name').value
        @player.last_name = name.attribute('last-name').value
        @player.shirt_name = name.attribute('shirt-name').value
        @player.full_first = name.attribute('full-first').value
        @player.full_last = name.attribute('full-last').value
      end
      j.search(".//player-position").each do |pp|
        @player.position_english = pp.attribute('english').value
        @player.position_spanish = pp.attribute('spanish').value
      end
      j.search(".//player-number").each do |pn|
        @player.number = pn.attribute('number').value
      end
      @player.save   # To save home-team's player who is on bench
    end
  end

end

# END ---------------- Players creation of who are on bench -------------