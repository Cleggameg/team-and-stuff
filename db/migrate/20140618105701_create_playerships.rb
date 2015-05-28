class CreatePlayerships < ActiveRecord::Migration
  def change
    create_table :playerships do |t|
      t.belongs_to :user, null: false
      t.belongs_to :team, null: false
      t.boolean :captain, default: false

      t.timestamps
    end
  end
end
