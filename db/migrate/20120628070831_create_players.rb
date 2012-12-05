class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :team_id
      t.boolean :bench, :default => false
      t.string :first_name, :default => nil
      t.string :last_name, :default => nil
      t.string :shirt_name, :default => nil
      t.string :full_first, :default => nil
      t.string :full_last, :default => nil
      t.string :position_english, :default => nil
      t.string :position_spanish, :default => nil
      t.integer :number, :default => 0
      t.integer :goals, :default => 0
      t.integer :assists, :default => 0
      t.integer :shots, :default => 0
      t.integer :on_goal_shots, :default => 0
      t.integer :crosses, :default => 0
      t.integer :penalty_kicks_shots, :default => 0
      t.integer :penalty_kicks_goals, :default => 0
      t.integer :foul_committed, :default => 0
      t.integer :foul_suffered, :default => 0
      t.integer :offsides, :default => 0
      t.integer :corner_kicks, :default => 0
      t.integer :goal_mouth_blocks, :default => 0
      t.integer :yellow_cards, :default => 0
      t.integer :red_cards, :default => 0
      t.string :starter, :default => nil
      t.integer :formation, :default => 0
      t.string :touch_total, :default => nil
      t.string :touch_passes, :default => nil
      t.string :touch_interceptions, :default => nil
      t.string :touch_blocks, :default => nil
      t.string :tackles, :default => nil
      t.string :aveg_pos_location, :default => nil
      t.timestamps
    end
  end
end

