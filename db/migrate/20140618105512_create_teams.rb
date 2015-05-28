class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.string :sport, null: false
      t.belongs_to :coach

      t.timestamps
    end
  end
end
