class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :type, :default => nil
      t.string :location, :default => nil
      t.string :name, :default => nil
      t.string :alias, :default => nil
      t.string :display_name, :default => nil
      t.string :primary_color, :default => nil
      t.string :shorts_color, :default => nil
      t.integer :wins, :default => 0
      t.integer :ties, :default => 0
      t.integer :losses, :default => 0
      t.decimal :pct, :precision => 8, :scale => 3, :default => 0.0
      t.integer :linescore_score, :default => 0
      t.integer :linescore_shots, :default => 0
      t.integer :half_half, :default => 0
      t.integer :half_score, :default => 0
      t.integer :half_shots, :default => 0
      t.string :formation, :default => nil
      t.timestamps
    end
  end
end

