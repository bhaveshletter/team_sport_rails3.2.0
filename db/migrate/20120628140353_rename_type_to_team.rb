class RenameTypeToTeam < ActiveRecord::Migration

  def change
    rename_column :teams, :type, :type_team
  end

end
